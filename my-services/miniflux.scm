(define-module (my-services miniflux)
               #:use-module (gnu services)
               #:use-module (gnu services web))

(define-public my-miniflux-service
               (service miniflux-service-type
                        (miniflux-configuration
                          (create-administrator-account? #t)
                          (administrator-account-name "admin")
                          (administrator-account-password "filigreemanifest")
                          (listen-address "0.0.0.0:8080")
                          (extra-settings
                            (list 
                              ;;this is to allow my to fetch articles from my
                              ;;rss-bridge server on my local network
                              "FETCHER_ALLOW_PRIVATE_NETWORKS=1"
                              ;;this is to allow a connection to a wallabag server
                              ;; on my private network
                              "INTEGRATION_ALLOW_PRIVATE_NETWORKS=1")))))
