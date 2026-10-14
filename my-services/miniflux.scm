(define-module (my-services miniflux)
               #:use-module (gnu services)
               #:use-module (gnu services web))

(define-public my-miniflux-service
               (service miniflux-service-type
                        (miniflux-configuration
                          (create-administrator-account? #t)
                          (administrator-account-name "admin")
                          (administrator-account-password "filigreemanifest")
                          (listen-address "127.0.0.1:8180")
                          (extra-settings
                            (list 
                              ;;this is to allow my to fetch articles from my
                              ;;rss-bridge server on my local network
                              "FETCHER_ALLOW_PRIVATE_NETWORKS=1"
                              ;;this is to allow a connection to a wallabag server
                              ;; on my private network
                              "INTEGRATION_ALLOW_PRIVATE_NETWORKS=1")))))

(define-public my-miniflux-wrapper-service
               (simple-service
                 'my-miniflux-wrapper-service
                 nginx-service-type
                 (list (nginx-server-configuration
                         (listen '("8080"))
                         (server-name '("miniflux.cthethe.com"))
                         (locations
                           (list (nginx-location-configuration
                                   (uri "/")
                                   (body
                                     (list
                                       "proxy_pass http://127.0.0.1:8180;"
                                       "proxy_redirect off;"
                                       "proxy_set_header Host $host;"
                                       "proxy_set_header X-Real-IP $remote_addr;"
                                       "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
                                       "proxy_set_header X-Forwarded-Proto $scheme;")))))))))
