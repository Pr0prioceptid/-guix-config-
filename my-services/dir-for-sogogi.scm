(define-module (my-services dir-for-sogogi)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp))

(define-public my-sogogi-dir
  (simple-service 'makedir-srv-http activation-service-type
                  #~(begin
                      (use-modules (guix build utils))
                      (mkdir-p "/srv/http"))))
