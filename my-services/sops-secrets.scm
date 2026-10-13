(define-module (my-services sops-secrets)
               #use-module (sops secrets)
               #use-module (sops services sops))

(define-public
  my-sops-service
  (service sops-secrets-service-type
           (sops-service-configuration
             ;;The absolute path of the file containing the corresponding @code{age} identities where SOPS should look for when decrypting a secret.
             ;; I would also put a config field declaring the location of .sops.yaml here, but apparently this is slated for deprecation.
             (age-key-file "/root/.config/sops/age/keys.txt")
             (secrets
               (list (sops-secret
                       (key '("miniflux" "password"))
                       (file secrets.yaml))
                     (sops-secret
                       (key '("syncthing" "ids"))
                       (file secrets.yaml))
                     (sops-secret
                       (key '("transmission" "rpc-hash"))
                       (file secrets.yaml)))))))

