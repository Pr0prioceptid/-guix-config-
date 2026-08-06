(define-module (my-services i2pd)
  #:use-module (gnu services)
  ;;both for defining a i2pd group and user
  #:use-module (gnu system accounts)
  #:use-module (gnu system shadow)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  ;;for define-configuration 
  #:use-module (gnu services configuration)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-1)
  #:use-module (gnu packages i2p))

;; Turn field names, which are Scheme symbols into strings
;; I could've just manually entered a string for each of these field names, which would make it more legible to me, but I'm keeping this code as close to the example given in https://guix.gnu.org/manual/devel/en/html_node/Complex-Configurations.html
(define (uglify-field-name field-name)
  (let ((str (symbol->string field-name)))
    ;; field? -> is-field
    (if (string-suffix? "?" str)
        (string-append "is-"
                       (string-drop-right str 1)) str)))

(define (serialize-string field-name value)
  #~(string-append #$(uglify-field-name field-name) " = "
                   #$value "\n"))

(define (serialize-integer field-name value)
  (serialize-string field-name
                    (number->string value)))

;;;;leaving this example here for future reference
;;(define (serialize-boolean field-name value)
;;  (serialize-string field-name (if value "true" "false")))

;;special serializer for the tunnel titles in tunnels.conf
(define (serialize-name field-name value)
  #~(string-append "\n["
                   #$value "]\n"))

;;I don't know how this works, will look at it again later
;; it probably allows access to the deeper fields in each tunnel-configuration
(define (serialize-list-of-tunnel-configurations field-name value)
  #~(string-append #$@(map (cut serialize-configuration <>
                                tunnel-configuration-fields) value)))

;;this turns our text into an actual file object that we can use
;;the string append "" is an artifact from the example, I could probably remove it
(define (serialize-tunnels-list-configuration configuration)
  (mixed-text-file "tunnels.conf"
                   #~(string-append ""
                                    #$(serialize-configuration configuration
                                       tunnels-list-configuration-fields))))

(define-maybe integer)
(define-maybe string)

(define-configuration tunnel-configuration
  (name string "label for the tunnel"
        (serializer serialize-name))
  (type (string "client")
   "type of tunnel, one of: client, socks, httpproxy, udpclient, server, http, irc, udpserver")
  (address maybe-string
           "local interface tunnel to bind to, defaults to 127.0.0.1")
  (port integer "port of client tunnel")
  (destinationport maybe-integer
                   "which port to connect to the server on, defaults to 0")
  (keys string "keys for destination")
  (destination string "the i2p destination to use as a server"))

(define (list-of-tunnel-configurations? lst)
  (every tunnel-configuration? lst))

(define-configuration tunnels-list-configuration
  (tunnels (list-of-tunnel-configurations '())
           "A list of @code{tunnel-configuration} records which contain
information about all your tunnels."))

;;need to have config applied in all three cases, even when we don't use it.
(define (i2pd-account config)
  (list (user-group
          (name "i2pd")
          (system? #t))
        (user-account
          (name "i2pd")
          (group "i2pd")
          (system? #t)
          (comment "I2P daemon user")
          (home-directory "/var/lib/i2pd"))))

(define (i2pd-directory config)
  #~(begin
      (use-modules (guix build utils))
      (mkdir-p "/var/lib/i2pd")
      (chown "/var/lib/i2pd"
             (passwd:uid (getpwnam "i2pd"))
             (group:gid (getgrnam "i2pd")))))

(define (i2pd-run config)
  (list (shepherd-service (provision '(i2pd))
                          (requirement '(networking user-processes))
                          (documentation "Run the I2Pd daemon.")
                          (start #~(make-forkexec-constructor (list #$(file-append
                                                                       i2pd
                                                                       "/bin/i2pd")
                                                               "--tunconf"
                                                               #$(serialize-tunnels-list-configuration
                                                                  config))
                                                              #:user "i2pd"
                                                              #:group "i2pd"
                                                              #:directory
                                                              "/var/lib/i2pd"
                                                              #:environment-variables '
                                                              ("HOME=/var/lib/i2pd")))
                          (stop #~(make-kill-destructor SIGINT
                                                        #:grace-period 600)))))

(define-public my-i2pd-service-type
  (service-type (name 'i2pd)
                (extensions (list (service-extension account-service-type
                                                     i2pd-account)
                                  (service-extension activation-service-type
                                                     i2pd-directory)
                                  (service-extension
                                   shepherd-root-service-type i2pd-run)))
                (default-value (tunnels-list-configuration))
                (description "Run the I2Pd daemon under its own system user.")))

(define-public my-i2pd-service
  (service my-i2pd-service-type
           (tunnels-list-configuration (tunnels (list (tunnel-configuration (name
                                                                             "SMTP")
                                                                            (port
                                                                             7659)
                                                                            (destinationport
                                                                             25)
                                                                            (keys
                                                                             "smtp-keys.dat")
                                                                            (destination
                                                                             "smtp.postman.i2p"))
                                                      (tunnel-configuration (name
                                                                             "POP3")
                                                                            (port
                                                                             7660)
                                                                            (destinationport
                                                                             110)
                                                                            (keys
                                                                             "pop3-keys.dat")
                                                                            (destination
                                                                             "pop.postman.i2p")))))))
