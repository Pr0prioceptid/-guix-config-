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
                                                           (name "ftp")
                                                           (system? #t))
                                                         (user-account
                                                           (name "ftp")
                                                           (group "ftp")
                                                           (system? #t)
                                                           (comment "ftp client")
                                                           (home-directory "/srv/ftp")))))
                                           (service-extension
                                            shepherd-root-service-type
                                            (const (list (shepherd-service (provision '(vsftpd))
                                                                           (requirement '(networking user-processes))
                                                                           (documentation "Run vsftp daemon.")
                                                                           (start #~(make-forkexec-constructor
                                                                             (list #$(file-append vsftpd "/sbin/vsftpd")
									     "-osecure_chroot_dir=/var/empty")))
                                                                           (stop #~(make-kill-destructor))))))))
                         (default-value #f)
                         (description "vsftpd daemon running as root with required ftp user for anonymous logins"))))
