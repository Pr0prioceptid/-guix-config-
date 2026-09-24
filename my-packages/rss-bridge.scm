(define-module (my-packages rss-bridge) 
               #:use-module (guix packages) 
               #:use-module (guix git-download)
               #:use-module (guix build-system copy)
               #:use-module ((guix licenses) #:prefix license:)
               #:use-module (gnu packages php))

(define-public my-rss-bridge
               (package
                 (name "rss-bridge")
                 (version "f4aa9e0")
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
                         "0rldm4ccw44q4jk7i3y7bgn7hybcy2qddkf9byikvbafw2rw355y"))))
                 (build-system copy-build-system)
                 (arguments
                   '(#:install-plan '(("." "share/rss-bridge"))
                     #:phases
                     (modify-phases 
                       %standard-phases
                       ;;Change paths to not use source directory.
                       (add-before 'install 'patch-paths
                                   (lambda _ 
                                     ;;Below adds a few options into http.php which turns off
                                     ;; cert checking for https, which is apparently a 
                                     ;;  security issue, but I don't think it'd be a big deal.
                                     (substitute*
                                       "lib/http.php"
                                       (("curl_setopt\\(\\$ch, CURLOPT_RETURNTRANSFER, true\\);")
                                        (string-append
                                          "curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);\n"
                                          "curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);\n"
                                          "curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);")))
                                     (substitute* 
                                       "lib/bootstrap.php" 
                                       (("const PATH_CACHE = __DIR__ \\. '/\\.\\./cache/';") 
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
