(define-module (my-services arr-stack))

(define-public my-jellyfin-service
               (simple-service
                 'my-jellyfin-service
                 oci-service-type
                 (oci-extension
                   (volumes
                     (list (oci-volume-configuration
                             (name "")))))))
