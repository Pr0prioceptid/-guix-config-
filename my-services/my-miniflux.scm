(define-module (my-services my-miniflux)
  #:use-module (gnu services)
  #:use-module (gnu services databases)
  #:use-module (gnu services web)
  #:use-module (gnu packages)
  #:use-module (gnu packages databases))

(define-public my-miniflux
  (service miniflux-service-type
           (miniflux-configuration
           (create-administrator-account? #t)
           (administrator-account-name "admin")
           (administrator-account-password "insecurepassword"))))

(define-public my-postgresql-for-miniflux
  (service postgresql-service-type
           (postgresql-configuration (postgresql postgresql))))

;;(define-public my-postgresql-role
;;  (service postgresql-role-service-type
;;           (postgresql-role-configuration (roles (list (postgresql-role (name
;;                                                                         "miniflux")
;;                                                                        (create-database?
;;                                                                         #t)))))))
