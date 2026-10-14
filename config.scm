(use-modules (gnu) 
             (nongnu packages linux)
             (nongnu system linux-initrd)
             (my-services syncthing)
             (my-services transmission) 
             (my-services miniflux) 
             (my-services i2pd)
             (my-packages xd)
             (my-services xd)
             (my-services vsftpd)
             (my-services rsync-ebooks)
             (my-packages rss-bridge)
             (my-services rss-bridge)
             (my-services wallabag))

(use-service-modules networking 
                     ssh 
                     desktop
                     databases
                     web
                     containers)

(use-package-modules vim
                     screen
                     ssh
                     version-control
                     admin
                     file-systems
                     samba
                     syncthing
                     bittorrent
                     web
                     databases
                     i2p
                     web-browsers
                     ftp
                     rsync
                     php
                     curl)

(operating-system 
  (kernel linux-lts)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))

  (host-name "archaea")
  (timezone "Europe/London")
  (locale "en_US.utf8")
  (keyboard-layout (keyboard-layout "us"))

  (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (targets '("/dev/sda"))))

  (file-systems (cons (file-system
                        (device (file-system-label "my-root"))
                        (mount-point "/")
                        (type "btrfs")) %base-file-systems))

  (swap-devices (list (swap-space (target (file-system-label "my-swap")))))

  (users (cons (user-account
                 (name "user")
                 (comment "main user")
                 (group "users")

                 (supplementary-groups '("wheel" "audio" "video"
                                         "transmission" "xd"))) %base-user-accounts))

  (packages (append (list vim
                          git
                          screen
                          htop
                          btop
                          fscrypt
                          cifs-utils
                          syncthing
                          ;; careful, we need transmission locked on v4.1.3 for
                          ;; myanonamouse, so use an inferior or a modified
                          ;; package definition before using guix pull to
                          ;; upgrade
                          transmission
                          postgresql
                          miniflux
                          i2pd
                          go-github-com-majestrate-xd
                          lynx
                          vsftpd
                          rsync
                          my-rss-bridge
                          ;; rss-bridge needs nginx & php-fpm to function,
                          ;; might be a future task to reverse-proxy all the
                          ;; web-pages hosted on various ports to
                          ;; subdirectories on http with nginx to.
                          nginx
                          php
                          curl
                          github-cli) %base-packages))

  (services
   (append (list (service static-networking-service-type 
                          (list (static-networking (addresses (list (network-address 
                                                                      (device "enp2s0") 
                                                                      (value "192.168.0.121/24"))))
                                                   (routes (list (network-route 
                                                                   (destination "default") 
                                                                   (gateway "192.168.0.1"))))
                                                   (name-servers '("9.9.9.9" "192.168.0.1")))))
                 (service openssh-service-type 
                          (openssh-configuration (openssh openssh-sans-x) 
                                                 (password-authentication? #f)
                                                 (authorized-keys `(("user" ,
                                                                     (plain-file
                                                                       "yk_ssh"
                                                                       "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIG5jna56bj0YTJNH3dvB9FjUvG+AWXEJ9fQOiPVWcyxuAAAABHNzaDo= archaea sshkey"))))
                                                 (port-number 2222))) 
                 ;;guix home manager requires elogind
                 (service elogind-service-type) 
                 ;;miniflux requires postgresql
                 (service postgresql-service-type (postgresql-configuration (postgresql postgresql))) 
                 ;;rss-bridge requires php-fpm/fastcgi
                 (service php-fpm-service-type 
                          (php-fpm-configuration 
                            (process-manager 
                              (php-fpm-static-process-manager-configuration (max-children 10)))
                            ;;ca certs so rss-bridge can read https webpages, using environment-variables
                            ;; would've been preferable to php-ini-file, but this isn't implemented
                            ;;  as of writing this comment.
                            (php-ini-file
                              (plain-file "rss-bridge-php.ini"
                                          (string-append
                                            "curl.cainfo = /etc/ssl/certs/ca-certificates.crt\n"
                                            "openssl.cafile = /etc/ssl/certs/ca-certificates.crt\n"
                                            "openssl.capath = /etc/ssl/certs\n")))))
                 (service rootless-podman-service-type)
                 ;;podman requires iptables to function
                 (service iptables-service-type)
                 ;;runtime for open-container-initiative s.t. defaults to docker
                 ;; and cannot be changed within an extension definition.
                 (service oci-service-type (oci-configuration (runtime 'podman)))
                 my-syncthing-service
                 my-rss-bridge-service
                 my-transmission-service
                 my-miniflux-service
                 my-i2pd-service
                 my-xd-service
                 my-vsftpd-service
                 my-rsync-ebooks-timer
                 my-wallabag-service
                 ) %base-services)))
