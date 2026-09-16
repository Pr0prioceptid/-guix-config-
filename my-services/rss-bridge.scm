(define-module (my-services rss-bridge)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (guix gexp)
  #:use-module (my-packages rss-bridge)
  #:use-module (gnu services web)
  #:use-module (gnu packages php)
  ;;both guix utils and gnu packages are for version-major & package-version
  #:use-module (guix utils)
  #:use-module (guix packages))

(define-public my-rss-bridge-service 
               (simple-service 
                 'my-rss-bridge 
                 nginx-service-type
                 (list (nginx-server-configuration 
                         (listen '("80")) 
                         (server-name '("rss.bridge")) 
                         (root (file-append my-rss-bridge "/share/rss-bridge"))
                         (index (list "index.php"))
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
                                     (list "try_files $uri /index.php;")))
                                 (nginx-location-configuration 
                                   (uri "= /index.php") 
                                   (body 
                                     (list ;;relative path for include has a root of /etc/nginx. 
                                           ;;/etc/nginx contains links to nginx share/nginx/conf/. 
                                           ;;I could provide an absolute path here, but the brevity of the relative solution is appealing.  
                                           "include fastcgi.conf;" 
                                           "fastcgi_read_timeout 45s;" 
                                           #~(string-append 
                                               "fastcgi_pass unix:/var/run/php" 
                                               #$(version-major (package-version php)) 
                                               "-fpm.sock;"))))
                                 (nginx-location-configuration 
                                   (uri "= /favicon.ico")
                                   (body
                                     (list "access_log off;")))
                                 (nginx-location-configuration 
                                   (uri "= /robots.txt")
                                   (body
                                     (list "access_log off;")))))))))
