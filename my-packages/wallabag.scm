(define-module (my-packages wallabag)
               #:use-module (guix packages)
               #:use-module (guix git-download)
               #:use-module (guix build-system composer)
               #:use-module ((guix licenses) #:prefix license:))

(define-public php-wallabag-wallabag
  (package
    (name "php-wallabag-wallabag")
    (version "2.6.14")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wallabag/wallabag.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "075c3iz3cdrs0g3w4yzkqqdqc9mq2qplhkbnb2600nr8nm1a3a3f"))))
    (build-system composer-build-system)
    (inputs (list php-willdurand-hateoas-bundle
                  php-willdurand-hateoas
                  php-wallabag-phpepub
                  php-wallabag-php-mobi
                  php-twig-twig
                  php-twig-string-extra
                  php-twig-extra-bundle
                  php-tecnickcom-tcpdf
                  php-symfony-validator
                  php-symfony-twig-bundle
                  php-symfony-templating
                  php-symfony-security-http
                  php-symfony-security-core
                  php-symfony-security-bundle
                  php-symfony-routing
                  php-symfony-proxy-manager-bridge
                  php-symfony-options-resolver
                  php-symfony-monolog-bundle
                  php-symfony-mime
                  php-symfony-mailer
                  php-symfony-http-kernel
                  php-symfony-http-foundation
                  php-symfony-google-mailer
                  php-symfony-framework-bundle
                  php-symfony-form
                  php-symfony-finder
                  php-symfony-event-dispatcher
                  php-symfony-error-handler
                  php-symfony-dom-crawler
                  php-symfony-doctrine-bridge
                  php-symfony-dependency-injection
                  php-symfony-debug
                  php-symfony-console
                  php-symfony-config
                  php-symfony-asset
                  php-stof-doctrine-extensions-bundle
                  php-sentry-sentry-symfony
                  php-sensio-framework-extra-bundle
                  php-scheb-2fa-trusted-device
                  php-scheb-2fa-qr-code
                  php-scheb-2fa-google-authenticator
                  php-scheb-2fa-email
                  php-scheb-2fa-bundle
                  php-scheb-2fa-backup-code
                  php-psr-log
                  php-psr-http-message
                  php-predis-predis
                  php-pragmarx-recovery
                  php-http-message-factory
                  php-http-message
                  php-http-httplug-bundle
                  php-http-httplug
                  php-http-guzzle5-adapter
                  php-http-discovery
                  php-http-client-common
                  php-amqplib-rabbitmq-bundle
                  php-amqplib-php-amqplib
                  php-pagerfanta-twig
                  php-pagerfanta-doctrine-orm-adapter
                  php-ocramius-proxy-manager
                  php-nelmio-cors-bundle
                  php-nelmio-api-doc-bundle
                  php-mnapoli-piwik-twig-extension
                  php-mgargano-simplehtmldom
                  php-lexik-form-filter-bundle
                  php-lcobucci-jwt
                  php-laminas-laminas-code
                  php-kphoen-rulerz-bundle
                  php-kphoen-rulerz
                  php-jms-serializer-bundle
                  php-jms-serializer
                  php-javibravo-simpleue
                  php-j0k3r-php-readability
                  php-j0k3r-graby
                  php-incenteev-composer-parameter-handler
                  php-html2text-html2text
                  php-guzzlehttp-psr7
                  php-guzzlehttp-guzzle
                  php-friendsofsymfony-user-bundle
                  php-friendsofsymfony-rest-bundle
                  php-friendsofsymfony-oauth-server-bundle
                  php-friendsofsymfony-jsrouting-bundle
                  php-enshrined-svg-sanitize
                  php-egulias-email-validator
                  php-doctrine-persistence
                  php-doctrine-orm
                  php-doctrine-migrations
                  php-doctrine-event-manager
                  php-doctrine-doctrine-migrations-bundle
                  php-doctrine-doctrine-bundle
                  php-doctrine-dbal
                  php-doctrine-common
                  php-doctrine-collections
                  php-defuse-php-encryption
                  php-craue-config-bundle
                  php-bdunogier-guzzle-site-authenticator
                  php-babdev-pagerfanta-bundle))
    (native-inputs (list php-symfony-web-server-bundle
                         php-symfony-web-profiler-bundle
                         php-symfony-var-dumper
                         php-symfony-phpunit-bridge
                         php-symfony-maker-bundle
                         php-symfony-debug-bundle
                         php-symfony-css-selector
                         php-symfony-browser-kit
                         php-phpstan-phpstan-symfony
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan-doctrine
                         php-phpstan-phpstan
                         php-phpstan-extension-installer
                         php-http-mock-client
                         php-m6web-redis-mock
                         php-friendsoftwig-twigcs
                         php-friendsofphp-php-cs-fixer
                         php-ergebnis-composer-normalize
                         php-doctrine-doctrine-fixtures-bundle
                         php-dama-doctrine-test-bundle))
    (synopsis "")
    (description "open source self hostable read-it-later web application")
    (home-page "https://github.com/wallabag/wallabag")
    (license license:expat)))

(define-public php-willdurand-hateoas-bundle
  (package
    (name "php-willdurand-hateoas-bundle")
    (version "3.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/willdurand/BazingaHateoasBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a38k879h71aff5c3bknvh59nicr7yxai12c7i11pjah96fzwnik"))))
    (build-system composer-build-system)
    (inputs (list php-willdurand-hateoas php-symfony-framework-bundle
                  php-symfony-expression-language
                  php-symfony-dependency-injection php-jms-serializer-bundle))
    (native-inputs (list php-twig-twig php-symfony-stopwatch
                         php-phpunit-phpunit php-doctrine-coding-standard
                         php-doctrine-annotations))
    (synopsis "")
    (description "Integration of Hateoas into Symfony2.")
    (home-page "")
    (license license:expat)))

(define-public php-willdurand-hateoas
  (package
    (name "php-willdurand-hateoas")
    (version "3.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/willdurand/Hateoas.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ggqkp3bpl2q1ghcmf327mjzhca3ssvg3698zrs80j08z64fzcbq"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-expression-language php-jms-serializer
                  php-jms-metadata))
    (native-inputs (list php-twig-twig
                         php-symfony-yaml
                         php-symfony-routing
                         php-phpspec-prophecy
                         php-phpspec-prophecy-phpunit
                         php-phpdocumentor-type-resolver
                         php-pagerfanta-core
                         php-doctrine-persistence
                         php-doctrine-coding-standard
                         php-doctrine-annotations
                         php-phpunit-phpunit))
    (synopsis "")
    (description
     "A PHP library to support implementing representations for HATEOAS REST web services")
    (home-page "")
    (license license:expat)))

(define-public php-wallabag-phpepub
  (package
    (name "php-wallabag-phpepub")
    (version "4.0.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wallabag/PHPePub.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1zcf1ch4jifbrlxya10xz5x9r0c6s9vnyyhx2sipm55zydql8dqf"))))
    (build-system composer-build-system)
    (inputs (list php-masterminds-html5 php-grandt-relativepath
                  php-grandt-phpresizegif php-phpzip-phpzip))
    (synopsis "")
    (description
     "Package to create and stream e-books in the ePub 2.0 and 3.0 formats.")
    (home-page "https://github.com/wallabag/PHPePub")
    (license license:lgpl2.1)))

(define-public php-wallabag-php-mobi
  (package
    (name "php-wallabag-php-mobi")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wallabag/php-mobi.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jfm4wmkdv0fs3z3zj5wsa99yaip9q8rgdcdlcgiva37v4i4s95w"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-mbstring))
    (synopsis "")
    (description "A Mobipocket file (.mobi) creator in PHP.")
    (home-page "https://github.com/wallabag/php-mobi")
    (license license:asl2.0)))

(define-public php-twig-twig
  (package
    (name "php-twig-twig")
    (version "4.0.0-alpha1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/twigphp/Twig.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10vv333fksx52bgicv12g7n6c3wi6y1srkpaj41bkrn1n59ndbr5"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-ctype php-symfony-polyfill-mbstring
                  php-symfony-deprecation-contracts))
    (native-inputs (list php-cs-fixer-shim php-phpunit-phpunit
                         php-phpstan-phpstan php-psr-container))
    (synopsis "")
    (description
     "Twig, the flexible, fast, and secure template language for PHP")
    (home-page "https://twig.symfony.com")
    (license license:bsd-3)))

(define-public php-twig-string-extra
  (package
    (name "php-twig-string-extra")
    (version "4.0.0-alpha1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/twigphp/string-extra.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1r9knlsvg0kjsnxhqj581y7xc2na3flmyi6ajsza84cld9i5pcc5"))))
    (build-system composer-build-system)
    (inputs (list php-twig-twig php-symfony-translation-contracts
                  php-symfony-string))
    (synopsis "")
    (description "A Twig extension for Symfony String")
    (home-page "https://twig.symfony.com")
    (license license:expat)))

(define-public php-twig-extra-bundle
  (package
    (name "php-twig-extra-bundle")
    (version "4.0.0-alpha1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/twigphp/twig-extra-bundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12d4v3hy3in8a4sjnlak3r1y4vwiw2pxcrxwh653clyh0lp91qa1"))))
    (build-system composer-build-system)
    (inputs (list php-twig-twig php-symfony-twig-bundle
                  php-symfony-framework-bundle))
    (native-inputs (list php-twig-string-extra
                         php-twig-markdown-extra
                         php-twig-intl-extra
                         php-twig-inky-extra
                         php-twig-html-extra
                         php-twig-cssinliner-extra
                         php-twig-cache-extra
                         php-league-commonmark))
    (synopsis "")
    (description "A Symfony bundle for extra Twig extensions")
    (home-page "https://twig.symfony.com")
    (license license:expat)))

(define-public php-tecnickcom-tcpdf
  (package
    (name "php-tecnickcom-tcpdf")
    (version "7.0.11")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/TCPDF.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1w7dsbq4kbrdm3lqb2j6b0w4f6m459k7hl54n0nm7pws5kcgzqx2"))))
    (build-system composer-build-system)
    (inputs (list php-tecnickcom-tc-lib-pdf))
    (native-inputs (list php-phpunit-phpunit php-pdepend-pdepend
                         php-carthage-software-mago))
    (synopsis "")
    (description
     "Deprecated legacy PDF engine for PHP. Use instead tecnickcom/tc-lib-pdf.")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-symfony-validator
  (package
    (name "php-symfony-validator")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/validator.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0i2ln3p5n7bmqyd79v1hngpsznnjfjlvdfcs5y5gvjcb3ss89jiy"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-translation-contracts
                  php-symfony-polyfill-mbstring php-symfony-polyfill-ctype
                  php-symfony-deprecation-contracts))
    (native-inputs (list php-symfony-yaml
                         php-symfony-type-info
                         php-symfony-translation
                         php-symfony-string
                         php-symfony-property-info
                         php-symfony-property-access
                         php-symfony-process
                         php-symfony-mime
                         php-symfony-intl
                         php-symfony-http-kernel
                         php-symfony-http-foundation
                         php-symfony-http-client
                         php-symfony-finder
                         php-symfony-expression-language
                         php-symfony-dependency-injection
                         php-symfony-console
                         php-symfony-config
                         php-symfony-clock
                         php-symfony-cache
                         php-egulias-email-validator))
    (synopsis "")
    (description "Provides tools to validate values")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-twig-bundle
  (package
    (name "php-symfony-twig-bundle")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/twig-bundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11pbi3y1dll8lk0m403jxrcj3rv6y8l93m0h515xdfdl9m5673ws"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-http-kernel php-symfony-http-foundation
                  php-symfony-twig-bridge php-symfony-dependency-injection
                  php-symfony-config))
    (native-inputs (list php-symfony-yaml
                         php-symfony-web-link
                         php-symfony-translation
                         php-symfony-stopwatch
                         php-symfony-runtime
                         php-symfony-routing
                         php-symfony-framework-bundle
                         php-symfony-form
                         php-symfony-finder
                         php-symfony-expression-language
                         php-symfony-asset))
    (synopsis "")
    (description
     "Provides a tight integration of Twig into the Symfony full-stack framework")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-templating
  (package
    (name "php-symfony-templating")
    (version "6.4.24")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/templating.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04iayrc9a95j3n173f338vq3rnriyafpmwbg5q1ryjm7khb9yh38"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-ctype php-symfony-deprecation-contracts))
    (native-inputs (list php-psr-log))
    (synopsis "")
    (description
     "Provides all the tools needed to build any kind of template system")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-security-http
  (package
    (name "php-symfony-security-http")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/security-http.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12q1v3j50w4f81dgll5dvp2mdqmrz32mfzjqmnq3xbc91p5rn0lg"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-service-contracts
                  php-symfony-security-core
                  php-symfony-property-access
                  php-symfony-polyfill-mbstring
                  php-symfony-http-kernel
                  php-symfony-http-foundation
                  php-symfony-deprecation-contracts))
    (native-inputs (list php-web-token-jwt-library
                         php-symfony-translation
                         php-symfony-security-csrf
                         php-symfony-routing
                         php-symfony-rate-limiter
                         php-symfony-http-client-contracts
                         php-symfony-http-client
                         php-symfony-expression-language
                         php-symfony-clock
                         php-symfony-cache
                         php-psr-log))
    (synopsis "")
    (description "Symfony Security Component - HTTP Integration")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-security-core
  (package
    (name "php-symfony-security-core")
    (version "8.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/security-core.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hq3g3cydxbyhhw71r42m45481pa7qd176kbqi1f1jfbpc2jpnm9"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-service-contracts php-symfony-password-hasher
                  php-symfony-event-dispatcher-contracts))
    (native-inputs (list php-symfony-validator
                         php-symfony-translation
                         php-symfony-string
                         php-symfony-property-access
                         php-symfony-ldap
                         php-symfony-http-foundation
                         php-symfony-expression-language
                         php-symfony-event-dispatcher
                         php-symfony-dependency-injection
                         php-symfony-cache
                         php-psr-log
                         php-psr-cache
                         php-psr-container))
    (synopsis "")
    (description "Symfony Security Component - Core Library")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-security-bundle
  (package
    (name "php-symfony-security-bundle")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/security-bundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1v8h3d569bw0fk8jm6p3cvjwkrvf8gj9g7i65ynsvidw79kgi0v4"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-service-contracts
                  php-symfony-security-http
                  php-symfony-security-csrf
                  php-symfony-security-core
                  php-symfony-password-hasher
                  php-symfony-http-foundation
                  php-symfony-http-kernel
                  php-symfony-event-dispatcher
                  php-symfony-dependency-injection
                  php-symfony-config
                  php-symfony-clock))
    (native-inputs (list php-web-token-jwt-library
                         php-symfony-yaml
                         php-symfony-validator
                         php-symfony-twig-bridge
                         php-symfony-twig-bundle
                         php-symfony-translation
                         php-symfony-serializer
                         php-symfony-runtime
                         php-symfony-rate-limiter
                         php-symfony-property-info
                         php-symfony-process
                         php-symfony-lock
                         php-symfony-ldap
                         php-symfony-http-client
                         php-symfony-framework-bundle
                         php-symfony-form
                         php-symfony-expression-language
                         php-symfony-dom-crawler
                         php-symfony-css-selector
                         php-symfony-console
                         php-symfony-browser-kit
                         php-symfony-asset))
    (synopsis "")
    (description
     "Provides a tight integration of the Security component into the Symfony full-stack framework")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-routing
  (package
    (name "php-symfony-routing")
    (version "8.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/routing.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "189sfmrp7ib6ylwgxwgj57cgnyajaf66as5q6i7ml5k1mfdln8rs"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-deprecation-contracts))
    (native-inputs (list php-symfony-yaml
                         php-symfony-http-foundation
                         php-symfony-expression-language
                         php-symfony-dependency-injection
                         php-symfony-config
                         php-psr-log))
    (synopsis "")
    (description "Maps an HTTP request to a set of configuration variables")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-proxy-manager-bridge
  (package
    (name "php-symfony-proxy-manager-bridge")
    (version "6.4.28")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/proxy-manager-bridge.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fgw3xwrcy58j3karfn080h75fa7z3zxfrrr9hfpj8bjywr38azl"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-deprecation-contracts
                  php-symfony-dependency-injection
                  php-friendsofphp-proxy-manager-lts))
    (native-inputs (list php-symfony-config))
    (synopsis "")
    (description
     "Provides integration for ProxyManager with various Symfony components")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-options-resolver
  (package
    (name "php-symfony-options-resolver")
    (version "8.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/options-resolver.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "183hm163q70v64zl4yv30y8b7g42hvngb16aspx47k9ss3ahr6ms"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-deprecation-contracts))
    (synopsis "")
    (description
     "Provides an improved replacement for the array_replace PHP function")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-monolog-bundle
  (package
    (name "php-symfony-monolog-bundle")
    (version "4.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/monolog-bundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0m5rw7y3n8432hil4fd3pjj85g6q7rs8jjah3hwvqvpd2rqhrm9d"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-php84
                  php-symfony-monolog-bridge
                  php-symfony-http-kernel
                  php-symfony-dependency-injection
                  php-symfony-config
                  php-monolog-monolog))
    (native-inputs (list php-symfony-yaml php-symfony-console
                         php-phpunit-phpunit))
    (synopsis "")
    (description "Symfony MonologBundle")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-mime
  (package
    (name "php-symfony-mime")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/mime.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "082ad5gi7m9mcnsg8wik3yh1pf6r0jx3z4qi8864yxcm6mjvay3a"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-mbstring php-symfony-polyfill-intl-idn))
    (native-inputs (list php-symfony-serializer
                         php-symfony-property-info
                         php-symfony-property-access
                         php-symfony-process
                         php-symfony-dependency-injection
                         php-phpdocumentor-reflection-docblock
                         php-league-html-to-markdown
                         php-egulias-email-validator))
    (synopsis "")
    (description "Allows manipulating MIME messages")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-mailer
  (package
    (name "php-symfony-mailer")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/mailer.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0x17mpralddd0lfz0p6v8460zn0sqgkqhcrc7ia0l517dhc5fz7x"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-service-contracts
                  php-symfony-mime
                  php-symfony-event-dispatcher
                  php-psr-log
                  php-psr-event-dispatcher
                  php-egulias-email-validator))
    (native-inputs (list php-symfony-twig-bridge php-symfony-messenger
                         php-symfony-http-client php-symfony-console))
    (synopsis "")
    (description "Helps sending emails")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-http-kernel
  (package
    (name "php-symfony-http-kernel")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/http-kernel.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0viaa6896bwv2azfs95a0f0a7pyn92z2kkq4ch20kcmd09pkp9hn"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-ctype
                  php-symfony-http-foundation
                  php-symfony-event-dispatcher
                  php-symfony-error-handler
                  php-symfony-deprecation-contracts
                  php-psr-log))
    (native-inputs (list php-twig-twig
                         php-symfony-var-exporter
                         php-symfony-var-dumper
                         php-symfony-validator
                         php-symfony-uid
                         php-symfony-translation-contracts
                         php-symfony-translation
                         php-symfony-stopwatch
                         php-symfony-serializer
                         php-symfony-routing
                         php-symfony-rate-limiter
                         php-symfony-property-access
                         php-symfony-process
                         php-symfony-http-client-contracts
                         php-symfony-finder
                         php-symfony-expression-language
                         php-symfony-dom-crawler
                         php-symfony-dependency-injection
                         php-symfony-css-selector
                         php-symfony-console
                         php-symfony-config
                         php-symfony-clock
                         php-symfony-browser-kit
                         php-psr-cache))
    (synopsis "")
    (description
     "Provides a structured process for converting a Request into a Response")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-http-foundation
  (package
    (name "php-symfony-http-foundation")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/http-foundation.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "060ir9q91kaj5sk2aw8nqncz12r0ikx0qhgsrvxngs99gbrrz0vc"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-mbstring
                  php-symfony-deprecation-contracts))
    (native-inputs (list php-symfony-rate-limiter
                         php-symfony-mime
                         php-symfony-http-kernel
                         php-symfony-expression-language
                         php-symfony-dependency-injection
                         php-symfony-clock
                         php-symfony-cache
                         php-predis-predis
                         php-doctrine-dbal))
    (synopsis "")
    (description "Defines an object-oriented layer for the HTTP specification")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-google-mailer
  (package
    (name "php-symfony-google-mailer")
    (version "8.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/google-mailer.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bh3rqdbcl1wnkjsk4461zsibl42m46ncqpszdbid6s8qpf3zkcg"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-mailer))
    (native-inputs (list php-symfony-http-client))
    (synopsis "")
    (description "Symfony Google Mailer Bridge")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-framework-bundle
  (package
    (name "php-symfony-framework-bundle")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/framework-bundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17q009zv0bbqv43zy18igpw31xa5na3xw3fmqxwrxj6l1l6182pv"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-var-exporter
                  php-symfony-service-contracts
                  php-symfony-routing
                  php-symfony-polyfill-php85
                  php-symfony-polyfill-mbstring
                  php-symfony-http-kernel
                  php-symfony-http-foundation
                  php-symfony-finder
                  php-symfony-filesystem
                  php-symfony-event-dispatcher
                  php-symfony-error-handler
                  php-symfony-deprecation-contracts
                  php-symfony-dependency-injection
                  php-symfony-config
                  php-symfony-cache))
    (native-inputs (list php-symfony-yaml
                         php-symfony-webhook
                         php-symfony-web-link
                         php-symfony-workflow
                         php-symfony-validator
                         php-symfony-uid
                         php-symfony-type-info
                         php-symfony-twig-bundle
                         php-symfony-translation
                         php-symfony-string
                         php-symfony-stopwatch
                         php-symfony-serializer
                         php-symfony-semaphore
                         php-symfony-security-bundle
                         php-symfony-scheduler
                         php-symfony-runtime
                         php-symfony-rate-limiter
                         php-symfony-property-info
                         php-symfony-process
                         php-symfony-polyfill-intl-icu
                         php-symfony-object-mapper
                         php-symfony-notifier
                         php-symfony-mime
                         php-symfony-messenger
                         php-symfony-mailer
                         php-symfony-lock
                         php-symfony-json-streamer
                         php-symfony-http-client
                         php-symfony-html-sanitizer
                         php-symfony-form
                         php-symfony-expression-language
                         php-symfony-dotenv
                         php-symfony-dom-crawler
                         php-symfony-css-selector
                         php-symfony-console
                         php-symfony-clock
                         php-symfony-browser-kit
                         php-symfony-asset-mapper
                         php-symfony-asset
                         php-seld-jsonlint
                         php-phpstan-phpdoc-parser
                         php-phpdocumentor-reflection-docblock
                         php-dragonmantank-cron-expression
                         php-doctrine-persistence))
    (synopsis "")
    (description
     "Provides a tight integration between Symfony components and the Symfony full-stack framework")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-form
  (package
    (name "php-symfony-form")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/form.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1sji1xyc9jcq64391pck8az7x8gxsbgh9gdjpifj5qi27z5zrglx"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-var-exporter
                  php-symfony-service-contracts
                  php-symfony-property-access
                  php-symfony-polyfill-mbstring
                  php-symfony-polyfill-intl-icu
                  php-symfony-polyfill-ctype
                  php-symfony-options-resolver
                  php-symfony-event-dispatcher
                  php-symfony-deprecation-contracts))
    (native-inputs (list php-symfony-var-dumper
                         php-symfony-validator
                         php-symfony-uid
                         php-symfony-translation
                         php-symfony-security-csrf
                         php-symfony-security-core
                         php-symfony-intl
                         php-symfony-http-kernel
                         php-symfony-http-foundation
                         php-symfony-html-sanitizer
                         php-symfony-expression-language
                         php-symfony-dependency-injection
                         php-symfony-console
                         php-symfony-config
                         php-symfony-clock
                         php-doctrine-collections))
    (synopsis "")
    (description "Allows to easily create, process and reuse HTML forms")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-finder
  (package
    (name "php-symfony-finder")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/finder.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19p10mx11sgw7jq2s6kzink85m2b1hm8i9v9ybrprcaavw3w0hh3"))))
    (build-system composer-build-system)
    (native-inputs (list php-symfony-filesystem))
    (synopsis "")
    (description
     "Finds files and directories via an intuitive fluent interface")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-event-dispatcher
  (package
    (name "php-symfony-event-dispatcher")
    (version "8.1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/event-dispatcher.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14wjmflz374q7yzcwivax8q5vbf3isq7h53dsk2d4nmd0hrg6wr8"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-event-dispatcher-contracts
                  php-symfony-deprecation-contracts))
    (native-inputs (list php-symfony-stopwatch
                         php-symfony-service-contracts
                         php-symfony-http-foundation
                         php-symfony-framework-bundle
                         php-symfony-expression-language
                         php-symfony-error-handler
                         php-symfony-dependency-injection
                         php-symfony-config
                         php-psr-log))
    (synopsis "")
    (description
     "Provides tools that allow your application components to communicate with each other by dispatching events and listening to them")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-error-handler
  (package
    (name "php-symfony-error-handler")
    (version "8.1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/error-handler.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gqb5lc45skwrbbg6qb347jgkgplq967x0lqwy4imbdlipizwh5r"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-var-dumper php-symfony-polyfill-php85
                  php-psr-log))
    (native-inputs (list php-symfony-webpack-encore-bundle
                         php-symfony-serializer php-symfony-http-kernel
                         php-symfony-deprecation-contracts php-symfony-console))
    (synopsis "")
    (description "Provides tools to manage errors and ease debugging PHP code")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-dom-crawler
  (package
    (name "php-symfony-dom-crawler")
    (version "8.1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/dom-crawler.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mabfafzvbw1kkrc60b6ax28s9n0lrzn9vkv7m0ngzf8xjypjnzh"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-mbstring php-symfony-polyfill-ctype))
    (native-inputs (list php-symfony-css-selector))
    (synopsis "")
    (description "Eases DOM navigation for HTML and XML documents")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-doctrine-bridge
  (package
    (name "php-symfony-doctrine-bridge")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/doctrine-bridge.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vfa7x6vwzigc7pwcqln7n7dr647r5vhn061zi4qdb7rsidlm5dl"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-service-contracts
                  php-symfony-polyfill-mbstring
                  php-symfony-polyfill-ctype
                  php-symfony-deprecation-contracts
                  php-doctrine-persistence
                  php-doctrine-event-manager))
    (native-inputs (list php-symfony-var-dumper
                         php-symfony-validator
                         php-symfony-uid
                         php-symfony-type-info
                         php-symfony-translation
                         php-symfony-stopwatch
                         php-symfony-security-core
                         php-symfony-property-info
                         php-symfony-property-access
                         php-symfony-messenger
                         php-symfony-lock
                         php-symfony-http-kernel
                         php-symfony-form
                         php-symfony-expression-language
                         php-symfony-doctrine-messenger
                         php-symfony-dependency-injection
                         php-symfony-console
                         php-symfony-config
                         php-symfony-cache
                         php-psr-log
                         php-doctrine-orm
                         php-doctrine-dbal
                         php-doctrine-data-fixtures
                         php-doctrine-collections))
    (synopsis "")
    (description
     "Provides integration for Doctrine with various Symfony components")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-dependency-injection
  (package
    (name "php-symfony-dependency-injection")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/dependency-injection.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "186a1qv74zzzi4fpkyd4gz96sdhq2yis222bbvyv1mgpnkxi00xp"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-var-exporter php-symfony-service-contracts
                  php-symfony-deprecation-contracts php-psr-container))
    (native-inputs (list php-symfony-yaml php-symfony-expression-language
                         php-symfony-config))
    (synopsis "")
    (description
     "Allows you to standardize and centralize the way objects are constructed in your application")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-debug
  (package
    (name "php-symfony-debug")
    (version "4.4.44")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/debug.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0s7da2pr45q2i1fjsx0wn18y28qpr5pra2lw4014iimz741j4i86"))))
    (build-system composer-build-system)
    (inputs (list php-psr-log))
    (native-inputs (list php-symfony-http-kernel))
    (synopsis "")
    (description "Provides tools to ease debugging PHP code")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-console
  (package
    (name "php-symfony-console")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/console.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1pi5skq2vssc78wdcrdqp547r9apczlj6kc9qlwaljhpgy5kf5zn"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-string php-symfony-service-contracts
                  php-symfony-polyfill-php85 php-symfony-polyfill-mbstring
                  php-symfony-deprecation-contracts))
    (native-inputs (list php-symfony-var-dumper
                         php-symfony-validator
                         php-symfony-uid
                         php-symfony-stopwatch
                         php-symfony-process
                         php-symfony-mime
                         php-symfony-messenger
                         php-symfony-lock
                         php-symfony-http-kernel
                         php-symfony-http-foundation
                         php-symfony-filesystem
                         php-symfony-event-dispatcher
                         php-symfony-dependency-injection
                         php-symfony-config
                         php-psr-log))
    (synopsis "")
    (description
     "Eases the creation of beautiful and testable command line interfaces")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-config
  (package
    (name "php-symfony-config")
    (version "8.1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/config.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0aysx0wy1g8yychp7agrbh07ii3rmq6l43b76a1899acgf96z9rf"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-ctype php-symfony-filesystem
                  php-symfony-deprecation-contracts))
    (native-inputs (list php-symfony-yaml php-symfony-service-contracts
                         php-symfony-messenger php-symfony-finder
                         php-symfony-event-dispatcher))
    (synopsis "")
    (description
     "Helps you find, load, combine, autofill and validate configuration values of any kind")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-asset
  (package
    (name "php-symfony-asset")
    (version "8.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/asset.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "131k3lspxrnkqzvfwp9zzbs1dw2zhffn67z542nv9kfxz9g66npl"))))
    (build-system composer-build-system)
    (native-inputs (list php-symfony-http-kernel php-symfony-http-foundation
                         php-symfony-http-client))
    (synopsis "")
    (description
     "Manages URL generation and versioning of web assets such as CSS stylesheets, JavaScript files and image files")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-stof-doctrine-extensions-bundle
  (package
    (name "php-stof-doctrine-extensions-bundle")
    (version "1.15.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stof/StofDoctrineExtensionsBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15511ms990w1wjda640551cr1f3pi231cpmsvg0s3jdc3gl6b8mq"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-translation-contracts
                  php-symfony-http-kernel
                  php-symfony-event-dispatcher
                  php-symfony-dependency-injection
                  php-symfony-config
                  php-symfony-cache
                  php-gedmo-doctrine-extensions))
    (native-inputs (list php-symfony-security-core
                         php-symfony-phpunit-bridge
                         php-symfony-mime
                         php-phpunit-phpunit
                         php-phpstan-phpstan-symfony
                         php-phpstan-phpstan-strict-rules
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan-deprecation-rules
                         php-phpstan-phpstan))
    (synopsis "")
    (description "Integration of the gedmo/doctrine-extensions with Symfony")
    (home-page "https://github.com/stof/StofDoctrineExtensionsBundle")
    (license license:expat)))

(define-public php-sentry-sentry-symfony
  (package
    (name "php-sentry-sentry-symfony")
    (version "5.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/getsentry/sentry-symfony.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1347xzywx8f4dfay5riwnw7w8w1sqws0g25radc6dyv5dz1zrzz1"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-yaml
                  php-symfony-psr-http-message-bridge
                  php-symfony-polyfill-php80
                  php-symfony-http-kernel
                  php-symfony-event-dispatcher
                  php-symfony-dependency-injection
                  php-symfony-console
                  php-symfony-config
                  php-symfony-cache-contracts
                  php-sentry-sentry
                  php-jean85-pretty-package-versions
                  php-guzzlehttp-psr7))
    (native-inputs (list php-vimeo-psalm
                         php-symfony-twig-bundle
                         php-symfony-security-http
                         php-symfony-security-core
                         php-symfony-process
                         php-symfony-phpunit-bridge
                         php-symfony-monolog-bundle
                         php-symfony-messenger
                         php-symfony-http-client
                         php-symfony-framework-bundle
                         php-symfony-dom-crawler
                         php-symfony-cache
                         php-symfony-browser-kit
                         php-phpunit-phpunit
                         php-phpstan-phpstan-symfony
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan
                         php-phpstan-extension-installer
                         php-masterminds-html5
                         php-friendsofphp-php-cs-fixer
                         php-doctrine-doctrine-bundle
                         php-doctrine-dbal))
    (synopsis "")
    (description "Symfony integration for Sentry (http://getsentry.com)")
    (home-page "http://getsentry.com")
    (license license:expat)))

(define-public php-sensio-framework-extra-bundle
  (package
    (name "php-sensio-framework-extra-bundle")
    (version "6.2.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url
              "https://github.com/sensiolabs/SensioFrameworkExtraBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "114amlfppglwshipwy3c8g4mi2zdxyi66p7f4lcj61qf8l2i70zn"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-http-kernel php-symfony-framework-bundle
                  php-symfony-dependency-injection php-symfony-config
                  php-doctrine-annotations))
    (native-inputs (list php-twig-twig
                         php-symfony-yaml
                         php-symfony-twig-bundle
                         php-symfony-security-bundle
                         php-symfony-phpunit-bridge
                         php-symfony-monolog-bridge
                         php-symfony-monolog-bundle
                         php-symfony-finder
                         php-symfony-expression-language
                         php-symfony-dom-crawler
                         php-symfony-doctrine-bridge
                         php-symfony-browser-kit
                         php-doctrine-orm
                         php-doctrine-doctrine-bundle
                         php-doctrine-dbal))
    (synopsis "")
    (description
     "This bundle provides a way to configure your controllers with annotations")
    (home-page "")
    (license license:expat)))

(define-public php-scheb-2fa-trusted-device
  (package
    (name "php-scheb-2fa-trusted-device")
    (version "8.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/scheb/2fa-trusted-device.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "030mfj6r413jnbj1zvnwhnqy7l1l6iahdgsvw1vpjz78gfidc1bz"))))
    (build-system composer-build-system)
    (inputs (list php-lcobucci-jwt php-lcobucci-clock php-scheb-2fa-bundle))
    (synopsis "")
    (description "Extends scheb/2fa-bundle with trusted devices support")
    (home-page "https://github.com/scheb/2fa")
    (license license:expat)))

(define-public php-scheb-2fa-qr-code
  (package
    (name "php-scheb-2fa-qr-code")
    (version "5.13.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/scheb/2fa-qr-code.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ssih5zl2zab2nxbp56x15il236733vc2dgyhm6lgnyf8vlalmnc"))))
    (build-system composer-build-system)
    (inputs (list php-endroid-qr-code php-scheb-2fa-bundle))
    (synopsis "")
    (description
     "Extends scheb/2fa-bundle with the ability to render QR-codes for Google Authenticator or TOTP")
    (home-page "https://github.com/scheb/2fa")
    (license license:expat)))

(define-public php-scheb-2fa-google-authenticator
  (package
    (name "php-scheb-2fa-google-authenticator")
    (version "8.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/scheb/2fa-google-authenticator.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15r3qyrdz34xllyz19yn1xdmlzc50hvvf1iz7cc25d75v2p0hba2"))))
    (build-system composer-build-system)
    (inputs (list php-spomky-labs-otphp php-scheb-2fa-bundle))
    (synopsis "")
    (description
     "Extends scheb/2fa-bundle with two-factor authentication using Google Authenticator")
    (home-page "https://github.com/scheb/2fa")
    (license license:expat)))

(define-public php-scheb-2fa-email
  (package
    (name "php-scheb-2fa-email")
    (version "8.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/scheb/2fa-email.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vr0kyqbhqvakdvb21xb8nadggkh6bziaja5nzqarhpcaashp464"))))
    (build-system composer-build-system)
    (inputs (list php-scheb-2fa-bundle))
    (synopsis "")
    (description
     "Extends scheb/2fa-bundle with two-factor authentication via email")
    (home-page "https://github.com/scheb/2fa")
    (license license:expat)))

(define-public php-scheb-2fa-bundle
  (package
    (name "php-scheb-2fa-bundle")
    (version "8.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/scheb/2fa-bundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1lcvfzw7fcsczflbb78z2lc7vx7r0z82drjwdkgxhy8zjwjqxcjx"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-twig-bundle
                  php-symfony-service-contracts
                  php-symfony-security-bundle
                  php-symfony-property-access
                  php-symfony-http-kernel
                  php-symfony-http-foundation
                  php-symfony-framework-bundle
                  php-symfony-event-dispatcher
                  php-symfony-dependency-injection
                  php-symfony-config))
    (synopsis "")
    (description
     "A generic interface to implement two-factor authentication in Symfony applications")
    (home-page "https://github.com/scheb/2fa")
    (license license:expat)))

(define-public php-scheb-2fa-backup-code
  (package
    (name "php-scheb-2fa-backup-code")
    (version "8.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/scheb/2fa-backup-code.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "18cbipv9mbdjymcicxbcx43vmab0dk3w8csgj4zkz021crcqwj48"))))
    (build-system composer-build-system)
    (inputs (list php-scheb-2fa-bundle))
    (synopsis "")
    (description "Extends scheb/2fa-bundle with backup codes support")
    (home-page "https://github.com/scheb/2fa")
    (license license:expat)))

(define-public php-psr-log
  (package
    (name "php-psr-log")
    (version "3.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-fig/log.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10vsw0l2c4xmi46y5mp1q5cn8a7c04yki9av11w742nkvkinzkir"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Common interface for logging libraries")
    (home-page "https://github.com/php-fig/log")
    (license license:expat)))

(define-public php-psr-http-message
  (package
    (name "php-psr-http-message")
    (version "2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-fig/http-message.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0y0ryjzv6d38nhlmz6svq7s3xrnmw9hrcch2i2h4y3jpgpr851xc"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Common interface for HTTP messages")
    (home-page "https://github.com/php-fig/http-message")
    (license license:expat)))

(define-public php-predis-predis
  (package
    (name "php-predis-predis")
    (version "3.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/predis/predis.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "155mm8fl60gg41m9az4li7p0w96d6vpn65xa01pc1qrnclrc5kmm"))))
    (build-system composer-build-system)
    (inputs (list php-psr-http-message))
    (native-inputs (list php-phpunit-phpcov php-phpunit-phpunit
                         php-phpstan-phpstan php-friendsofphp-php-cs-fixer))
    (synopsis "")
    (description
     "A flexible and feature-complete Redis/Valkey client for PHP.")
    (home-page "http://github.com/predis/predis")
    (license license:expat)))

(define-public php-pragmarx-recovery
  (package
    (name "php-pragmarx-recovery")
    (version "0.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/antonioribeiro/recovery.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mn7fwlcv3ck3dr75i2gik7m68m8kjn528pbka2a4g4f7xxmr5lg"))))
    (build-system composer-build-system)
    (inputs (list php-pragmarx-random))
    (native-inputs (list php-tightenco-collect php-squizlabs-php-codesniffer
                         php-phpunit-phpunit))
    (synopsis "")
    (description "Create recovery codes for two factor auth")
    (home-page "https://github.com/antonioribeiro/recovery")
    (license license:expat)))

(define-public php-http-message-factory
  (package
    (name "php-http-message-factory")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-http/message-factory.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gq6mhcb6nwqqn3i5c80m9z0vrxjvybiw4wygm25qrcsm91a25kj"))))
    (build-system composer-build-system)
    (inputs (list php-psr-http-message))
    (synopsis "")
    (description "Factory interfaces for PSR-7 HTTP Message")
    (home-page "http://php-http.org")
    (license license:expat)))

(define-public php-http-message
  (package
    (name "php-http-message")
    (version "1.16.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-http/message.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1jvsx6mrnqvpj2bnzdgshy0mg23r89df2hz9053whls5fsqwb7p7"))))
    (build-system composer-build-system)
    (inputs (list php-psr-http-message php-clue-stream-filter))
    (native-inputs (list php-laminas-laminas-diactoros
                         php-slim-slim
                         php-phpspec-phpspec
                         php-http-message-factory
                         php-guzzlehttp-psr7
                         php-ergebnis-composer-normalize))
    (synopsis "")
    (description "HTTP Message related tools")
    (home-page "http://php-http.org")
    (license license:expat)))

(define-public php-http-httplug-bundle
  (package
    (name "php-http-httplug-bundle")
    (version "2.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-http/HttplugBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0bxphw8h3gm4s3gqwr1836hkb6xgf8vhjx72n8n41npfs4kvkjhi"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-options-resolver
                  php-symfony-http-kernel
                  php-symfony-event-dispatcher
                  php-symfony-dependency-injection
                  php-symfony-config
                  php-psr-http-message
                  php-psr-http-factory-implementation
                  php-http-stopwatch-plugin
                  php-http-message
                  php-http-logger-plugin
                  php-http-httplug
                  php-http-discovery
                  php-http-client-implementation
                  php-http-client-common))
    (native-inputs (list php-twig-twig
                         php-symfony-web-profiler-bundle
                         php-symfony-twig-bundle
                         php-symfony-stopwatch
                         php-symfony-http-foundation
                         php-symfony-framework-bundle
                         php-symfony-dom-crawler
                         php-symfony-cache
                         php-symfony-browser-kit
                         php-phpunit-phpunit
                         php-http-throttle-plugin
                         php-http-promise
                         php-http-mock-client
                         php-http-cache-plugin
                         php-nyholm-psr7
                         php-nyholm-nsa
                         php-matthiasnoback-symfony-dependency-injection-test
                         php-matthiasnoback-symfony-config-test
                         php-guzzlehttp-psr7))
    (synopsis "")
    (description "Symfony integration for HTTPlug")
    (home-page "http://httplug.io")
    (license license:expat)))

(define-public php-http-httplug
  (package
    (name "php-http-httplug")
    (version "2.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-http/httplug.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jjs4rpq8fxvmgwvsx7xig9cx5phpqz1c27ifwd1v0niirc9lwij"))))
    (build-system composer-build-system)
    (inputs (list php-psr-http-message php-psr-http-client php-http-promise))
    (native-inputs (list php-phpspec-phpspec
                         php-friends-of-phpspec-phpspec-code-coverage))
    (synopsis "")
    (description "HTTPlug, the HTTP client abstraction for PHP")
    (home-page "http://httplug.io")
    (license license:expat)))

(define-public php-http-guzzle5-adapter
  (package
    (name "php-http-guzzle5-adapter")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-http/guzzle5-adapter.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0qz6ghqzfbwkff9rcy0xqd71spq0jpij9a7a6xfblwg8qnvybi9k"))))
    (build-system composer-build-system)
    (inputs (list php-http-discovery php-guzzlehttp-guzzle php-http-httplug))
    (native-inputs (list php-guzzlehttp-ringphp
                         php-http-client-integration-tests php-phpunit-phpunit))
    (synopsis "")
    (description "Guzzle 5 HTTP Adapter")
    (home-page "http://httplug.io")
    (license license:expat)))

(define-public php-http-discovery
  (package
    (name "php-http-discovery")
    (version "1.20.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-http/discovery.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ig4vpbwzb7a3dayd34bf63p23pbg1bl1zaa6nmx25p4qpg8rnyp"))))
    (build-system composer-build-system)
    (native-inputs (list php-sebastian-comparator
                         php-symfony-phpunit-bridge
                         php-phpspec-phpspec
                         php-http-message-factory
                         php-http-httplug
                         php-graham-campbell-phpspec-skip-example-extension
                         php-composer-composer))
    (synopsis "")
    (description
     "Finds and installs PSR-7, PSR-17, PSR-18 and HTTPlug implementations")
    (home-page "http://php-http.org")
    (license license:expat)))

(define-public php-http-client-common
  (package
    (name "php-http-client-common")
    (version "2.7.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-http/client-common.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pryzb1mh83f4kbjv3hba9yw30i7idxyy31k4vk9s3kva42y3vzw"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-php80
                  php-symfony-options-resolver
                  php-psr-http-message
                  php-psr-http-factory
                  php-psr-http-client
                  php-http-message
                  php-http-httplug))
    (native-inputs (list php-phpunit-phpunit php-nyholm-psr7
                         php-guzzlehttp-psr7 php-doctrine-instantiator))
    (synopsis "")
    (description "Common HTTP Client implementations and tools for HTTPlug")
    (home-page "http://httplug.io")
    (license license:expat)))

(define-public php-amqplib-rabbitmq-bundle
  (package
    (name "php-amqplib-rabbitmq-bundle")
    (version "2.19.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-amqplib/RabbitMqBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ybyxhfh2w3jcxvsmpa8yckbywpw3q08jsbsqpbjjaimx5ljk81z"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-framework-bundle
                  php-symfony-http-kernel
                  php-psr-log
                  php-amqplib-php-amqplib
                  php-symfony-console
                  php-symfony-yaml
                  php-symfony-config
                  php-symfony-event-dispatcher
                  php-symfony-dependency-injection))
    (native-inputs (list php-phpstan-phpstan-phpunit php-phpstan-phpstan
                         php-phpunit-phpunit php-symfony-serializer))
    (synopsis "")
    (description
     "Integrates php-amqplib with Symfony & RabbitMq. Formerly emag-tech-labs/rabbitmq-bundle, oldsound/rabbitmq-bundle.")
    (home-page "")
    (license license:expat)))

(define-public php-amqplib-php-amqplib
  (package
    (name "php-amqplib-php-amqplib")
    (version "3.7.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-amqplib/php-amqplib.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0hnwrsskqbilx70hqn31y8gjzy2m27cdnadrm2i83nkq336wvm6h"))))
    (build-system composer-build-system)
    (inputs (list php-phpseclib-phpseclib))
    (native-inputs (list php-nategood-httpful php-squizlabs-php-codesniffer
                         php-phpunit-phpunit))
    (synopsis "")
    (description
     "Formerly videlalvaro/php-amqplib.  This library is a pure PHP implementation of the AMQP protocol. It's been tested against RabbitMQ.")
    (home-page "https://github.com/php-amqplib/php-amqplib/")
    (license license:lgpl2.1+)))

(define-public php-pagerfanta-twig
  (package
    (name "php-pagerfanta-twig")
    (version "4.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Pagerfanta/twig.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02yghp01rskn5ivwgyaykax6ldlmwm03fk005w49w64vlj0pslq0"))))
    (build-system composer-build-system)
    (inputs (list php-twig-twig php-pagerfanta-core))
    (native-inputs (list php-phpunit-phpunit))
    (synopsis "")
    (description "Twig integration for Pagerfanta")
    (home-page "")
    (license license:expat)))

(define-public php-pagerfanta-doctrine-orm-adapter
  (package
    (name "php-pagerfanta-doctrine-orm-adapter")
    (version "4.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Pagerfanta/doctrine-orm-adapter.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19vh8zr60f5j97h6bjn64hpkwfs32w7f4xa9ps25iacr6vfsw7qs"))))
    (build-system composer-build-system)
    (inputs (list php-pagerfanta-core php-doctrine-orm))
    (native-inputs (list php-symfony-cache php-phpunit-phpunit))
    (synopsis "")
    (description "Pagerfanta adapter for Doctrine ORM")
    (home-page "")
    (license license:expat)))

(define-public php-ocramius-proxy-manager
  (package
    (name "php-ocramius-proxy-manager")
    (version "2.14.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Ocramius/ProxyManager.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bwh3xnys7cszb8s0mql8fyljapwfncm3kk9hh05gckzrcgr99c1"))))
    (build-system composer-build-system)
    (inputs (list php-webimpress-safe-writer php-laminas-laminas-code))
    (native-inputs (list php-vimeo-psalm
                         php-squizlabs-php-codesniffer
                         php-roave-infection-static-analysis-plugin
                         php-phpunit-phpunit
                         php-phpbench-phpbench
                         php-doctrine-coding-standard
                         php-codelicia-xulieta))
    (synopsis "")
    (description
     "A library providing utilities to generate, instantiate and generally operate with Object Proxies")
    (home-page "https://github.com/Ocramius/ProxyManager")
    (license license:expat)))

(define-public php-nelmio-cors-bundle
  (package
    (name "php-nelmio-cors-bundle")
    (version "2.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nelmio/NelmioCorsBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07w7rb35j7x3kx5jhclhaqj21hwn4n1vqf7171m0w47cnwkx78j8"))))
    (build-system composer-build-system)
    (inputs (list php-psr-log php-symfony-framework-bundle))
    (native-inputs (list php-phpstan-phpstan-symfony
                         php-phpstan-phpstan-deprecation-rules
                         php-phpstan-phpstan-phpunit php-phpstan-phpstan
                         php-phpunit-phpunit))
    (synopsis "")
    (description
     "Adds CORS (Cross-Origin Resource Sharing) headers support in your Symfony application")
    (home-page "")
    (license license:expat)))

(define-public php-nelmio-api-doc-bundle
  (package
    (name "php-nelmio-api-doc-bundle")
    (version "5.12.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nelmio/NelmioApiDocBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0n59hrpp1486rwnv85krcbm9nvih2rjxb7wvvda7pdm2p3s46w6w"))))
    (build-system composer-build-system)
    (inputs (list php-zircote-swagger-php
                  php-symfony-type-info
                  php-symfony-routing
                  php-symfony-property-info
                  php-symfony-options-resolver
                  php-symfony-http-kernel
                  php-symfony-http-foundation
                  php-symfony-framework-bundle
                  php-symfony-deprecation-contracts
                  php-symfony-dependency-injection
                  php-symfony-console
                  php-symfony-config
                  php-psr-log
                  php-psr-container
                  php-psr-cache
                  php-phpdocumentor-type-resolver
                  php-phpdocumentor-reflection-docblock))
    (native-inputs (list php-willdurand-negotiation
                         php-willdurand-hateoas-bundle
                         php-symfony-validator
                         php-symfony-uid
                         php-symfony-twig-bundle
                         php-symfony-translation
                         php-symfony-serializer
                         php-symfony-security-http
                         php-symfony-security-csrf
                         php-symfony-phpunit-bridge
                         php-symfony-form
                         php-symfony-finder
                         php-symfony-expression-language
                         php-symfony-dom-crawler
                         php-symfony-cache
                         php-symfony-browser-kit
                         php-symfony-asset
                         php-phpunit-phpunit
                         php-phpstan-phpstan-symfony
                         php-phpstan-phpstan-strict-rules
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan
                         php-jms-serializer-bundle
                         php-jms-serializer
                         php-friendsofsymfony-rest-bundle
                         php-friendsofphp-php-cs-fixer
                         php-doctrine-inflector
                         php-api-platform-core))
    (synopsis "")
    (description "Generates documentation for your REST API from attributes")
    (home-page "")
    (license license:expat)))

(define-public php-mnapoli-piwik-twig-extension
  (package
    (name "php-mnapoli-piwik-twig-extension")
    (version "3.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mnapoli/MatomoTwigExtension.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rn0nzx8zy91mhb51g03ffwyn25ij97ylhhf44nwh9vk4g707hiy"))))
    (build-system composer-build-system)
    (inputs (list php-twig-twig))
    (native-inputs (list php-friendsofphp-php-cs-fixer
                         php-coveralls-php-coveralls
                         php-symfony-phpunit-bridge))
    (synopsis "")
    (description "This library integrates Matomo into Twig")
    (home-page "")
    (license license:expat)))

(define-public php-mgargano-simplehtmldom
  (package
    (name "php-mgargano-simplehtmldom")
    (version "1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/matgargano/simplehtmldom.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ss7ypcbffa35xjdp67yqz82x2n5xdvf47067p0bkrhbyz7axxgl"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "Composer package that gives you access to and (unlike all the others at this time) autoloads S.C. Chen's PHP Simple HTML DOM Parser Library")
    (home-page "http://simplehtmldom.sourceforge.net/")
    (license unknown-license!)))

(define-public php-lexik-form-filter-bundle
  (package
    (name "php-lexik-form-filter-bundle")
    (version "8.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lexik/LexikFormFilterBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12jr40lxiyn3ndj7falc1yxqgrzjpnc9csi8icgmiraw24yshijb"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-framework-bundle php-symfony-form
                  php-doctrine-orm))
    (native-inputs (list php-symfony-var-dumper php-symfony-phpunit-bridge
                         php-doctrine-mongodb-odm-bundle
                         php-doctrine-doctrine-bundle))
    (synopsis "")
    (description
     "This bundle aim to provide classes to build some form filters and then build a doctrine query from this form filter.")
    (home-page "https://github.com/lexik/LexikFormFilterBundle")
    (license license:expat)))

(define-public php-lcobucci-jwt
  (package
    (name "php-lcobucci-jwt")
    (version "5.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lcobucci/jwt.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1b0l68xaxldk1cn3r8nbykclvzjkpn0cr7f3mk4inpapra0bazqk"))))
    (build-system composer-build-system)
    (inputs (list php-psr-clock))
    (native-inputs (list php-phpunit-phpunit
                         php-phpstan-phpstan-strict-rules
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan-deprecation-rules
                         php-phpstan-phpstan
                         php-phpstan-extension-installer
                         php-phpbench-phpbench
                         php-lcobucci-coding-standard
                         php-lcobucci-clock
                         php-infection-infection))
    (synopsis "")
    (description
     "A simple library to work with JSON Web Token and JSON Web Signature")
    (home-page "")
    (license license:bsd-3)))

(define-public php-laminas-laminas-code
  (package
    (name "php-laminas-laminas-code")
    (version "4.17.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/laminas/laminas-code.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05gq28w8xl8my20d0gcnhwkh59sxnd42wvpyjj1mvpryfbpmbc1l"))))
    (build-system composer-build-system)
    (native-inputs (list php-vimeo-psalm
                         php-psalm-plugin-phpunit
                         php-phpunit-phpunit
                         php-laminas-laminas-stdlib
                         php-laminas-laminas-coding-standard
                         php-doctrine-annotations))
    (synopsis "")
    (description
     "Extensions to the PHP Reflection API, static code scanning, and code generation")
    (home-page "https://laminas.dev")
    (license license:bsd-3)))

(define-public php-kphoen-rulerz-bundle
  (package
    (name "php-kphoen-rulerz-bundle")
    (version "0.15.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/K-Phoen/RulerZBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ny66ygj5ijn2x041zki0s3d9ibr2sdgn8frkipgjm0dgmj03r0i"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-framework-bundle php-kphoen-rulerz-bridge
                  php-kphoen-rulerz))
    (native-inputs (list php-liip-rmt
                         php-matthiasnoback-symfony-dependency-injection-test
                         php-mikey179-vfsstream php-symfony-phpunit-bridge
                         php-phpunit-phpunit))
    (synopsis "")
    (description "Symfony2 Bundle for RulerZ")
    (home-page "https://github.com/K-Phoen/RulerZBundle")
    (license license:expat)))

(define-public php-kphoen-rulerz
  (package
    (name "php-kphoen-rulerz")
    (version "0.21.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/K-Phoen/rulerz.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0g95s5727vg01lqh4f0zsm49apraf491fp4k7h7s6slbb32l38vz"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-property-access php-hoa-ruler))
    (native-inputs (list php-liip-rmt
                         php-kphoen-rusty
                         php-behat-behat
                         php-phpspec-phpspec
                         php-coduo-phpspec-data-provider-extension
                         php-mikey179-vfsstream
                         php-solarium-solarium
                         php-illuminate-database
                         php-pomm-project-cli
                         php-pomm-project-model-manager
                         php-pomm-project-foundation
                         php-ruflin-elastica
                         php-elasticsearch-elasticsearch
                         php-doctrine-orm
                         php-vlucas-phpdotenv))
    (synopsis "")
    (description "Powerful implementation of the Specification pattern")
    (home-page "https://github.com/K-Phoen/RulerZ")
    (license license:expat)))

(define-public php-jms-serializer-bundle
  (package
    (name "php-jms-serializer-bundle")
    (version "5.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/schmittjoh/JMSSerializerBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qra0wm1f799y0prn2n085fv5plm07kx83zqydxzihplslp2h2an"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-framework-bundle
                  php-symfony-dependency-injection php-symfony-config
                  php-jms-metadata php-jms-serializer))
    (native-inputs (list php-symfony-yaml
                         php-symfony-validator
                         php-symfony-uid
                         php-symfony-twig-bundle
                         php-symfony-templating
                         php-symfony-stopwatch
                         php-symfony-form
                         php-symfony-finder
                         php-symfony-expression-language
                         php-phpunit-phpunit
                         php-doctrine-orm
                         php-doctrine-coding-standard
                         php-doctrine-annotations))
    (synopsis "")
    (description
     "Allows you to easily serialize, and deserialize data of any complexity")
    (home-page "http://jmsyst.com/bundles/JMSSerializerBundle")
    (license license:expat)))

(define-public php-jms-serializer
  (package
    (name "php-jms-serializer")
    (version "3.32.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/schmittjoh/serializer.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17v7afc57zvn1b576c9d4600015yyxyzw3mw0qj4n8bwm1w06pir"))))
    (build-system composer-build-system)
    (inputs (list php-phpstan-phpdoc-parser php-jms-metadata
                  php-doctrine-lexer php-doctrine-instantiator))
    (native-inputs (list php-twig-twig
                         php-symfony-yaml
                         php-symfony-validator
                         php-symfony-uid
                         php-symfony-translation
                         php-symfony-form
                         php-symfony-filesystem
                         php-symfony-expression-language
                         php-symfony-dependency-injection
                         php-symfony-clock
                         php-rector-rector
                         php-psr-container
                         php-phpunit-phpunit
                         php-phpstan-phpstan
                         php-phpbench-phpbench
                         php-ocramius-proxy-manager
                         php-jackalope-jackalope-doctrine-dbal
                         php-doctrine-phpcr-odm
                         php-doctrine-persistence
                         php-doctrine-orm
                         php-doctrine-coding-standard
                         php-doctrine-annotations))
    (synopsis "")
    (description
     "Library for (de-)serializing data of any complexity; supports XML, and JSON.")
    (home-page "http://jmsyst.com/libs/serializer")
    (license license:expat)))

(define-public php-javibravo-simpleue
  (package
    (name "php-javibravo-simpleue")
    (version "2.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/javibravo/simpleue.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i021i4wvak0hailx5kz13nf5yy5jsr37kx2jfn6578xvy6ndpr8"))))
    (build-system composer-build-system)
    (inputs (list php-psr-log))
    (native-inputs (list php-pda-pheanstalk php-aws-aws-sdk-php
                         php-predis-predis php-phpunit-phpunit))
    (synopsis "")
    (description "Php package to manage queue tasks in a simple way")
    (home-page "http://github.com/javibravo/simpleue")
    (license license:expat)))

(define-public php-j0k3r-php-readability
  (package
    (name "php-j0k3r-php-readability")
    (version "2.0.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/j0k3r/php-readability.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0si0z4m79mjapqnv1h4dhz7a92dc36956rhbnqwnl0wifrxyk3pr"))))
    (build-system composer-build-system)
    (inputs (list php-masterminds-html5 php-psr-log))
    (native-inputs (list php-rector-rector
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan
                         php-symfony-phpunit-bridge
                         php-monolog-monolog
                         php-friendsofphp-php-cs-fixer))
    (synopsis "")
    (description "Automatic article extraction from HTML")
    (home-page "")
    (license license:asl2.0)))

(define-public php-j0k3r-graby
  (package
    (name "php-j0k3r-graby")
    (version "2.5.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/j0k3r/graby.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gjqlb31idpa4n7nsbrfq1f008d9h6nxnh41v6apl0nrlkj66c43"))))
    (build-system composer-build-system)
    (inputs (list php-guzzlehttp-psr7
                  php-symfony-polyfill-intl-idn
                  php-symfony-options-resolver
                  php-smalot-pdfparser
                  php-simplepie-simplepie
                  php-http-message
                  php-http-httplug
                  php-http-discovery
                  php-http-client-common
                  php-monolog-monolog
                  php-j0k3r-php-readability
                  php-j0k3r-httplug-ssrf-plugin
                  php-j0k3r-graby-site-config
                  php-http-interop-http-factory-guzzle
                  php-fossar-htmlawed))
    (native-inputs (list php-symfony-phpunit-bridge
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan-deprecation-rules
                         php-phpstan-phpstan
                         php-phpstan-extension-installer
                         php-http-mock-client
                         php-http-guzzle6-adapter
                         php-guzzlehttp-guzzle
                         php-friendsofphp-php-cs-fixer))
    (synopsis "")
    (description "Graby helps you extract article content from web pages")
    (home-page "")
    (license license:expat)))

(define-public php-incenteev-composer-parameter-handler
  (package
    (name "php-incenteev-composer-parameter-handler")
    (version "2.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Incenteev/ParameterHandler.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1v09sb5j41fg7wpf0ld6ksk5in1cganc8nz0id65ly2frvijr1fk"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-yaml))
    (native-inputs (list php-symfony-phpunit-bridge php-symfony-filesystem
                         php-phpunit-phpunit php-phpspec-prophecy-phpunit
                         php-composer-composer))
    (synopsis "")
    (description "Composer script handling your ignored parameter file")
    (home-page "https://github.com/Incenteev/ParameterHandler")
    (license license:expat)))

(define-public php-html2text-html2text
  (package
    (name "php-html2text-html2text")
    (version "4.3.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mtibben/html2text.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gabz5p0y5zxwwyvka7aw4gfdywxyc81jzqy91skr8h1q7wgr96a"))))
    (build-system composer-build-system)
    (native-inputs (list php-phpunit-phpunit))
    (synopsis "")
    (description "Converts HTML to formatted plain text")
    (home-page "")
    (license license:gpl2+)))

(define-public php-guzzlehttp-psr7
  (package
    (name "php-guzzlehttp-psr7")
    (version "3.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/guzzle/psr7.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0637lfwjfb1x0rijdypwvs00l9yi0ajxiwlysc9isib5gi0802f0"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-php82 php-symfony-polyfill-php80
                  php-psr-http-message php-psr-http-factory))
    (native-inputs (list php-phpunit-phpunit php-http-psr7-integration-tests
                         php-jshttp-mime-db
                         php-http-interop-http-factory-tests
                         php-bamarni-composer-bin-plugin))
    (synopsis "")
    (description
     "PSR-7 message implementation that also provides common utility methods")
    (home-page "")
    (license license:expat)))

(define-public php-guzzlehttp-guzzle
  (package
    (name "php-guzzlehttp-guzzle")
    (version "8.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/guzzle/guzzle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yqxz1zhhawhml6374yvfcigq4jqlfixhrals7krm06alxwj6i0y"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-php82
                  php-symfony-polyfill-php80
                  php-psr-http-factory
                  php-psr-http-client
                  php-guzzlehttp-psr7
                  php-guzzlehttp-promises))
    (native-inputs (list php-psr-log
                         php-phpunit-phpunit
                         php-http-message-factory
                         php-guzzlehttp-test-server
                         php-guzzle-client-integration-tests
                         php-bamarni-composer-bin-plugin))
    (synopsis "")
    (description "Guzzle is a PHP HTTP client library")
    (home-page "")
    (license license:expat)))

(define-public php-friendsofsymfony-user-bundle
  (package
    (name "php-friendsofsymfony-user-bundle")
    (version "4.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/FriendsOfSymfony/FOSUserBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0bna1hsd69icc4d76c4j5zdhkvp9dz2j54qybrixwnkgffhjv3d0"))))
    (build-system composer-build-system)
    (inputs (list php-twig-twig
                  php-symfony-yaml
                  php-symfony-validator
                  php-symfony-twig-bundle
                  php-symfony-translation
                  php-symfony-security-core
                  php-symfony-security-bundle
                  php-symfony-routing
                  php-symfony-password-hasher
                  php-symfony-options-resolver
                  php-symfony-http-kernel
                  php-symfony-http-foundation
                  php-symfony-framework-bundle
                  php-symfony-form
                  php-symfony-event-dispatcher-contracts
                  php-symfony-event-dispatcher
                  php-symfony-dependency-injection
                  php-symfony-config))
    (native-inputs (list php-symfony-phpunit-bridge
                         php-symfony-mime
                         php-symfony-mailer
                         php-symfony-console
                         php-phpunit-phpunit
                         php-friendsofphp-php-cs-fixer
                         php-doctrine-doctrine-bundle))
    (synopsis "")
    (description "Symfony FOSUserBundle")
    (home-page "http://friendsofsymfony.github.com")
    (license license:expat)))

(define-public php-friendsofsymfony-rest-bundle
  (package
    (name "php-friendsofsymfony-rest-bundle")
    (version "3.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/FriendsOfSymfony/FOSRestBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1y589xkhxw9r98rilvad1s4sybdhl0il3qdcnl2zx9lasscvyv78"))))
    (build-system composer-build-system)
    (inputs (list php-willdurand-negotiation
                  php-willdurand-jsonp-callback-validator
                  php-symfony-security-core
                  php-symfony-routing
                  php-symfony-http-kernel
                  php-symfony-http-foundation
                  php-symfony-framework-bundle
                  php-symfony-event-dispatcher
                  php-symfony-deprecation-contracts
                  php-symfony-dependency-injection
                  php-symfony-config))
    (native-inputs (list php-symfony-yaml
                         php-symfony-web-profiler-bundle
                         php-symfony-validator
                         php-symfony-twig-bundle
                         php-symfony-serializer
                         php-symfony-security-bundle
                         php-symfony-phpunit-bridge
                         php-symfony-mime
                         php-symfony-form
                         php-symfony-expression-language
                         php-symfony-css-selector
                         php-symfony-browser-kit
                         php-symfony-asset
                         php-sensio-framework-extra-bundle
                         php-psr-log
                         php-psr-http-message
                         php-jms-serializer-bundle
                         php-jms-serializer
                         php-friendsofphp-php-cs-fixer
                         php-doctrine-annotations))
    (synopsis "")
    (description
     "This Bundle provides various tools to rapidly develop RESTful API's with Symfony")
    (home-page "http://friendsofsymfony.github.com")
    (license license:expat)))

(define-public php-friendsofsymfony-oauth-server-bundle
  (package
    (name "php-friendsofsymfony-oauth-server-bundle")
    (version "2.0.0-alpha.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url
              "https://github.com/FriendsOfSymfony/FOSOAuthServerBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1zhsqgirj4b946aqp6l9fzlh1xbw45fq76bzfd86z8x56wzz22r4"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-security-bundle php-symfony-framework-bundle
                  php-symfony-dependency-injection
                  php-friendsofsymfony-oauth2-php))
    (native-inputs (list php-willdurand-propel-typehintable-behavior
                         php-symfony-yaml
                         php-symfony-twig-bundle
                         php-symfony-templating
                         php-symfony-phpunit-bridge
                         php-symfony-form
                         php-symfony-console
                         php-symfony-class-loader
                         php-propel-propel1
                         php-phpunit-phpunit
                         php-phpstan-phpstan-shim
                         php-phpstan-phpstan-phpunit
                         php-mock-php-mock-phpunit
                         php-phing-phing
                         php-doctrine-orm
                         php-doctrine-mongodb-odm
                         php-doctrine-doctrine-bundle))
    (synopsis "")
    (description "Symfony2 OAuth Server Bundle")
    (home-page "http://friendsofsymfony.github.com")
    (license license:expat)))

(define-public php-friendsofsymfony-jsrouting-bundle
  (package
    (name "php-friendsofsymfony-jsrouting-bundle")
    (version "3.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/FriendsOfSymfony/FOSJsRoutingBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ynggjras5z59vj1hq7hdcn24r9339qxm956p16952j8zazg4a9n"))))
    (build-system composer-build-system)
    (inputs (list php-willdurand-jsonp-callback-validator
                  php-symfony-serializer php-symfony-framework-bundle
                  php-symfony-deprecation-contracts php-symfony-console))
    (native-inputs (list php-symfony-phpunit-bridge
                         php-symfony-expression-language
                         php-jakoch-phantomjs-installer
                         php-neronmoon-scriptsdev))
    (synopsis "")
    (description
     "A pretty nice way to expose your Symfony routing to client applications.")
    (home-page "http://friendsofsymfony.github.com")
    (license license:expat)))

(define-public php-enshrined-svg-sanitize
  (package
    (name "php-enshrined-svg-sanitize")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/darylldoyle/svg-sanitizer.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pbmxpa8q6m77bfsy0ygwzgmz35gz6lbrmpc0859x3qglh772c92"))))
    (build-system composer-build-system)
    (native-inputs (list php-phpunit-phpunit))
    (synopsis "")
    (description "An SVG sanitizer for PHP")
    (home-page "")
    (license license:gpl2+)))

(define-public php-egulias-email-validator
  (package
    (name "php-egulias-email-validator")
    (version "4.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/egulias/EmailValidator.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "181w6rwnpd0gd0f7va0mw0x3bivmi6aggpv1sfblkx7fbx0qs6r5"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-intl-idn php-doctrine-lexer))
    (native-inputs (list php-vimeo-psalm php-phpunit-phpunit))
    (synopsis "")
    (description "A library for validating emails against several RFCs")
    (home-page "https://github.com/egulias/EmailValidator")
    (license license:expat)))

(define-public php-doctrine-persistence
  (package
    (name "php-doctrine-persistence")
    (version "4.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/persistence.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14382lpscb66rmqw8ha40pmzl9rhalkvs37v3csrb3nc3a572k2n"))))
    (build-system composer-build-system)
    (inputs (list php-psr-cache php-doctrine-event-manager
                  php-doctrine-deprecations))
    (native-inputs (list php-symfony-finder
                         php-symfony-cache
                         php-phpunit-phpunit
                         php-doctrine-coding-standard
                         php-phpstan-phpstan-strict-rules
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan))
    (synopsis "")
    (description
     "The Doctrine Persistence project is a set of shared interfaces and functionality that the different Doctrine object mappers share.")
    (home-page "https://www.doctrine-project.org/projects/persistence.html")
    (license license:expat)))

(define-public php-doctrine-orm
  (package
    (name "php-doctrine-orm")
    (version "3.7.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/orm.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03h9bccqjbfl57hl7yl7dwffn9rx05f5apk7vdw61a2a9i3za4da"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-var-exporter
                  php-symfony-polyfill-php86
                  php-symfony-console
                  php-psr-cache
                  php-doctrine-persistence
                  php-doctrine-lexer
                  php-doctrine-instantiator
                  php-doctrine-inflector
                  php-doctrine-event-manager
                  php-doctrine-deprecations
                  php-doctrine-dbal
                  php-doctrine-collections))
    (native-inputs (list php-symfony-cache
                         php-psr-log
                         php-phpunit-phpunit
                         php-phpstan-phpstan-deprecation-rules
                         php-phpstan-phpstan
                         php-phpstan-extension-installer
                         php-phpbench-phpbench
                         php-doctrine-coding-standard))
    (synopsis "")
    (description "Object-Relational-Mapper for PHP")
    (home-page "https://www.doctrine-project.org/projects/orm.html")
    (license license:expat)))

(define-public php-doctrine-migrations
  (package
    (name "php-doctrine-migrations")
    (version "3.9.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/migrations.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0nhi2cvqgj0swnz6gnlnipk12cqbss9lfnkjxc6bxw86cgr57j8c"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-var-exporter
                  php-symfony-stopwatch
                  php-symfony-console
                  php-psr-log
                  php-doctrine-event-manager
                  php-doctrine-deprecations
                  php-doctrine-dbal))
    (native-inputs (list php-symfony-yaml
                         php-symfony-process
                         php-symfony-cache
                         php-phpunit-phpunit
                         php-phpstan-phpstan-symfony
                         php-phpstan-phpstan-strict-rules
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan-deprecation-rules
                         php-phpstan-phpstan
                         php-fig-log-test
                         php-doctrine-sql-formatter
                         php-doctrine-persistence
                         php-doctrine-orm
                         php-doctrine-coding-standard))
    (synopsis "")
    (description
     "PHP Doctrine Migrations project offer additional functionality on top of the database abstraction layer (DBAL) for versioning your database schema and easily deploying changes to it. It is a very easy to use and a powerful tool.")
    (home-page "https://www.doctrine-project.org/projects/migrations.html")
    (license license:expat)))

(define-public php-doctrine-event-manager
  (package
    (name "php-doctrine-event-manager")
    (version "2.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/event-manager.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vxalbgw351i8qs5vhd646q94d6q7zcn2jyx85gdhdc8yjv40f8b"))))
    (build-system composer-build-system)
    (native-inputs (list php-phpunit-phpunit php-phpstan-phpstan
                         php-phpdocumentor-guides-cli
                         php-doctrine-coding-standard))
    (synopsis "")
    (description
     "The Doctrine Event Manager is a simple PHP event system that was built to be used with the various Doctrine projects.")
    (home-page "https://www.doctrine-project.org/projects/event-manager.html")
    (license license:expat)))

(define-public php-doctrine-doctrine-migrations-bundle
  (package
    (name "php-doctrine-doctrine-migrations-bundle")
    (version "4.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/DoctrineMigrationsBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1sqrp36613siy45sq2wik8lb0ifjj20blc3fg1f75j6xm6fqjg5y"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-service-contracts
                  php-symfony-http-kernel
                  php-symfony-http-foundation
                  php-symfony-framework-bundle
                  php-symfony-deprecation-contracts
                  php-symfony-dependency-injection
                  php-symfony-console
                  php-symfony-config
                  php-psr-log
                  php-doctrine-migrations
                  php-doctrine-doctrine-bundle
                  php-doctrine-dbal))
    (native-inputs (list php-symfony-var-exporter
                         php-phpunit-phpunit
                         php-phpstan-phpstan-symfony
                         php-phpstan-phpstan-strict-rules
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan-deprecation-rules
                         php-phpstan-phpstan
                         php-doctrine-orm
                         php-doctrine-coding-standard
                         php-composer-semver))
    (synopsis "")
    (description "Symfony DoctrineMigrationsBundle")
    (home-page "https://www.doctrine-project.org")
    (license license:expat)))

(define-public php-doctrine-doctrine-bundle
  (package
    (name "php-doctrine-doctrine-bundle")
    (version "3.3.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/DoctrineBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0fqiw3dz8zms98l0nir7198lfap6par90p0hb7isw9ns2h9jkjy9"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-service-contracts
                  php-symfony-framework-bundle
                  php-symfony-doctrine-bridge
                  php-symfony-dependency-injection
                  php-symfony-console
                  php-symfony-config
                  php-symfony-cache
                  php-doctrine-sql-formatter
                  php-doctrine-persistence
                  php-doctrine-deprecations
                  php-doctrine-dbal))
    (native-inputs (list php-twig-twig
                         php-symfony-yaml
                         php-symfony-web-profiler-bundle
                         php-symfony-validator
                         php-symfony-twig-bridge
                         php-symfony-string
                         php-symfony-stopwatch
                         php-symfony-security-bundle
                         php-symfony-runtime
                         php-symfony-property-info
                         php-symfony-messenger
                         php-symfony-http-kernel
                         php-symfony-expression-language
                         php-symfony-doctrine-messenger
                         php-psr-log
                         php-phpunit-phpunit
                         php-phpstan-phpstan-symfony
                         php-phpstan-phpstan-strict-rules
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan
                         php-doctrine-orm
                         php-doctrine-coding-standard))
    (synopsis "")
    (description "Symfony DoctrineBundle")
    (home-page "https://www.doctrine-project.org")
    (license license:expat)))

(define-public php-doctrine-dbal
  (package
    (name "php-doctrine-dbal")
    (version "4.4.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/dbal.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07fghg9690i6rim6b1dd0pilwhdhq2q01rdqb66msh2yi52phs94"))))
    (build-system composer-build-system)
    (inputs (list php-psr-log php-psr-cache php-doctrine-deprecations))
    (native-inputs (list php-symfony-console
                         php-symfony-cache
                         php-squizlabs-php-codesniffer
                         php-slevomat-coding-standard
                         php-phpunit-phpunit
                         php-phpstan-phpstan-strict-rules
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan
                         php-jetbrains-phpstorm-stubs
                         php-fig-log-test
                         php-doctrine-coding-standard))
    (synopsis "")
    (description
     "Powerful PHP database abstraction layer (DBAL) with many features for database schema introspection and management.")
    (home-page "https://www.doctrine-project.org/projects/dbal.html")
    (license license:expat)))

(define-public php-doctrine-common
  (package
    (name "php-doctrine-common")
    (version "3.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/common.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0mbr8n26nn4n49zqgaxlgbyxr7wdm63mbz87f873vf2cc0dr8g7z"))))
    (build-system composer-build-system)
    (inputs (list php-doctrine-persistence))
    (native-inputs (list php-vimeo-psalm
                         php-symfony-phpunit-bridge
                         php-squizlabs-php-codesniffer
                         php-doctrine-coding-standard
                         php-phpunit-phpunit
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan
                         php-doctrine-collections))
    (synopsis "")
    (description
     "PHP Doctrine Common project is a library that provides additional functionality that other Doctrine projects depend on such as better reflection support, proxies and much more.")
    (home-page "https://www.doctrine-project.org/projects/common.html")
    (license license:expat)))

(define-public php-doctrine-collections
  (package
    (name "php-doctrine-collections")
    (version "3.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/collections.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01s14rayx7c1zqzj45dkikhrfmri0q83qb3p146y1swca1wa3j9i"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-php86 php-doctrine-deprecations))
    (native-inputs (list php-phpunit-phpunit php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan php-doctrine-coding-standard))
    (synopsis "")
    (description
     "PHP Doctrine Collections library that adds additional functionality on top of PHP arrays.")
    (home-page "https://www.doctrine-project.org/projects/collections.html")
    (license license:expat)))

(define-public php-defuse-php-encryption
  (package
    (name "php-defuse-php-encryption")
    (version "2.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/defuse/php-encryption.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19bwfcasjc9ilqm8rc1ms5dm13h3xzzzcc7fbg5lh3hg8pxiky1a"))))
    (build-system composer-build-system)
    (inputs (list php-paragonie-random-compat))
    (native-inputs (list php-phpunit-phpunit php-yoast-phpunit-polyfills))
    (synopsis "")
    (description "Secure PHP Encryption Library")
    (home-page "")
    (license license:expat)))

(define-public php-craue-config-bundle
  (package
    (name "php-craue-config-bundle")
    (version "3.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/craue/CraueConfigBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1n3xnbjhqrq73avsj9dcjmx010fb2z2ril668bb06jj2fiarhg02"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-validator
                  php-symfony-options-resolver
                  php-symfony-http-kernel
                  php-symfony-http-foundation
                  php-symfony-framework-bundle
                  php-symfony-form
                  php-symfony-dependency-injection
                  php-symfony-config
                  php-symfony-cache
                  php-psr-cache
                  php-doctrine-doctrine-bundle))
    (native-inputs (list php-symfony-web-profiler-bundle
                         php-symfony-twig-bundle
                         php-symfony-property-info
                         php-symfony-phpunit-bridge
                         php-symfony-browser-kit
                         php-symfony-asset
                         php-phpunit-phpunit
                         php-phpstan-phpstan-symfony
                         php-phpstan-phpstan-strict-rules
                         php-phpstan-phpstan-deprecation-rules
                         php-phpstan-phpstan
                         php-phpstan-extension-installer
                         php-doctrine-orm
                         php-craue-translations-tests
                         php-composer-semver))
    (synopsis "")
    (description
     "Database-stored settings made available via a service for your Symfony project.")
    (home-page "https://github.com/craue/CraueConfigBundle")
    (license license:expat)))

(define-public php-bdunogier-guzzle-site-authenticator
  (package
    (name "php-bdunogier-guzzle-site-authenticator")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wallabag/guzzle-site-authenticator.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1a715cr4xq9j3mxs91jf8851hzpnxcmg0bsvhj9wpmzpff5w0c7i"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-http-kernel
                  php-symfony-expression-language
                  php-symfony-dependency-injection
                  php-symfony-config
                  php-psr-log
                  php-guzzlehttp-guzzle))
    (native-inputs (list php-symfony-phpunit-bridge
                         php-nyholm-symfony-bundle-test php-monolog-monolog
                         php-friendsofphp-php-cs-fixer))
    (synopsis "")
    (description
     "A guzzle plugin that adds, if necessary, authentication data to requests. Uses credentials and cookies, with login requests to the sites.")
    (home-page "")
    (license license:expat)))

(define-public php-babdev-pagerfanta-bundle
  (package
    (name "php-babdev-pagerfanta-bundle")
    (version "4.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/BabDev/PagerfantaBundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00v506j4ylnn41llb0xwpnsgk1ngl9dxc2kjva1nrfygp0fkjdnd"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-routing
                  php-symfony-property-access
                  php-symfony-http-kernel
                  php-symfony-http-foundation
                  php-symfony-dependency-injection
                  php-symfony-config
                  php-psr-container
                  php-pagerfanta-core))
    (native-inputs (list php-twig-twig
                         php-symfony-translation
                         php-symfony-twig-bundle
                         php-symfony-twig-bridge
                         php-symfony-serializer
                         php-phpunit-phpunit
                         php-phpstan-phpstan-symfony
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan
                         php-phpstan-extension-installer
                         php-pagerfanta-twig
                         php-matthiasnoback-symfony-dependency-injection-test
                         php-jms-serializer-bundle
                         php-jms-serializer))
    (synopsis "")
    (description "Bundle integrating Pagerfanta with Symfony")
    (home-page "")
    (license license:expat)))

(define-public php-symfony-web-server-bundle
  (package
    (name "php-symfony-web-server-bundle")
    (version "4.4.44")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/web-server-bundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0r16dc65z05grhkvk7aj1rj5dsj57xm2kl2sig8ahs98fn1yc8kh"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-process
                  php-symfony-polyfill-php80
                  php-symfony-polyfill-ctype
                  php-symfony-http-kernel
                  php-symfony-dependency-injection
                  php-symfony-console
                  php-symfony-config))
    (synopsis "")
    (description
     "Provides commands for running applications using the PHP built-in web server")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-web-profiler-bundle
  (package
    (name "php-symfony-web-profiler-bundle")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/web-profiler-bundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "153338pi1vyx41r30anmfxw1y94qrs0m3kz0hmj3pb4bcqjlmxg0"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-twig-bundle php-symfony-routing
                  php-symfony-http-kernel php-symfony-framework-bundle
                  php-symfony-config))
    (native-inputs (list php-symfony-stopwatch php-symfony-runtime
                         php-symfony-css-selector php-symfony-console
                         php-symfony-browser-kit))
    (synopsis "")
    (description
     "Provides a development tool that gives detailed information about the execution of any request")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-var-dumper
  (package
    (name "php-symfony-var-dumper")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/var-dumper.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bng7b3asayw2qvs3aq2wlxllnc8kqy60b7zq4j2qr8dlig8qkzn"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-mbstring))
    (native-inputs (list php-twig-twig php-symfony-uid php-symfony-process
                         php-symfony-http-kernel php-symfony-console))
    (synopsis "")
    (description
     "Provides mechanisms for walking through any arbitrary PHP variable")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-phpunit-bridge
  (package
    (name "php-symfony-phpunit-bridge")
    (version "8.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/phpunit-bridge.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0l3vav3v38w7klb8v849cjkn6dy4315r52ad5lyglc8bqfa5122l"))))
    (build-system composer-build-system)
    (native-inputs (list php-symfony-error-handler
                         php-symfony-deprecation-contracts))
    (synopsis "")
    (description
     "Provides utilities for PHPUnit, especially user deprecation notices management")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-maker-bundle
  (package
    (name "php-symfony-maker-bundle")
    (version "1.68.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/maker-bundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wklanxqc8pvcccwb4nrrlwb7fsakgjz8shpcja0s98l7f5bq7sz"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-process
                  php-symfony-http-kernel
                  php-symfony-framework-bundle
                  php-symfony-finder
                  php-symfony-filesystem
                  php-symfony-deprecation-contracts
                  php-symfony-dependency-injection
                  php-symfony-console
                  php-symfony-config
                  php-nikic-php-parser
                  php-doctrine-inflector))
    (native-inputs (list php-twig-twig
                         php-symfony-yaml
                         php-symfony-security-http
                         php-symfony-security-core
                         php-symfony-phpunit-bridge
                         php-symfony-http-client
                         php-symfony-doctrine-bridge
                         php-doctrine-persistence
                         php-doctrine-orm
                         php-doctrine-doctrine-bundle
                         php-composer-semver))
    (synopsis "")
    (description
     "Symfony Maker helps you create empty commands, controllers, form classes, tests and more so you can forget about writing boilerplate code.")
    (home-page
     "https://symfony.com/doc/current/bundles/SymfonyMakerBundle/index.html")
    (license license:expat)))

(define-public php-symfony-debug-bundle
  (package
    (name "php-symfony-debug-bundle")
    (version "8.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/debug-bundle.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0sl8fflrhmg0q1hp3mi5pl5x2ckicg5wsnk5wfnwycapmpgns6s9"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-var-dumper php-symfony-twig-bridge
                  php-symfony-http-kernel php-symfony-dependency-injection
                  php-symfony-config))
    (native-inputs (list php-symfony-web-profiler-bundle))
    (synopsis "")
    (description
     "Provides a tight integration of the Symfony VarDumper component and the ServerLogCommand from MonologBridge into the Symfony full-stack framework")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-css-selector
  (package
    (name "php-symfony-css-selector")
    (version "8.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/css-selector.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12518bimsy7bk5hk65lvzx069xzkxfizdpf7bkh48fsm4ycvjqx6"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Converts CSS selectors to XPath expressions")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-browser-kit
  (package
    (name "php-symfony-browser-kit")
    (version "8.1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/browser-kit.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i43x24wi6v5an0k4g41cb9p4ln09y5ydyj45amjbg06j2mhnij4"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-dom-crawler))
    (native-inputs (list php-symfony-process php-symfony-mime
                         php-symfony-http-client php-symfony-css-selector))
    (synopsis "")
    (description
     "Simulates the behavior of a web browser, allowing you to make requests, click on links and submit forms programmatically")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-phpstan-phpstan-symfony
  (package
    (name "php-phpstan-phpstan-symfony")
    (version "2.0.20")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/phpstan/phpstan-symfony.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01714xk045l0gai82k6xpps45j9pxkc1rk6irivm113cqxly3qgm"))))
    (build-system composer-build-system)
    (inputs (list php-phpstan-phpstan))
    (native-inputs (list php-symfony-service-contracts
                         php-symfony-serializer
                         php-symfony-polyfill-php80
                         php-symfony-messenger
                         php-symfony-http-foundation
                         php-symfony-framework-bundle
                         php-symfony-form
                         php-symfony-dependency-injection
                         php-symfony-console
                         php-symfony-config
                         php-psr-container
                         php-phpunit-phpunit
                         php-phpstan-phpstan-strict-rules
                         php-phpstan-phpstan-phpunit
                         php-parallel-lint-php-parallel-lint))
    (synopsis "")
    (description "Symfony Framework extensions and rules for PHPStan")
    (home-page "")
    (license license:expat)))

(define-public php-phpstan-phpstan-phpunit
  (package
    (name "php-phpstan-phpstan-phpunit")
    (version "2.0.18")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/phpstan/phpstan-phpunit.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qw41c32r9hkm29nyfspp1q6k777xx97ayf4minn02qkr36r5zsl"))))
    (build-system composer-build-system)
    (inputs (list php-phpstan-phpstan php-phar-io-version))
    (native-inputs (list php-shipmonk-name-collision-detector
                         php-phpunit-phpunit
                         php-phpstan-phpstan-strict-rules
                         php-phpstan-phpstan-deprecation-rules
                         php-parallel-lint-php-parallel-lint
                         php-nikic-php-parser))
    (synopsis "")
    (description "PHPUnit extensions and rules for PHPStan")
    (home-page "")
    (license license:expat)))

(define-public php-phpstan-phpstan-doctrine
  (package
    (name "php-phpstan-phpstan-doctrine")
    (version "2.0.28")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/phpstan/phpstan-doctrine.git")
             (commit #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bpi3kr791qxfzzg2j3pdz4vsy5hji34q65h8sbhbrjda977mnrg"))))
    (build-system composer-build-system)
    (inputs (list php-phpstan-phpstan))
    (native-inputs (list php-symfony-uid
                         php-symfony-cache
                         php-shipmonk-name-collision-detector
                         php-ramsey-uuid
                         php-phpunit-phpunit
                         php-phpstan-phpstan-strict-rules
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan-deprecation-rules
                         php-parallel-lint-php-parallel-lint
                         php-nesbot-carbon
                         php-gedmo-doctrine-extensions
                         php-doctrine-persistence
                         php-doctrine-orm
                         php-doctrine-mongodb-odm
                         php-doctrine-lexer
                         php-doctrine-dbal
                         php-doctrine-common
                         php-doctrine-collections
                         php-doctrine-annotations
                         php-cweagans-composer-patches
                         php-composer-semver
                         php-cache-array-adapter))
    (synopsis "")
    (description "Doctrine extensions for PHPStan")
    (home-page "")
    (license license:expat)))

