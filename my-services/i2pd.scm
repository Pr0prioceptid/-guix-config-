(define-module (my-services i2pd)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (guix gexp)
  #:use-module (gnu packages i2p))

(define-public my-i2pd-service
  (service (service-type (name 'i2pd)
                (extensions (list (service-extension account-service-type
                                                     (const (list (user-group
                                                                    (name "i2pd")
                                                                    (system?  #t))
                                                                  (user-account
                                                                    (name "i2pd")
                                                                    (group "i2pd")
                                                                    (system?  #t)
                                                                    (comment "I2P daemon user")
                                                                    (home-directory "/var/lib/i2pd")))))
                                  (service-extension activation-service-type
                                                     (const #~(begin (use-modules (guix build utils))
                                                                (mkdir-p "/var/lib/i2pd")
                                                                (chown "/var/lib/i2pd"
                                                                 (passwd:uid (getpwnam "i2pd"))
                                                                 (group:gid (getgrnam "i2pd"))))))
                                  (service-extension shepherd-root-service-type
                                   (const (list (shepherd-service (provision '(i2pd))
                                                                  (requirement '(networking user-processes))
                                                                  (documentation "Run the I2Pd daemon.")
                                                                  (start #~(make-forkexec-constructor (list #$ (file-append i2pd "/bin/i2pd"))
                                                                            #:user "i2pd"
                                                                            #:group "i2pd"
									    #:directory "/var/lib/i2pd"
									    #:environment-variables '("HOME=/var/lib/i2pd")))
                                                                  (stop #~(make-kill-destructor SIGINT #:grace-period 600))))))))
                (default-value #f)
                (description "Run the I2Pd daemon under its own system user."))))
