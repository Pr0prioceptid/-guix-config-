(define-module (my-services wallabag)
               #:use-module (gnu services)
               #:use-module (gnu services containers)
               #:use-module (guix gexp))

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
                                     (list '("SYMFONY__ENV__DOMAIN_NAME" . "http://localhost:8082")))
                                   (ports (list "8082:80"))
                                   (image "wallabag/wallabag:2.6.14")
                                   (volumes (list 
                                              '("wallabag-data"     .   "/var/www/wallabag/data")
                                              '("wallabag-images"   .   "/var/www/wallabag/web/assets/images")
                                              ))))))))
              ))
      (description "persistant wallabag container using sqlite in created volumes")
      (default-value #f))))

;;(simple-service 'wallabag-oci
;;                oci-service-type
;;                (oci-extension
;;                  (containers
;;                    (list (oci-container-configuration
;;                            (environment 
;;                              (list '("SYMFONY__ENV__DATABASE_DRIVER" . "pdo_pgsql")
;;                                    ;;supposedly a host of 127.0.0.1 would also work, but be less secure?
;;                                    '("SYMFONY__ENV__DATABASE_HOST" . "host.containers.internal")
;;                                    ;;postgresql listens on this port
;;                                    '("SYMFONY__ENV__DATABASE_PORT" . "5432")
;;                                    '("SYMFONY__ENV__DATABASE_NAME" . "wallabag")
;;                                    '("SYMFONY__ENV__DATABASE_USER" . "wallabag" )
;;                                    '("SYMFONY__ENV__DATABASE_PASSWORD" . "wallapass")
;;                                    '("SYMFONY__ENV__DOMAIN_NAME" . "http://localhost:8082")))
;;                            (ports (list "8082"))
;;                            (image "wallabag/wallabag:2.6.14")
;;                            (network "host"))))))
