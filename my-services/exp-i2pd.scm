(define-module (my-services i2pd)
  #:use-module (gnu services)
  #:use-module (gnu services accounts)
  #:use-module (gnu services shepherd)
  #:use-module (gnu packages i2p)
  #:use-module (guix gexp))

(define %i2pd-accounts
  (list
   (user-group
    (name "i2pd")
    (system? #t))
   (user-account
    (name "i2pd")
    (group "i2pd")
    (system? #t)
    (comment "I2Pd daemon user")
    (home-directory "/var/lib/i2pd")
    (shell (file-append shadow "/sbin/nologin")))))

(define my-i2pd-shepherd-service
  (shepherd-service
    (provision '(i2pd))
    (requirement '(networking user-processes))
    (documentation "Run the I2Pd daemon.")
    (start
     #~(make-forkexec-constructor
        (list #$(file-append i2pd "/bin/i2pd"))
        #:user "i2pd"
        #:group "i2pd"))
    (stop
     #~(make-kill-destructor SIGINT
                             #:grace-period 600))))

(define-public my-i2pd-service-type
  (service-type
   (name 'my-i2pd)
   (extensions
    (list
     (service-extension account-service-type
                        (const %i2pd-accounts))
     (service-extension shepherd-root-service-type
                        (const (list my-i2pd-shepherd-service)))))
   (default-value #f)
   (description "Run the I2Pd daemon under its own system user.")))
