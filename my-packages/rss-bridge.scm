(define-module (my-packages rss-bridge) 
               #:use-module (guix packages) 
               #:use-module (guix git-download)
               #:use-module (guix build-system copy)
               #:use-module ((guix licenses) #:prefix license:)
               #:use-module (gnu packages php))

(define-public my-rss-bridge
               (package
                 (name "rss-bridge")
                 (version "2025-08-05")
                 (source
                   (origin
                     (method git-fetch)
                     (uri 
                       (git-reference
                         (url "https://github.com/RSS-Bridge/rss-bridge")
                         (commit version)))
                     (file-name (git-file-name name version))
                     (sha256
                       (base32 
                         "1gskl935yjr2a06v71pni0w9ncrdk1j0haxasyl5xw70d7xx3jac"))))
                 (build-system copy-build-system)
                 (arguments
                   '(#:install-plan '(("." "share/rss-bridge"))
                     #:phases
                     (modify-phases 
                       %standard-phases
                       ;;Change paths to not use source directory.
                       (add-before 'install 'patch-paths
                                   (lambda _ 
                                     (substitute* 
                                       "lib/bootstrap.php" 
                                       (("const PATH_CACHE = __DIR__ . '/../cache/';") 
                                        "const PATH_CACHE = '/var/cache/rss-bridge/';"))
                                     (substitute* 
                                       "lib/RssBridge.php"
                                       (("PATH_ROOT . 'whitelist.txt'")
                                        "'/etc/rss-bridge/whitelist.txt'")
                                       (("PATH_ROOT . 'config.ini.php'")
                                        "'/etc/rss-bridge/config.ini.php'")))))))
                 (native-inputs (list php))
                 (home-page "https://github.com/RSS-Bridge/rss-bridge")
                 (synopsis "Generate Atom feeds for social networking websites")
                 (description "rss-bridge generates Atom feeds for social networking
                              websites lacking feeds.  Supported websites include Facebook, Twitter,
                              Instagram and YouTube.")
                              (license (list license:public-domain
                                             license:expat))))    
;;my-rss-bridge
