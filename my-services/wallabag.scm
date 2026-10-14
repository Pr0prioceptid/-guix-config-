(define-module (my-services wallabag)
               #:use-module (gnu services)
               #:use-module (gnu services containers)
               #:use-module (guix gexp)
               #:use-module (gnu services web))

(define-public
  my-wallabag-service
  (service
    (service-type
      (name 'my-wallabag-service)
      (extensions
        (list (service-extension
                oci-service-type
                (const (oci-extension
                         (volumes
                           (list (oci-volume-configuration
                                   (name "wallabag-data"))
                                 (oci-volume-configuration
                                   (name "wallabag-images"))))
                         (containers
                           (list (oci-container-configuration
                                   (environment 
                                     (list '("SYMFONY__ENV__DOMAIN_NAME" . "http://192.168.0.121:8082")))
                                   (ports (list "127.0.0.1:8182:80"))
                                   (image "wallabag/wallabag:2.6.14")
                                   (volumes (list 
                                              '("wallabag-data"     .   "/var/www/wallabag/data")
                                              '("wallabag-images"   .   "/var/www/wallabag/web/assets/images")
                                              ))))))))
              (service-extension
                nginx-service-type
                (const
                  (list (nginx-server-configuration
                          (listen '("8082"))
                          (server-name '("wallabag.cthethe.com"))
                          (locations
                            (list (nginx-location-configuration
                                    (uri "/")
                                    (body
                                      (list
                                        "proxy_pass http://127.0.0.1:8182;"
                                        "proxy_set_header Host $http_host;"
                                        "proxy_set_header X-Forwarded-Host $http_host;"
                                        "proxy_set_header X-Forwarded-Proto $scheme;"
                                        "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
                                        "proxy_set_header X-Real-IP $remote_addr;")))))))))))
      (description "persistant wallabag container using sqlite in created volumes")
      (default-value #f))))
