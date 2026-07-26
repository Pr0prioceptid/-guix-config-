(define-module (my-services miniflux)
  #:use-module (gnu services)
  #:use-module (gnu services web))

(define-public my-miniflux-service
  (service miniflux-service-type
           (miniflux-configuration
           (create-administrator-account? #t)
           (administrator-account-name "admin")
           (administrator-account-password "filigreemanifest")
	   (listen-address "0.0.0.0:8080"))))
