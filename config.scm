(use-modules (gnu)
             (nongnu packages linux)
             (nongnu system linux-initrd)
             (my-services syncthing)
             (my-services transmission)
	     (my-services miniflux)
	     (my-services i2pd)
	     (my-packages xd)
	     (my-services xd))

(use-service-modules networking 
		     ssh 
		     desktop
		     databases
		     web)

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
		     web-browsers)

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
			  ;;careful, we need transmission locked on v4.1.3, so use an inferior or a modified package definition before using guix pull to upgrade
                          transmission
			  postgresql
			  miniflux
			  i2pd
			  go-github-com-majestrate-xd
			  lynx
			  sogogi) %base-packages))

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
                                                 (authorized-keys `(("user" ,(local-file "yk_ssh.pub"))))
                                                 (port-number 2222)))
                 (service elogind-service-type) 
		 (service postgresql-service-type (postgresql-configuration (postgresql postgresql)))
		 (service sogogi-service-type (sogogi-configuration (listen ":8081") (location (list (sogogi-location (path "/") (dir "/srv/http/") (grant '("all ro")))))))
		 my-syncthing-service
                 my-transmission-service
		 my-miniflux-service
		 my-i2pd-service
		 my-xd-service) %base-services)))
