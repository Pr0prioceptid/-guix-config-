(define-module (my-services sops-secrets)
               #use-module (sops secrets)
               #use-module (sops services sops))

(define secrets
  (local-file "/home/user/my-config/secrets.yaml" "secrets.yaml"))

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
                       (file secrets))
                     (sops-secret
                       (key '("syncthing" "ids" "X555LA"))
                       (file secrets))
		     (sops-secret
                       (key '("syncthing" "ids" "HCPC"))
                       (file secrets))
		     (sops-secret
                       (key '("syncthing" "ids" "pixel6"))
                       (file secrets))
		     (sops-secret
                       (key '("syncthing" "ids" "lockdown"))
                       (file secrets)))))))

