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
                          (home-directory "/var/lib/calibre"))))))))))
