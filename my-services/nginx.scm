(define-module (my-services nginx)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (guix gexp)
  #:use-module (my-packages rss-bridge)
  #:use-module (gnu services web)
  #:use-module (gnu packages php)
  #:use-module (gnu packages web)
  ;;both guix utils and gnu packages are for version-major & package-version
  #:use-module (guix utils)
  #:use-module (guix packages))

(define-public my-nginx-service
               (service 
                 nginx-service-type 
                 (nginx-configuration 
                   ;;the normal configuration won't easily allow me to remove
                   ;;root and index fields from server, so I have to provide a
                   ;;file instead.
                   (file (mixed-text-file
                              "nginx.conf"
                              "user nginx nginx;\n"
                              "pid /var/run/nginx/pid;\n"
                              "error_log /var/log/nginx/error.log error;\n"
                              "events { }\n"
                              "http {\n"
                              "    client_body_temp_path /var/run/nginx/client_body_temp;\n"
                              "    proxy_temp_path /var/run/nginx/proxy_temp;\n"
                              "    fastcgi_temp_path /var/run/nginx/fastcgi_temp;\n"
                              "    uwsgi_temp_path /var/run/nginx/uwsgi_temp;\n"
                              "    scgi_temp_path /var/run/nginx/scgi_temp;\n"
                              "    access_log /var/log/nginx/access.log combined;\n"
                              "    include " nginx "/share/nginx/conf/mime.types;\n"
                              "\n"
                              "    server {\n"
                              "        listen 80;\n"
                              "        server_name rss.bridge;\n"
                              "        server_tokens off;\n"
                              "\n"
                              "        location /static/ {\n"
                              "            alias " my-rss-bridge "/share/rss-bridge/static/;\n"
                              "        }\n"
                              "\n"
                              "        location = / {\n"
                              "            root " my-rss-bridge "/share/rss-bridge;\n"
                              "            include fastcgi.conf;\n"
                              "            fastcgi_read_timeout 45s;\n"
                              "            fastcgi_pass unix:/var/run/php8-fpm.sock;\n"
                              "        }\n"
                              "    }\n"
                              "}\n"))
                   (server-blocks 
                     ;;Below is ignored when file is provided,
                     ;;I'm keeping this here since it produces the above file with root and index entries.
                     (list (nginx-server-configuration 
                             (listen '("80")) 
                             (server-name '("rss.bridge")) 
                             (locations 
                               (list (nginx-location-configuration 
                                       (uri "/static/") 
                                       (body 
                                         (list #~(string-append 
                                                   "alias " 
                                                   #$(file-append my-rss-bridge "/share/rss-bridge/static/") 
                                                   ";")))) 
                                     (nginx-location-configuration 
                                       (uri "= /") 
                                       (body 
                                         (list #~(string-append 
                                                   "root " 
                                                   #$(file-append my-rss-bridge "/share/rss-bridge") 
                                                   ";") 
                                               ;;relative path for include has a root of /etc/nginx. 
                                               ;;/etc/nginx contains links to nginx share/nginx/conf/. 
                                               ;;I could provide an absolute path here, but the brevity of the relative solution is appealing.  
                                               "include fastcgi.conf;" 
                                               "fastcgi_read_timeout 45s;" 
                                               #~(string-append 
                                                   "fastcgi_pass unix:/var/run/php" 
                                                   #$(version-major (package-version php)) 
                                                   "-fpm.sock;"))))))))))))
