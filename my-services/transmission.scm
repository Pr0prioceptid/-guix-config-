(define-module (my-services transmission)
  #:use-module (gnu services)
  #:use-module (gnu services file-sharing))

(define-public my-transmission-service
  (service transmission-daemon-service-type
           (transmission-daemon-configuration
            ;; only devices on the localhost or localnetwork are permitted to remote control the torrent
            (rpc-whitelist-enabled? #t)
            (rpc-whitelist '("::1" "127.0.0.1" "192.168.0.*"))
            ;; username & password setup
            ;; password is hashed, it is unique
            (rpc-authentication-required? #t)
            (rpc-username "admin")
            (rpc-password "{8e9fae83e05bbdf5ee76c5a7900da087de2526b5m3KH.QhJ"))))
