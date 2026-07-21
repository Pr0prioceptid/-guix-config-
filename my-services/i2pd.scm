(define-module (my-services i2pd)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  #:use-module (gnu packages i2p))

(define-public my-i2pd-service
(simple-service
   'i2pd
   shepherd-root-service-type
   (list
    (shepherd-service
     (provision '(i2pd))
     (requirement '(networking))
     (documentation "Run i2p daemon.")
     (start #~(make-forkexec-constructor
               (list #$(file-append i2pd "/bin/i2pd"))
	       #:user "user"
	       #:group "users"))
     (stop #~(make-kill-destructor SIGINT))))))
