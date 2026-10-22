(define-public 
  my-calibre-service
  (service
    (service-type
      (name 'calibre)
      (extensions
        (list (service-extension
                account-service-type
                (const 
                  (list (user-group
                          (name "calibre")
                          (system? #t))
                        (user-account
                          (name "calibre")
                          (group "calibre")
                          (system? #t)
                          (comment "calibre server")
                          (home-directory "/var/lib/calibre")))))
              (service-extension
                shepherd-root-service-type
                (const
                  (list (shepherd-service
                          (provision '(calibre))
                          (requirement '(networking user-processes))
                          (documentation "Run calibre server")
                          (start
                            #~(make-forkexec-constructor
                                (list #$(file-append calibre "/bin/calibre-server")
                                      "--port=8183"
                                      "--listen-on=127.0.0.1"
                                      "--enable-local-write"
                                      "/var/lib/calibre")
                                #:user "calibre"
                                #:group "calibre"
                                #:directory "/var/lib/calibre"
                                #:environment-variables '("HOME=/var/lib/calibre")))
                          (stop
                            #~(make-kill-destructor))))))
              (service-extension
                nginx-service-type
                (const
                  (list (nginx-server-configuration
                          (listen '(8083))
                          (server-name '("calibre.placeholder.com"))
                          (locations
                            (list (nginx-location-configuration
                                    (uri "/")
                                    (body
                                      (list
                                        "proxy_pass http://127.0.0.1:8183;")))))))))))
      (default-value #f)
      (description "runs calibre server for books"))))
