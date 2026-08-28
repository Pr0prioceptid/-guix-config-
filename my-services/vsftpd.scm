(define-module (my-services vsftpd)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  #:use-module (gny packages ftp))

(define-public my-vsftpd-service
  (simple-service 'vsftpd 
  shepherd-root-service-type
                  (list (shepherd-service (provision '(vsftp-daemon))
                                          (requirement '(networking
                                                         user-processes))
                                          (documentation "Run vsftp daemon.")
                                          (start #~(make-forkexec-constructor (list #$(file-append
                                                                                vsftpd
                                                                                "/sbin/vsftpd"))))
                                          (stop #~(make-kill-destructor))))))

