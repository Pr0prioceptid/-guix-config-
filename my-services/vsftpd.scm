(define-module (my-services vsftpd)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  #:use-module (gnu packages ftp)
  #:use-module (gnu system shadow))

(define-public my-vsftpd-service
  (simple-service 'vsftpd shepherd-root-service-type
                  (list (shepherd-service (provision '(vsftpd))
                                          (requirement '(networking user-processes))
                                          (documentation "Run vsftp daemon.")
                                          (start #~(make-forkexec-constructor (list #$(file-append vsftpd
                                                                                "/sbin/vsftpd")
                                                                               "-olisten=YES"
                                                                               "-oanonymous_enable=NO"
                                                                               "-ochroot_local_user=YES"
                                                                               "-olocal_enable=YES"
                                                                               "-opasv_enable=YES"
                                                                               "-opasv_min_port=50000"
                                                                               "-opasv_max_port=50100"
									       "-osecure_chroot_dir=/var/empty")))
                                          (stop #~(make-kill-destructor))))))

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
