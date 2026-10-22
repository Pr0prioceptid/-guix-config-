(define-module (my-services calibre)
               #:use-module (gnu services)
               #:use-module (gnu system shadow)
               #:use-module (gnu services shepherd)
               #:use-module (guix gexp)
               #:use-module (gnu packages ebook)
               #:use-module (gnu services web))

(define-public
  calibredb-creation
  (service
    (service-type
      (name 'calibredb)
      (extensions
        (list (service-extension
                shepherd-root-service-type
                (const
                  (list (shepherd-service
                          (one-shot? #t)
                          (provision '(calibredb))
                          (requirement '(user-processes))
                          (documentation "create a calibredb for calibre if there is none")
                          (start
                            #~(make-forkexec-constructor
                                (list #$(file-append calibre "/bin/calibredb")
                                      "add"
                                      "/var/lib/calibre")
                                #:user "calibre"
                                #:group "calibre"
                                #:directory "/var/lib/calibre" 
                                #:environment-variables '("HOME=/var/lib/calibre")))
                          (stop
                            #~(make-kill-destructor))))))
              (service-extension
                account-service-type
                (const 
                  (list (user-group
                          (name "calibre")
                          (system? #t))
                        (user-account
                          (name "calibre")
                          (group "calibre")
                          (system? #t)
                          (comment "calibre user")
                          (home-directory "/var/lib/calibre")))))))
      (default-value #f)
      (description "creates user and database for calibre, shouldn't erase ebooks"))))

(define-public 
  my-calibre-service
  (service
    (service-type
      (name 'calibre)
      (extensions
        (list (service-extension
                shepherd-root-service-type
                (const
                  (list (shepherd-service
                          (provision '(calibre))
                          (requirement '(calibredb networking ))
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
                          (listen '("8083"))
                          (server-name '("calibre.placeholder.com"))
                          (locations
                            (list (nginx-location-configuration
                                    (uri "/")
                                    (body
                                      (list
                                        "proxy_pass http://127.0.0.1:8183;")))))))))))
      (default-value #f)
      (description "runs calibre server for books"))))
