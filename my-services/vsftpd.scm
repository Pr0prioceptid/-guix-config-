(define-module (my-services vsftpd)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  #:use-module (gnu packages ftp)
  #:use-module (gnu system shadow))

(define-public my-vsftpd-service
  (service (service-type (name 'vsftpd)
                         (extensions (list (service-extension
                                            account-service-type
                                            (const (list (user-group
                                                    (name "vsftpd")
                                                    (system? #t))
                                                  (user-account
                                                    (name "vsftpd")
                                                    (group "vsftpd")
                                                    (system? #t)
                                                    (comment
                                                     "vsftp daemon user")
                                                    (home-directory
                                                     "/var/empty")))))
                                           (service-extension
                                            shepherd-root-service-type
                                            (const (list (shepherd-service (provision '
                                                                     (vsftpd))
                                                                    (requirement '
                                                                     (networking
                                                                      user-processes))
                                                                    (documentation
                                                                     "Run vsftp daemon.")
                                                                    (start #~(make-forkexec-constructor
                                                                              (list #$
                                                                               (file-append
                                                                                vsftpd
                                                                                "/sbin/vsftpd")
                                                                               "-olisten=YES"
                                                                               "-oanonymous_enable=NO"
                                                                               "-ochroot_local_user=YES"
                                                                               "-olocal_enable=YES"
                                                                               "-opasv_enable=YES"
                                                                               "-opasv_min_port=50000"
                                                                               "-opasv_max_port=50100")
                                                                              #:user
                                                                              "vsftpd"
                                                                              #:group
                                                                              "vsftpd"))
                                                                    (stop #~(make-kill-destructor))))))))
                         (default-value #f)
                         (description
                          "Run the very secure ftp daemon under its own system user."))))

(define-public my-ftp-client
  (simple-service 'ftp-client account-service-type
                  (list (user-group
                          (name "ftp")
                          (system? #t))
                        (user-account
                          (name "ftp")
                          (group "ftp")
                          (system? #t)
                          (password (crypt "immunodeficiency22" "$6$abc"))
                          (comment "vsftp daemon client")
                          (home-directory "/srv/ftp")))))
