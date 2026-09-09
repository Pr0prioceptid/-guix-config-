(define-module (my-services xd)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (guix gexp)
  #:use-module (my-packages xd))

(define-public my-xd-service
  (service (service-type (name 'xd)
                         (extensions (list (service-extension account-service-type
                                            (const (list (user-group
                                                           (name "xd")
                                                           (system? #t))
                                                         (user-account
                                                           (name "xd")
                                                           (group "xd")
                                                           (system? #t)
                                                           (comment "XD daemon")
                                                           (home-directory "/var/lib/xd")))))
                                           (service-extension shepherd-root-service-type
                                            (const (list (shepherd-service (provision '(xd xd-daemon))
                                                                           (requirement '(i2pd))
                                                                           (documentation "Run XD daemon.")
                                                                           (start #~ (make-forkexec-constructor
                                                                             (list #$(file-append go-github-com-majestrate-xd "/bin/XD"))
                                                                             #:user "xd"
                                                                             #:group "xd"
                                                                             #:directory "/var/lib/xd"
                                                                             #:environment-variables '("HOME=/var/lib/xd")))
                                                                           (stop #~ (make-kill-destructor))))))))

                         (default-value #f)
                         (description "Run the XD daemon."))))
