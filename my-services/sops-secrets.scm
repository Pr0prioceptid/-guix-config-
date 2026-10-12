(define-module (my-services sops-secrets)
               #use-module (sops secrets)
               #use-module (sops services sops))

(define-public
  my-sops-service
  (service sops-secrets-service-type
           (sops-service-configuration
             (secrets))))

