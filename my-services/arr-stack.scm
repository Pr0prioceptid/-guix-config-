(define-module (my-services arr-stack))

;;import from rosenthal channel, with my modification(s)
(define-maybe string)

(define-configuration jellyfin-oci-configuration
  (cache-directory
   (string "/var/cache/jellyfin")
   "Path to cache directory.")
  (config-directory
   (string "/var/lib/jellyfin")
   "Path to configuration directory.")
  (proxy-url
   maybe-string
   "Proxy URL.")
  (log-file
   (string "/var/log/jellyfin.log")
   "Path to log file.")
  (user-id
   (user-and-group-id #f)
   "")
  (auto-start?
   (boolean #t)
   "Whether to start automatically.")
  (extra-options
   (list '())
   "List of extra options.")
  (no-serialization))

(define jellyfin-oci-account-service
  (match-record-lambda <jellyfin-oci-configuration>
      (user-id)
    (list (user-account
            (name "jellyfin")
            (group "docker")
            (uid user-id)
            (system? #t)
            (home-directory "/var/empty")
            (shell (file-append shadow "/sbin/nologin"))))))

(define jellyfin-oci-activation-service
  (match-record-lambda <jellyfin-oci-configuration>
      (cache-directory config-directory)
    #~(let ((user (getpwnam "jellyfin")))
        (for-each
         (lambda (directory)
           (unless (file-exists? directory)
             (mkdir-p directory)
             (chown directory (passwd:uid user) (passwd:gid user))))
         '#$(list cache-directory config-directory)))))

(define jellyfin-oci-oci-service
  (match-record-lambda <jellyfin-oci-configuration>
      (cache-directory config-directory
                       proxy-url log-file auto-start? extra-options)
    (oci-extension
      (containers
       (list (oci-container-configuration
               (user "jellyfin")
               (group "docker")
               (environment
                (if (maybe-value-set? proxy-url)
                    `(("http_proxy" . ,proxy-url)
                      ("https_proxy" . ,proxy-url))
                    '()))
               ;;I want this service definition to work the same
               ;; for every deployment, so I'm changing the version
               ;;  from latest.
               (image "jellyfin/jellyfin:12.2")
               (provision "jellyfin")
               (log-file log-file)
               (auto-start? auto-start?)
               (respawn? #t)
               (network "host")
               (volumes
                `((,cache-directory . "/cache")
                  (,config-directory . "/config")))
               (extra-arguments extra-options)))))))

(define-public jellyfin-oci-service-type
  (service-type
   (name 'jellyfin-oci)
   (extensions
    (list (service-extension account-service-type
                             jellyfin-oci-account-service)
          (service-extension activation-service-type
                             jellyfin-oci-activation-service)
          (service-extension oci-service-type
                             jellyfin-oci-oci-service)))
   (default-value (jellyfin-oci-configuration))
   (description "Run Jellyfin, a media system.")))
