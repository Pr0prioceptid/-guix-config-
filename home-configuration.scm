;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (gnu home services shells)
	     (gnu home services dotfiles))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.
  (packages (specifications->packages (list)))

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  (services
   (append (list (service home-bash-service-type
                          (home-bash-configuration
                           (bash-profile (list (local-file
                                                "./.bash_profile"
                                                "bash_profile")))
			   (environment-variables '(("EDITOR" . "vim")))
			   (aliases '((".." . "cd ..")
				      ("ls" . "ls --color=auto")
				      ("grep" . "grep --color=auto")
				      ("ll" . "ls -lha")
                                      ("update" . "guix pull -C ~/my-config/ch/channels.scm")
                                      ("refresh" . "guix pull -C ~/my-config/ch/lock.scm")
                                      ("sysupgrade" . "sudo guix system reconfigure -L ~/my-config ~/my-config/config.scm")
                                      ("homeupgrade" . "guix home reconfigure -L ~/my-config ~/my-config/home-configuration.scm")
                                      ("fullupgrade" . "sysupgrade && homeupgrade")
                                      ("checkpoint" . "guix describe -f channels > ~/my-config/ch/lock.scm")))))
		 (service home-dotfiles-service-type
			  (home-dotfiles-configuration (directories '("./dotfiles")))))
           %base-home-services)))
