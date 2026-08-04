(define-module (my-services i2pmail-simple)
  #:use-module (gnu services)
  #:use-module (guix gexp))

(define-public my-i2pmail-service
  (simple-service 'i2p-copy-mail-tunnels activation-service-type
                  #~(begin
                      (use-modules (guix build utils))
                      (mkdir-p "/var/lib/i2pd/.i2pd/")
                      (copy-file #$(local-file "../tunnels.conf")
                                 "/var/lib/i2pd/.i2pd/tunnels.conf")
                      (chown "/var/lib/i2pd/.i2pd/tunnels.conf"
                             (passwd:uid (getpwnam "i2pd"))
                             (group:gid (getgrnam "i2pd"))))))
