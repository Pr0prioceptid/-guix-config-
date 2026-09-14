(define-module (my-services rss-bridge)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (guix gexp)
  #:use-module (gnu packages web)
  #:use-module (gnu services web))

(define-public my-rss-bridge-service 
               (service (service-type (name 'rss-bridge) 
                                      (extensions (list (service-extension nginx-service-type 
                                                                           (const (list (nginx-server-configuration 
                                                                                          (listen '("80")) 
                                                                                          (server-name '("rss.bridge")) 
                                                                                          (locations 
                                                                                            (list (nginx-location-configuration 
                                                                                                    (uri "/static/") 
                                                                                                    (body 
                                                                                                      (list 
                                                                                                        #~(string-append 
                                                                                                            "alias " 
                                                                                                            #$(file-append rss-bridge "/share/rss-bridge/static/") 
                                                                                                            ";")))) 
                                                                                                  (nginx-location-configuration 
                                                                                                    (uri "= /") 
                                                                                                    (body 
                                                                                                      (list 
                                                                                                        #~(string-append 
                                                                                                            "root " 
                                                                                                            #$(file-append rss-bridge "/share/rss-bridge") 
                                                                                                            ";") 
                                                                                                        ;;relative path for include has a root of /etc/nginx, which contains links to share/nginx/conf/ files under the nginx package in gnu/store.
                                                                                                        ;;I could provide an absolute path here, but the brevity of the relative solution is appealing.
                                                                                                        "include fastcgi.conf;" 
                                                                                                        "fastcgi_read_timeout 45s;" 
                                                                                                        "fastcgi_pass unix:/run/php/rss-bridge.sock;")))))))))
                                                        (service-extension php-fpm-service-type
                                                                           (const (list (php-fpm-configuration 
                                                                                          (socket "/run/php/rss-bridge.sock") 
                                                                                          (process-manager 
                                                                                            (php-fpm-static-process-manager-configuration 
                                                                                              (max-children 10))))))))) 
                                      (default-value #f) 
                                      (description "Run rss-bridge"))))
