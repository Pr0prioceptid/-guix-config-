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
                                (list #$(file-append calibre)))))))))))))
