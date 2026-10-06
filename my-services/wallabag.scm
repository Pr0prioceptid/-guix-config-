(define-module (my-services wallabag)
               #:use-module (gnu services)
               #:use-module (gnu services containers)
               #:use-module (gnu services databases)
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
                         (containers
                           (list (oci-container-configuration
                                   (environment 
                                     (list 
                                       '("SYMFONY__ENV__DATABASE_DRIVER" . "pdo_pgsql")
                                       ;;supposedly a host of 127.0.0.1 would also work, but be less secure?
                                       ;; host.containers.internal is a built in feature of podman
                                       '("SYMFONY__ENV__DATABASE_HOST" . "host.containers.internal")
                                       ;;postgresql listens on this port
                                       '("SYMFONY__ENV__DATABASE_PORT"     . "5432")
                                       '("SYMFONY__ENV__DATABASE_NAME"     . "wallabag")
                                       '("SYMFONY__ENV__DATABASE_USER"     . "wallabag" )
                                       '("SYMFONY__ENV__DATABASE_PASSWORD" . "monkeytroubador")
                                       '("SYMFONY__ENV__DOMAIN_NAME"       . "http://localhost:8082")
                                       ;;apparently this extra option is required since I've created
                                       ;; the database already with create-database #t
                                       '("POPULATE_DATABASE"               . "false")))
                                   (ports (list "8082"))
                                   (image "wallabag/wallabag:2.6.14")
                                   (network "host")))))))
              (service-extension
                postgresql-role-service-type
                (const 
                  (list (postgresql-role
                          (name "wallabag")
                          (create-database? #t)
                          (password-file
                            (plain-file "wallabag_db_pass" "monkeytroubador"))))))))
      (description "wallabag container with role creation for uncontained postgresql installation")
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
