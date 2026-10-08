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
                                   ;;prepend ports with 127.0.0.1 to host only on
                                   ;; local machine. 
                                   (ports (list "8082:80"))
                                   (image "wallabag/wallabag:2.6.14")
                                   (volumes (list 
                                              '("wallabag-data"     .   "/var/www/wallabag/data")
                                              '("wallabag-images"   .   "/var/www/wallabag/web/assets/images")
                                              ))))))))
              ;;place nginx extension below.
              ))
      (description "persistant wallabag container using sqlite in created volumes")
      (default-value #f))))

;;(define-public my-wallabag-service 
;;               (simple-service 
;;                 'my-wallabag-service
;;                 oci-service-type
;;                 (oci-extension
;;                   (volumes
;;                     (list (oci-volume-configuration
;;                             (name "wallabag-data"))
;;                           (oci-volume-configuration
;;                             (name "wallabag-images"))))
;;                   (containers
;;                     (list (oci-container-configuration
;;                             (environment 
;;                               (list '("SYMFONY__ENV__DOMAIN_NAME" . "http://localhost:8082")))
;;                             (ports (list "127.0.0.1:8082:80"))
;;                             (image "wallabag/wallabag:2.6.14")
;;                             (volumes (list 
;;                                        '("wallabag-data"     .   "/var/www/wallabag/data")
;;                                        '("wallabag-images"   .   "/var/www/wallabag/web/assets/images")
;;                                        ))))))))
