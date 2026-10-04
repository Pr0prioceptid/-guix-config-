(define-module (my-packages wallabag)
               #:use-module (guix packages)
               #:use-module (guix git-download)
               #:use-module (guix build-system composer)
               #:use-module ((guix licenses) #:prefix license:)
               #:use-module (guix utils)
               #:use-module (guix build-system copy)
               #:use-module (guix gexp))

(define-public php-wallabag-wallabag
  (package
    (name "php-wallabag-wallabag")
    (version "2.6.14")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wallabag/wallabag.git")
             (commit version)))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a38k879h71aff5c3bknvh59nicr7yxai12c7i11pjah96fzwnik"))))
    (build-system composer-build-system)
    (inputs (list php-willdurand-hateoas php-symfony-framework-bundle
                  php-symfony-expression-language
                  php-symfony-dependency-injection php-jms-serializer-bundle))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ggqkp3bpl2q1ghcmf327mjzhca3ssvg3698zrs80j08z64fzcbq"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-expression-language php-jms-serializer
                  php-jms-metadata))
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
             (commit version)))
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
             (commit version)))
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
    (version "3.29.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/twigphp/Twig.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10vv333fksx52bgicv12g7n6c3wi6y1srkpaj41bkrn1n59ndbr5"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-ctype php-symfony-polyfill-mbstring
                  php-symfony-deprecation-contracts))
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
             (commit (string-append "v" version))))
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
    (version "3.29.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/twigphp/twig-extra-bundle.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12d4v3hy3in8a4sjnlak3r1y4vwiw2pxcrxwh653clyh0lp91qa1"))))
    (build-system composer-build-system)
    (inputs (list php-twig-twig php-symfony-twig-bundle
                  php-symfony-framework-bundle))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1w7dsbq4kbrdm3lqb2j6b0w4f6m459k7hl54n0nm7pws5kcgzqx2"))))
    (build-system composer-build-system)
    (inputs (list php-tecnickcom-tc-lib-pdf))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0i2ln3p5n7bmqyd79v1hngpsznnjfjlvdfcs5y5gvjcb3ss89jiy"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-translation-contracts
                  php-symfony-polyfill-mbstring php-symfony-polyfill-ctype
                  php-symfony-deprecation-contracts))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11pbi3y1dll8lk0m403jxrcj3rv6y8l93m0h515xdfdl9m5673ws"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-http-kernel php-symfony-http-foundation
                  php-symfony-twig-bridge php-symfony-dependency-injection
                  php-symfony-config))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04iayrc9a95j3n173f338vq3rnriyafpmwbg5q1ryjm7khb9yh38"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-ctype php-symfony-deprecation-contracts))
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hq3g3cydxbyhhw71r42m45481pa7qd176kbqi1f1jfbpc2jpnm9"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-service-contracts php-symfony-password-hasher
                  php-symfony-event-dispatcher-contracts))
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "189sfmrp7ib6ylwgxwgj57cgnyajaf66as5q6i7ml5k1mfdln8rs"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-deprecation-contracts))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fgw3xwrcy58j3karfn080h75fa7z3zxfrrr9hfpj8bjywr38azl"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-deprecation-contracts
                  php-symfony-dependency-injection
                  php-friendsofphp-proxy-manager-lts))
    
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "082ad5gi7m9mcnsg8wik3yh1pf6r0jx3z4qi8864yxcm6mjvay3a"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-mbstring php-symfony-polyfill-intl-idn))
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "060ir9q91kaj5sk2aw8nqncz12r0ikx0qhgsrvxngs99gbrrz0vc"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-mbstring
                  php-symfony-deprecation-contracts))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bh3rqdbcl1wnkjsk4461zsibl42m46ncqpszdbid6s8qpf3zkcg"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-mailer))
    
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19p10mx11sgw7jq2s6kzink85m2b1hm8i9v9ybrprcaavw3w0hh3"))))
    (build-system composer-build-system)
    
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14wjmflz374q7yzcwivax8q5vbf3isq7h53dsk2d4nmd0hrg6wr8"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-event-dispatcher-contracts
                  php-symfony-deprecation-contracts))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gqb5lc45skwrbbg6qb347jgkgplq967x0lqwy4imbdlipizwh5r"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-var-dumper php-symfony-polyfill-php85
                  php-psr-log))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mabfafzvbw1kkrc60b6ax28s9n0lrzn9vkv7m0ngzf8xjypjnzh"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-mbstring php-symfony-polyfill-ctype))
    
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "186a1qv74zzzi4fpkyd4gz96sdhq2yis222bbvyv1mgpnkxi00xp"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-var-exporter php-symfony-service-contracts
                  php-symfony-deprecation-contracts php-psr-container))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0s7da2pr45q2i1fjsx0wn18y28qpr5pra2lw4014iimz741j4i86"))))
    (build-system composer-build-system)
    (inputs (list php-psr-log))
    
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1pi5skq2vssc78wdcrdqp547r9apczlj6kc9qlwaljhpgy5kf5zn"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-string php-symfony-service-contracts
                  php-symfony-polyfill-php85 php-symfony-polyfill-mbstring
                  php-symfony-deprecation-contracts))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0aysx0wy1g8yychp7agrbh07ii3rmq6l43b76a1899acgf96z9rf"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-ctype php-symfony-filesystem
                  php-symfony-deprecation-contracts))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "131k3lspxrnkqzvfwp9zzbs1dw2zhffn67z542nv9kfxz9g66npl"))))
    (build-system composer-build-system)
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
             (commit version)))
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
             (commit version)))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "114amlfppglwshipwy3c8g4mi2zdxyi66p7f4lcj61qf8l2i70zn"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-http-kernel php-symfony-framework-bundle
                  php-symfony-dependency-injection php-symfony-config
                  php-doctrine-annotations))
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
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
             (commit (string-append "v" version))))
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
             (commit version)))
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
             (commit version)))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "155mm8fl60gg41m9az4li7p0w96d6vpn65xa01pc1qrnclrc5kmm"))))
    (build-system composer-build-system)
    (inputs (list php-psr-http-message))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mn7fwlcv3ck3dr75i2gik7m68m8kjn528pbka2a4g4f7xxmr5lg"))))
    (build-system composer-build-system)
    (inputs (list php-pragmarx-random))
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
             (commit version)))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1jvsx6mrnqvpj2bnzdgshy0mg23r89df2hz9053whls5fsqwb7p7"))))
    (build-system composer-build-system)
    (inputs (list php-psr-http-message php-clue-stream-filter))
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
             (commit version)))
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
                  ;;commented out packages are virtual 
                  ;; packages, and are provided
                  ;;  by php-http/discovery
                  ;;php-psr-http-factory-implementation 
                  php-http-stopwatch-plugin
                  php-http-message
                  php-http-logger-plugin
                  php-http-httplug
                  php-http-discovery
                  ;;php-http-client-implementation
                  php-http-client-common))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jjs4rpq8fxvmgwvsx7xig9cx5phpqz1c27ifwd1v0niirc9lwij"))))
    (build-system composer-build-system)
    (inputs (list php-psr-http-message php-psr-http-client php-http-promise))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0qz6ghqzfbwkff9rcy0xqd71spq0jpij9a7a6xfblwg8qnvybi9k"))))
    (build-system composer-build-system)
    (inputs (list php-http-discovery php-guzzlehttp-guzzle php-http-httplug))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ig4vpbwzb7a3dayd34bf63p23pbg1bl1zaa6nmx25p4qpg8rnyp"))))
    (build-system composer-build-system)
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
             (commit version)))
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
             (commit version)))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0hnwrsskqbilx70hqn31y8gjzy2m27cdnadrm2i83nkq336wvm6h"))))
    (build-system composer-build-system)
    (inputs (list php-phpseclib-phpseclib))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02yghp01rskn5ivwgyaykax6ldlmwm03fk005w49w64vlj0pslq0"))))
    (build-system composer-build-system)
    (inputs (list php-twig-twig php-pagerfanta-core))
    
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19vh8zr60f5j97h6bjn64hpkwfs32w7f4xa9ps25iacr6vfsw7qs"))))
    (build-system composer-build-system)
    (inputs (list php-pagerfanta-core php-doctrine-orm))
    
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bwh3xnys7cszb8s0mql8fyljapwfncm3kk9hh05gckzrcgr99c1"))))
    (build-system composer-build-system)
    (inputs (list php-webimpress-safe-writer php-laminas-laminas-code))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07w7rb35j7x3kx5jhclhaqj21hwn4n1vqf7171m0w47cnwkx78j8"))))
    (build-system composer-build-system)
    (inputs (list php-psr-log php-symfony-framework-bundle))
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
             (commit version)))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rn0nzx8zy91mhb51g03ffwyn25ij97ylhhf44nwh9vk4g707hiy"))))
    (build-system composer-build-system)
    (inputs (list php-twig-twig))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ss7ypcbffa35xjdp67yqz82x2n5xdvf47067p0bkrhbyz7axxgl"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "Composer package that gives you access to and (unlike all the others at this time) autoloads S.C. Chen's PHP Simple HTML DOM Parser Library")
    (home-page "http://simplehtmldom.sourceforge.net/")
    (license license:expat)))

(define-public php-lexik-form-filter-bundle
  (package
    (name "php-lexik-form-filter-bundle")
    (version "8.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lexik/LexikFormFilterBundle.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12jr40lxiyn3ndj7falc1yxqgrzjpnc9csi8icgmiraw24yshijb"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-framework-bundle php-symfony-form
                  php-doctrine-orm))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1b0l68xaxldk1cn3r8nbykclvzjkpn0cr7f3mk4inpapra0bazqk"))))
    (build-system composer-build-system)
    (inputs (list php-psr-clock))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05gq28w8xl8my20d0gcnhwkh59sxnd42wvpyjj1mvpryfbpmbc1l"))))
    (build-system composer-build-system)
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ny66ygj5ijn2x041zki0s3d9ibr2sdgn8frkipgjm0dgmj03r0i"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-framework-bundle php-kphoen-rulerz-bridge
                  php-kphoen-rulerz))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0g95s5727vg01lqh4f0zsm49apraf491fp4k7h7s6slbb32l38vz"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-property-access php-hoa-ruler))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qra0wm1f799y0prn2n085fv5plm07kx83zqydxzihplslp2h2an"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-framework-bundle
                  php-symfony-dependency-injection php-symfony-config
                  php-jms-metadata php-jms-serializer))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17v7afc57zvn1b576c9d4600015yyxyzw3mw0qj4n8bwm1w06pir"))))
    (build-system composer-build-system)
    (inputs (list php-phpstan-phpdoc-parser php-jms-metadata
                  php-doctrine-lexer php-doctrine-instantiator))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i021i4wvak0hailx5kz13nf5yy5jsr37kx2jfn6578xvy6ndpr8"))))
    (build-system composer-build-system)
    (inputs (list php-psr-log))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0si0z4m79mjapqnv1h4dhz7a92dc36956rhbnqwnl0wifrxyk3pr"))))
    (build-system composer-build-system)
    (inputs (list php-masterminds-html5 php-psr-log))
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
             (commit version)))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1v09sb5j41fg7wpf0ld6ksk5in1cganc8nz0id65ly2frvijr1fk"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-yaml))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gabz5p0y5zxwwyvka7aw4gfdywxyc81jzqy91skr8h1q7wgr96a"))))
    (build-system composer-build-system)
    
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0637lfwjfb1x0rijdypwvs00l9yi0ajxiwlysc9isib5gi0802f0"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-php82 php-symfony-polyfill-php80
                  php-psr-http-message php-psr-http-factory))
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
             (commit version)))
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
             (commit (string-append "v" version))))
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
             (commit version)))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1zhsqgirj4b946aqp6l9fzlh1xbw45fq76bzfd86z8x56wzz22r4"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-security-bundle php-symfony-framework-bundle
                  php-symfony-dependency-injection
                  php-friendsofsymfony-oauth2-php))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ynggjras5z59vj1hq7hdcn24r9339qxm956p16952j8zazg4a9n"))))
    (build-system composer-build-system)
    (inputs (list php-willdurand-jsonp-callback-validator
                  php-symfony-serializer php-symfony-framework-bundle
                  php-symfony-deprecation-contracts php-symfony-console))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pbmxpa8q6m77bfsy0ygwzgmz35gz6lbrmpc0859x3qglh772c92"))))
    (build-system composer-build-system)
    (arguments
      (list
        #:tests? #f))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "181w6rwnpd0gd0f7va0mw0x3bivmi6aggpv1sfblkx7fbx0qs6r5"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-intl-idn php-doctrine-lexer))
    
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14382lpscb66rmqw8ha40pmzl9rhalkvs37v3csrb3nc3a572k2n"))))
    (build-system composer-build-system)
    (inputs (list php-psr-cache php-doctrine-event-manager
                  php-doctrine-deprecations))
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
             (commit version)))
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
             (commit version)))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vxalbgw351i8qs5vhd646q94d6q7zcn2jyx85gdhdc8yjv40f8b"))))
    (build-system composer-build-system)
    (arguments
     (list
      #:tests? #f))
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
             (commit version)))
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
             (commit version)))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07fghg9690i6rim6b1dd0pilwhdhq2q01rdqb66msh2yi52phs94"))))
    (build-system composer-build-system)
    (inputs (list php-psr-log php-psr-cache php-doctrine-deprecations))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0mbr8n26nn4n49zqgaxlgbyxr7wdm63mbz87f873vf2cc0dr8g7z"))))
    (build-system composer-build-system)
    (inputs (list php-doctrine-persistence))
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01s14rayx7c1zqzj45dkikhrfmri0q83qb3p146y1swca1wa3j9i"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-php86 php-doctrine-deprecations))
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
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19bwfcasjc9ilqm8rc1ms5dm13h3xzzzcc7fbg5lh3hg8pxiky1a"))))
    (build-system composer-build-system)
    (inputs (list php-paragonie-random-compat))
    
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
             (commit version)))
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
             (commit version)))
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
             (commit version)))
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
    (synopsis "")
    (description "Bundle integrating Pagerfanta with Symfony")
    (home-page "")
    (license license:expat)))

(define-public php-symfony-expression-language
  (package
    (name "php-symfony-expression-language")
    (version "8.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/expression-language.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cq1nkg39fmjjn24vz2f5n3zkhycb03ijf98aqw0a4dd9q1iab8w"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-service-contracts php-symfony-cache))
    (synopsis "")
    (description
     "Provides an engine that can compile and evaluate expressions")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-jms-metadata
  (package
    (name "php-jms-metadata")
    (version "2.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/schmittjoh/metadata.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0izj0x0f5iaz2p83mj8qz7nwia4ipb9r1whldckfc36p6816dc74"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Class/method/property metadata management in PHP")
    (home-page "")
    (license license:expat)))

(define-public php-symfony-service-contracts
  (package
    (name "php-symfony-service-contracts")
    (version "3.7.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/service-contracts.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08j26cqx6hmsfsisx4yagjrs34h6rxy324anrnapq15sxdgqz2bv"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-deprecation-contracts php-psr-container))
    (synopsis "")
    (description "Generic abstractions related to writing services")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-cache
  (package
    (name "php-symfony-cache")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/cache.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vgin041dd775grqw73qqb3c7y6mc2px239w7kaf7rh537hhqf8w"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-var-exporter php-symfony-service-contracts
                  php-symfony-cache-contracts php-psr-log php-psr-cache))
    (synopsis "")
    (description "Provides extended PSR-6, PSR-16 (and tags) implementations")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-deprecation-contracts
  (package
    (name "php-symfony-deprecation-contracts")
    (version "3.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/deprecation-contracts.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15w8jpagzkg5fhz7lryr8g4bpamiha5b4rwn6zmsp3f5kxgi5jhc"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "A generic function and convention to trigger deprecation notices")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-psr-container
  (package
    (name "php-psr-container")
    (version "2.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-fig/container.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02438i87fa344xm6iv2wsk5pmyjkacdiaa085a4zggw1ivwch8dc"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Common Container Interface (PHP FIG PSR-11)")
    (home-page "https://github.com/php-fig/container")
    (license license:expat)))

(define-public php-symfony-var-exporter
  (package
    (name "php-symfony-var-exporter")
    (version "8.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/var-exporter.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gykdbdyjz56h8qsixw7xa8lbrxi1jnwg23cfv5vj95caakyfm0c"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-deepclone
                  php-symfony-deprecation-contracts))
    (synopsis "")
    (description
     "Provides tools to export, instantiate, hydrate, clone and lazy-load PHP objects")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-cache-contracts
  (package
    (name "php-symfony-cache-contracts")
    (version "3.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/cache-contracts.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0bkbvcrfi0430z7wz789la6yma82a63k58p5ckb5nkak34vqd6v5"))))
    (build-system composer-build-system)
    (inputs (list php-psr-cache))
    (synopsis "")
    (description "Generic abstractions related to caching")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-psr-cache
  (package
    (name "php-psr-cache")
    (version "3.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-fig/cache.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17z58lcndi97s2lxivv9pcr9yqvrzvrhinwvr2xh4g310wc6pcal"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Common interface for caching libraries")
    (home-page "")
    (license license:expat)))

(define-public php-symfony-polyfill-deepclone
  (package
    (name "php-symfony-polyfill-deepclone")
    (version "1.42.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/polyfill-deepclone.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pyla8vi5rd57m1m76y8m22ymfgy2lr997p64qzyw2f1jfpp2cdl"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Symfony polyfill for the deepclone extension")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-phpstan-phpdoc-parser
  (package
    (name "php-phpstan-phpdoc-parser")
    (version "2.3.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/phpstan/phpdoc-parser.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "058nij0795n2byf0g8wa1qnk427cfl070x7a8lb75nmmlf7b6p8z"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "PHPDoc parser with support for nullable, intersection and generic types")
    (home-page "")
    (license license:expat)))

(define-public php-doctrine-lexer
  (package
    (name "php-doctrine-lexer")
    (version "3.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/lexer.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0hnvzwz1k07f3pcax4inmsyykjh09gr0w81a8mggk691hdqlvl1h"))))
    (build-system composer-build-system)
    (arguments
     (list
      #:tests? #f))
    (synopsis "")
    (description
     "PHP Doctrine Lexer parser library that can be used in Top-Down, Recursive Descent Parsers.")
    (home-page "https://www.doctrine-project.org/projects/lexer.html")
    (license license:expat)))

(define-public php-doctrine-instantiator
  (package
    (name "php-doctrine-instantiator")
    (version "2.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/instantiator.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0mznpgilqd7nlkd01ii6fp8s3qncq6anncji3k1qksbl5580nnz2"))))
    (build-system composer-build-system)
    (arguments
     (list
      #:tests? #f))
    (synopsis "")
    (description
     "A small, lightweight utility to instantiate objects in PHP without invoking their constructors")
    (home-page "https://www.doctrine-project.org/projects/instantiator.html")
    (license license:expat)))

(define-public php-symfony-polyfill-php85
  (package
    (name "php-symfony-polyfill-php85")
    (version "1.41.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/polyfill-php85.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "015mlkxmvamzzx5yjflxggz6nxiggm4hgarr1mf4swrbg1575am3"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "Symfony polyfill backporting some PHP 8.5+ features to lower PHP versions")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-polyfill-mbstring
  (package
    (name "php-symfony-polyfill-mbstring")
    (version "1.38.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/polyfill-mbstring.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19bkjhnysqi1a72xay9dlaczafwnr4dxlixk033j7rlnqm4a3xr6"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Symfony polyfill for the Mbstring extension")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-filesystem
  (package
    (name "php-symfony-filesystem")
    (version "8.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/filesystem.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1yiw6crrp5agsdfg4xa0rdlh31m0sx0f3nn4s30dk78ixxihg8dw"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-mbstring php-symfony-polyfill-ctype
                  php-symfony-deprecation-contracts))
    
    (synopsis "")
    (description "Provides basic utilities for the filesystem")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-polyfill-ctype
  (package
    (name "php-symfony-polyfill-ctype")
    (version "1.37.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/polyfill-ctype.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xnpbmaclrfw984scs3sqs7mynma9v74b38zbwbb05vrr9c00v9v"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Symfony polyfill for ctype functions")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-event-dispatcher-contracts
  (package
    (name "php-symfony-event-dispatcher-contracts")
    (version "3.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/event-dispatcher-contracts.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0rzzq3vl2pzy2gjn11py19ywh74rmb12dfsqg9q7gmsi45d4w4f1"))))
    (build-system composer-build-system)
    (inputs (list php-psr-event-dispatcher))
    (synopsis "")
    (description "Generic abstractions related to dispatching event")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-psr-event-dispatcher
  (package
    (name "php-psr-event-dispatcher")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-fig/event-dispatcher.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rxjscznzihbpgngwci61ji8qy5c623qmpy9zpqbj0f5vv8l99kp"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Standard interfaces for event handling.")
    (home-page "")
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
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bng7b3asayw2qvs3aq2wlxllnc8kqy60b7zq4j2qr8dlig8qkzn"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-mbstring))
    (synopsis "")
    (description
     "Provides mechanisms for walking through any arbitrary PHP variable")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-masterminds-html5
  (package
    (name "php-masterminds-html5")
    (version "2.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Masterminds/html5-php.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "139gc8y8fnwq6ki1j85725jrmh1q53qjmn15npvf9s9kqn88mswp"))))
    (build-system composer-build-system)
    
    (synopsis "")
    (description "An HTML5 parser and serializer.")
    (home-page "http://masterminds.github.io/html5-php")
    (license license:expat)))

(define-public php-grandt-relativepath
  (package
    (name "php-grandt-relativepath")
    (version "1.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Grandt/PHPRelativePath.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1486mydx22n4bank3bw1r883mfvnj946wi5ixldz27lg9g7hlmjj"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "A class for cleaning up/collapsing relative paths. Like real_path, but without the need for the path to exist on the filesystem.")
    (home-page "https://github.com/Grandt/PHPRelativePath")
    (license license:lgpl2.1)))

(define-public php-grandt-phpresizegif
  (package
    (name "php-grandt-phpresizegif")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Grandt/PHPResizeGif.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1v9kcqsnncn32irx33khqlnhbn1h1nvnnifxvinzvjp4hnwh8c0y"))))
    (build-system composer-build-system)
    (inputs (list php-grandt-binstring))
    (synopsis "")
    (description
     "GIF89a compliant Gif resizer, including transparency and optimized gifs with sub sized elements.")
    (home-page "https://github.com/Grandt/PHPResizeGif")
    (license license:lgpl2.1)))

(define-public php-phpzip-phpzip
  (package
    (name "php-phpzip-phpzip")
    (version "2.0.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Grandt/PHPZip.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09yn2xx83ca2qbgqi5r3vqg0panv5il8jk88iwzjkf0w79di31b7"))))
    (build-system composer-build-system)
    (inputs (list php-grandt-phpzipmerge php-grandt-relativepath
                  php-grandt-binstring))
    (synopsis "")
    (description
     "Package to create and stream archives of compressed files in ZIP format with PHP 5.3+")
    (home-page "https://github.com/Grandt/PHPZip")
    (license license:lgpl2.1)))

(define-public php-grandt-binstring
  (package
    (name "php-grandt-binstring")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Grandt/PHPBinString.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a5zkh2n80lwdg4bipinnpv9hyz9f7s9vf6nri84qlx4659y4jgh"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "A class for working around the use of mbstring.func_override")
    (home-page "https://github.com/Grandt/PHPBinString")
    (license license:lgpl2.1)))

(define-public php-grandt-phpzipmerge
  (package
    (name "php-grandt-phpzipmerge")
    (version "1.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Grandt/PHPZipMerge.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1pyzv82fs8375pas4hjlrmh1ddczlidxbz4xw4ldz9g70i670la7"))))
    (build-system composer-build-system)
    (inputs (list php-grandt-relativepath php-grandt-binstring))
    (synopsis "")
    (description "Merge and stream multiple Zip files on the fly.")
    (home-page "https://github.com/Grandt/PHPZipMerge")
    (license license:lgpl2.1)))

(define-public php-symfony-translation-contracts
  (package
    (name "php-symfony-translation-contracts")
    (version "3.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/translation-contracts.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1zalpdvkxjnvh3w1knqda3agca7jhqc2a15cjng5x0g4n20rjk64"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Generic abstractions related to translation")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-string
  (package
    (name "php-symfony-string")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/string.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gy0sc2c0f16jx0d27czjk8vyd2pciyn56xlxhd0xzlqijhcsdsl"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-mbstring
                  php-symfony-polyfill-intl-normalizer
                  php-symfony-polyfill-intl-grapheme
                  php-symfony-polyfill-ctype))
    (synopsis "")
    (description
     "Provides an object-oriented API to strings and deals with bytes, UTF-8 code points and grapheme clusters in a unified way")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-polyfill-intl-normalizer
  (package
    (name "php-symfony-polyfill-intl-normalizer")
    (version "1.42.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/polyfill-intl-normalizer.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12x4x8k80g66bl20n44xkxww76s6ggdpp63pm74fff76p4nv6fd0"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "Symfony polyfill for intl's Normalizer class and related functions")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-polyfill-intl-grapheme
  (package
    (name "php-symfony-polyfill-intl-grapheme")
    (version "1.41.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/polyfill-intl-grapheme.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11841cq9kcqhrl5i9y9z2ljz3cha66mp9zga2yw9n0xvybxdcwa3"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Symfony polyfill for intl's grapheme_* functions")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-twig-bridge
  (package
    (name "php-symfony-twig-bridge")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/twig-bridge.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1r70bvp2f3apcjyzgk246b5k4yzq2c7sximqnxhqfmfg2ac1afj0"))))
    (build-system composer-build-system)
    (inputs (list php-twig-twig php-symfony-translation-contracts))
    (synopsis "")
    (description
     "Provides integration for Twig with various Symfony components")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-tecnickcom-tc-lib-pdf
  (package
    (name "php-tecnickcom-tc-lib-pdf")
    (version "8.76.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-pdf.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yrhkn91k496dnfnzpgk2p5sfp9va8ka1ipj3ly514mbrghryzgn"))))
    (build-system composer-build-system)
    (inputs (list php-tecnickcom-tc-lib-pdf-parser
                  php-tecnickcom-tc-lib-pdf-graph
                  php-tecnickcom-tc-lib-pdf-page
                  php-tecnickcom-tc-lib-unicode
                  php-tecnickcom-tc-lib-unicode-data
                  php-tecnickcom-tc-lib-pdf-sign
                  php-tecnickcom-tc-lib-pdf-encrypt
                  php-tecnickcom-tc-lib-file
                  php-tecnickcom-tc-lib-pdf-font
                  php-tecnickcom-tc-lib-pdf-image
                  php-tecnickcom-tc-lib-color
                  php-tecnickcom-tc-lib-barcode))
    (synopsis "")
    (description "PHP PDF Library")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-tecnickcom-tc-lib-pdf-parser
  (package
    (name "php-tecnickcom-tc-lib-pdf-parser")
    (version "3.16.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-pdf-parser.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04lgsx1xz7vs5vwyhak2s11h809z6lgp531xbpzfcy5d0bkl64pv"))))
    (build-system composer-build-system)
    (inputs (list php-tecnickcom-tc-lib-pdf-filter))
    (synopsis "")
    (description "PHP library to parse PDF documents")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-tecnickcom-tc-lib-pdf-graph
  (package
    (name "php-tecnickcom-tc-lib-pdf-graph")
    (version "2.18.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-pdf-graph.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0k9kb7rl9kil2qs1b5bykgk52m61s5g5wp77mq3mcxk5aiqp7vf2"))))
    (build-system composer-build-system)
    (inputs (list php-tecnickcom-tc-lib-pdf-encrypt
                  php-tecnickcom-tc-lib-color))
    (synopsis "")
    (description "PHP library containing PDF graphic and geometric methods")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-tecnickcom-tc-lib-pdf-page
  (package
    (name "php-tecnickcom-tc-lib-pdf-page")
    (version "4.16.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-pdf-page.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ria8i2yapyc748szm77c1sdfhymkyfg8zlvi09cwx4wfvsqgkji"))))
    (build-system composer-build-system)
    (inputs (list php-tecnickcom-tc-lib-pdf-encrypt
                  php-tecnickcom-tc-lib-color))
    (synopsis "")
    (description "PHP library containing PDF page formats and definitions")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-tecnickcom-tc-lib-unicode
  (package
    (name "php-tecnickcom-tc-lib-unicode")
    (version "3.0.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-unicode.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1x8pb1x1sg22s6yn9da5sj6fz10irvjars2006vid92ihsx6an3f"))))
    (build-system composer-build-system)
    (inputs (list php-tecnickcom-tc-lib-unicode-data))
    (synopsis "")
    (description "PHP library to process UTF-8 and Unicode text")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-tecnickcom-tc-lib-unicode-data
  (package
    (name "php-tecnickcom-tc-lib-unicode-data")
    (version "3.0.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-unicode-data.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1pv391wcpv922yqrmkwlsh4m96mb2g39364k1a7dn70m7fksk6hx"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "PHP library containing Unicode definitions")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-tecnickcom-tc-lib-pdf-sign
  (package
    (name "php-tecnickcom-tc-lib-pdf-sign")
    (version "2.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-pdf-sign.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0krqh2hk9pf3jmk8vmzilg233a99zjdd1y4v2fd7bmb5mzim5h13"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "PHP library to create and embed digital signatures (PKCS#7 / CAdES / PAdES) in PDF documents")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-tecnickcom-tc-lib-pdf-encrypt
  (package
    (name "php-tecnickcom-tc-lib-pdf-encrypt")
    (version "2.11.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-pdf-encrypt.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ndd71v6x78k967y1kqlpk2rvfil3xd88d15b114cr73wjjph7vl"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "PHP library to encrypt and decrypt PDF data")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-tecnickcom-tc-lib-file
  (package
    (name "php-tecnickcom-tc-lib-file")
    (version "3.9.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-file.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0rr5jv4ggzk20c4ww5zba58jh4nkf2lw76h88zr3ii29ynik7l4s"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "PHP library for safe low-level file access: byte-level reads, path allowlisting, file caching and directory lookup")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-tecnickcom-tc-lib-pdf-font
  (package
    (name "php-tecnickcom-tc-lib-pdf-font")
    (version "4.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-pdf-font.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1zilw842gphb78qh3bhzw7c8i282wl461hdj0lzyf0xl0lvmhzb8"))))
    (build-system composer-build-system)
    (inputs (list php-tecnickcom-tc-lib-pdf-encrypt
                  php-tecnickcom-tc-lib-unicode-data
                  php-tecnickcom-tc-lib-file))
    (synopsis "")
    (description "PHP library containing PDF font methods and utilities")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-tecnickcom-tc-lib-pdf-image
  (package
    (name "php-tecnickcom-tc-lib-pdf-image")
    (version "3.14.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-pdf-image.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17r0bsvkkxxidfrqjgqyzr30yw4lcq306pi0azhgi32nhja4ddf3"))))
    (build-system composer-build-system)
    (inputs (list php-tecnickcom-tc-lib-pdf-encrypt php-tecnickcom-tc-lib-file))
    (synopsis "")
    (description "PHP library containing PDF Image methods")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-tecnickcom-tc-lib-color
  (package
    (name "php-tecnickcom-tc-lib-color")
    (version "3.0.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-color.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zc4swcmjswn3banqhhx8gj143pr0pvbl1lwdimgcjfqvc6n7szy"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "PHP library to manipulate various color representations")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-tecnickcom-tc-lib-barcode
  (package
    (name "php-tecnickcom-tc-lib-barcode")
    (version "2.16.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-barcode.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0lrhaa2lp4f0jgpll99zljf60029yww25n7h8ri264jcl5m3i1yn"))))
    (build-system composer-build-system)
    (inputs (list php-tecnickcom-tc-lib-color))
    (synopsis "")
    (description
     "PHP library to generate 73 types of linear, 2D and postal barcodes as SVG, PNG, HTML or GD images")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-tecnickcom-tc-lib-pdf-filter
  (package
    (name "php-tecnickcom-tc-lib-pdf-filter")
    (version "2.11.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tecnickcom/tc-lib-pdf-filter.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1m1inrkmf8lf41fmbdbcw5bbdjnlxa8p245z0isb9ih1vz1rki0x"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "PHP library to decode PDF compression and encryption filters")
    (home-page "https://tcpdf.org")
    (license license:lgpl3+)))

(define-public php-symfony-property-access
  (package
    (name "php-symfony-property-access")
    (version "8.1.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/property-access.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03nc9yvga5ylzczg2fwjbyv0f2fdxjwn3bh2xv9ki257yrda21ig"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-property-info))
    
    (synopsis "")
    (description
     "Provides functions to read and write from/to an object or array using a simple string notation")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-password-hasher
  (package
    (name "php-symfony-password-hasher")
    (version "8.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/password-hasher.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10pi5kzdxk16z5vgq3sn4f01v4yr6vmd76055b5ka8iad5gkywxn"))))
    (build-system composer-build-system)
    
    (synopsis "")
    (description "Provides password hashing utilities")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-property-info
  (package
    (name "php-symfony-property-info")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/property-info.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xkmnj5p3p3zsybb70dlj0b0y85pzj201vc0qq6p8qmqmgm35yls"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-type-info php-symfony-string))
    (synopsis "")
    (description
     "Extracts information about PHP class' properties using metadata of popular sources")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-type-info
  (package
    (name "php-symfony-type-info")
    (version "8.1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/type-info.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "114d6kj96i6brnq0bppmz45gnh3zrd3wj9plqv52v5bpapayj6sy"))))
    (build-system composer-build-system)
    (inputs (list php-psr-container))
    
    (synopsis "")
    (description "Extracts PHP types information.")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-security-csrf
  (package
    (name "php-symfony-security-csrf")
    (version "8.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/security-csrf.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1708wy0lhv0lirvmkm7p69m0xbr4liyk2569d1zji331anby5xr3"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-security-core php-symfony-deprecation-contracts))
    (synopsis "")
    (description "Symfony Security Component - CSRF Library")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-clock
  (package
    (name "php-symfony-clock")
    (version "8.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/clock.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1l9x8bypgkaf41lr142qm2k9306m24ia08y3r19xb70qja5w031w"))))
    (build-system composer-build-system)
    (inputs (list php-psr-clock))
    (synopsis "")
    (description "Decouples applications from the system clock")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-psr-clock
  (package
    (name "php-psr-clock")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-fig/clock.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1zry96f0vbbijrbqw9pc01gaj38kbbcw1bpcfg4kwhjsn4m7a5vx"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Common interface for reading the clock.")
    (home-page "https://github.com/php-fig/clock")
    (license license:expat)))

(define-public php-friendsofphp-proxy-manager-lts
  (package
    (name "php-friendsofphp-proxy-manager-lts")
    (version "1.0.19")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/FriendsOfPHP/proxy-manager-lts.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pr7v0lnvz13jwldngni1pvjnfgfd5slb6pvdwjy0sdl9v55rv4n"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-filesystem php-laminas-laminas-code))
    
    (synopsis "")
    (description
     "Adding support for a wider range of PHP versions to ocramius/proxy-manager")
    (home-page "https://github.com/FriendsOfPHP/proxy-manager-lts")
    (license license:expat)))

(define-public php-symfony-polyfill-php84
  (package
    (name "php-symfony-polyfill-php84")
    (version "1.38.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/polyfill-php84.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1a4cq1wqgr4yg4ac3jx20ybsdh52v03g94vk0w86lmhfg10waba2"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "Symfony polyfill backporting some PHP 8.4+ features to lower PHP versions")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-monolog-bridge
  (package
    (name "php-symfony-monolog-bridge")
    (version "8.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/monolog-bridge.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05zsmmf6pcc51bmv1ifghnr4pm5v4zd7kcqfr1da7qwwzapnbyfz"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-http-kernel php-symfony-service-contracts
                  php-monolog-monolog))
    (synopsis "")
    (description
     "Provides integration for Monolog with various Symfony components")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-monolog-monolog
  (package
    (name "php-monolog-monolog")
    (version "3.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Seldaek/monolog.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0j92xc1as3y5693gx0xwff8g0r0pffpm6lphwjbc9bfggvp4wir6"))))
    (build-system composer-build-system)
    (inputs (list php-psr-log))
    (synopsis "")
    (description
     "Sends your logs to files, sockets, inboxes, databases and various web services")
    (home-page "https://github.com/Seldaek/monolog")
    (license license:expat)))

(define-public php-symfony-polyfill-intl-idn
  (package
    (name "php-symfony-polyfill-intl-idn")
    (version "1.42.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/polyfill-intl-idn.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16h50z83ca2zwsnv56jljf7gyv2ymb14wqf9k88ypixnykf165sa"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-intl-normalizer))
    (synopsis "")
    (description
     "Symfony polyfill for intl's idn_to_ascii and idn_to_utf8 functions")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-polyfill-intl-icu
  (package
    (name "php-symfony-polyfill-intl-icu")
    (version "1.38.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/polyfill-intl-icu.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ypibpjfa8gqgj2qhl663dqvkxzbjhs06kip0kzyim88fr0jcwr1"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Symfony polyfill for intl's ICU-related data and classes")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-doctrine-deprecations
  (package
    (name "php-doctrine-deprecations")
    (version "1.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/deprecations.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xrrgcs5irx7wzzv4w0590dxp08yyqyfl6zlb9zfpsvvbpz65r9r"))))
    (build-system composer-build-system)
    (arguments
     (list
      #:tests? #f))
    (synopsis "")
    (description
     "A small layer on top of trigger_error(E_USER_DEPRECATED) or PSR-3 logging with options to disable all deprecations or selectively for packages.")
    (home-page "https://www.doctrine-project.org/")
    (license license:expat)))

(define-public php-gedmo-doctrine-extensions
  (package
    (name "php-gedmo-doctrine-extensions")
    (version "3.22.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url
              "https://github.com/doctrine-extensions/DoctrineExtensions.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i77qdmyyga4s2d2hdmbnq7rcsk3cl9whb7khq5nic0x4q274w2y"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-string
                  php-symfony-cache
                  php-psr-clock
                  php-psr-cache
                  php-doctrine-persistence
                  php-doctrine-event-manager
                  php-doctrine-deprecations
                  php-doctrine-collections))
    (synopsis "")
    (description "Doctrine behavioral extensions")
    (home-page "http://gediminasm.org/")
    (license license:expat)))

(define-public php-symfony-polyfill-php86
  (package
    (name "php-symfony-polyfill-php86")
    (version "1.41.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/polyfill-php86.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16kr1vv60s4vvr2cabpvzi8zgb96nbpjigq6gqfwvgwg47dj9v2r"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "Symfony polyfill backporting some PHP 8.6+ features to lower PHP versions")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-yaml
  (package
    (name "php-symfony-yaml")
    (version "8.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/yaml.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0x26mxqz8vmkw40k3fvln012qq3smnin7lxc41bgak49si1nwvqm"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-ctype))
    
    (synopsis "")
    (description "Loads and dumps YAML files")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-psr-http-message-bridge
  (package
    (name "php-symfony-psr-http-message-bridge")
    (version "8.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/psr-http-message-bridge.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05xjqb4bx0607kmw3k2gcdyk295x7p0h7qhfrpk82z3zpv6r79m9"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-http-foundation php-psr-http-message))
    (synopsis "")
    (description "PSR HTTP message bridge")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-symfony-polyfill-php80
  (package
    (name "php-symfony-polyfill-php80")
    (version "1.37.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/polyfill-php80.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cmwg2p0r5gnc9s8xf35qd8824f2cmzfcbnfqmw2i16vqqvy0mi6"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "Symfony polyfill backporting some PHP 8.0+ features to lower PHP versions")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-sentry-sentry
  (package
    (name "php-sentry-sentry")
    (version "4.32.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/getsentry/sentry-php.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "06m67mg2902zdl0b03z3mfvibhv2rba72dv9jfxyq5l26hnx0245"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-options-resolver php-psr-log
                  php-jean85-pretty-package-versions php-guzzlehttp-psr7))
    (synopsis "")
    (description "PHP SDK for Sentry (http://sentry.io)")
    (home-page "http://sentry.io")
    (license license:expat)))

(define-public php-jean85-pretty-package-versions
  (package
    (name "php-jean85-pretty-package-versions")
    (version "2.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Jean85/pretty-package-versions.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ls33x7q47xgff317q9xkbl34h86w4spi8fd4n5asycmw97gg7d6"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "A library to get pretty versions strings of installed dependencies")
    (home-page "")
    (license license:expat)))

(define-public php-symfony-polyfill-php82
  (package
    (name "php-symfony-polyfill-php82")
    (version "1.38.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/polyfill-php82.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0k5656lzzyyn8h3l6lrbb021s96al1ddlpjpjg3hkr54xnl3lziy"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "Symfony polyfill backporting some PHP 8.2+ features to lower PHP versions")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-psr-http-factory
  (package
    (name "php-psr-http-factory")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-fig/http-factory.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00vwd2m7q7dzgywk47xsg0rw9pvlfb6vr1pzg6prbbwzb4z1cqvy"))))
    (build-system composer-build-system)
    (inputs (list php-psr-http-message))
    (synopsis "")
    (description "PSR-17: Common interfaces for PSR-7 HTTP message factories")
    (home-page "")
    (license license:expat)))

(define-public php-doctrine-annotations
  (package
    (name "php-doctrine-annotations")
    (version "2.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/annotations.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08gbrm6s473ga7nm57s0032hl04zcha2gxryb30aih74wc6m3800"))))
    (build-system composer-build-system)
    (inputs (list php-psr-cache php-doctrine-lexer))
    (synopsis "")
    (description "Docblock Annotations Parser")
    (home-page "https://www.doctrine-project.org/projects/annotations.html")
    (license license:expat)))

(define-public php-lcobucci-clock
  (package
    (name "php-lcobucci-clock")
    (version "3.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lcobucci/clock.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "18qrmjwnd3kr87fszvn41nx2k24fvzpdwjy7f01y1bc1j9wcn73s"))))
    (build-system composer-build-system)
    (inputs (list php-psr-clock))
    (synopsis "")
    (description "Yet another clock abstraction")
    (home-page "")
    (license license:expat)))

(define-public php-endroid-qr-code
  (package
    (name "php-endroid-qr-code")
    (version "6.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/endroid/qr-code.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0lw0lann9af7axlislfh5dxk8w5xrcahrmlq7vkykavnn3h47sjz"))))
    (build-system composer-build-system)
    (inputs (list php-bacon-bacon-qr-code))
    (synopsis "")
    (description "Endroid QR Code")
    (home-page "https://github.com/endroid/qr-code")
    (license license:expat)))

(define-public php-bacon-bacon-qr-code
  (package
    (name "php-bacon-bacon-qr-code")
    (version "3.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Bacon/BaconQrCode.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bndf27yagdyjwxzj9iw05ry5p92zkac64ihl0cq6dlz3xaaijgp"))))
    (build-system composer-build-system)
    (arguments
     (list
      #:tests? #f))
    (inputs (list php-dasprid-enum))
    (synopsis "")
    (description "BaconQrCode is a QR code generator for PHP.")
    (home-page "https://github.com/Bacon/BaconQrCode")
    (license license:bsd-2)))

(define-public php-dasprid-enum
  (package
    (name "php-dasprid-enum")
    (version "1.0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/DASPRiD/Enum.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03sx5d10iyc3kih1sv5biimvmj4cmwrni81pja4mj8vqnm2g43xy"))))
    (build-system composer-build-system)
    (arguments
     (list
      #:tests? #f))
    (synopsis "")
    (description "PHP 7.1 enum implementation")
    (home-page "")
    (license license:bsd-2)))

(define-public php-spomky-labs-otphp
  (package
    (name "php-spomky-labs-otphp")
    (version "11.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Spomky-Labs/otphp.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0mvxsf361fqc5ngn69wrq2g8pis4a0qc5wc481kl7xqmh4fasq0b"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-deprecation-contracts php-psr-clock
                  php-paragonie-constant-time-encoding))
    
    (synopsis "")
    (description
     "A PHP library for generating one time passwords according to RFC 4226 (HOTP Algorithm) and the RFC 6238 (TOTP Algorithm) and compatible with Google Authenticator")
    (home-page "https://github.com/Spomky-Labs/otphp")
    (license license:expat)))

(define-public php-paragonie-constant-time-encoding
  (package
    (name "php-paragonie-constant-time-encoding")
    (version "3.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/paragonie/constant_time_encoding.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0hws824rik7inbvfwafs780mhb85ha3my5yrb93yvihs9jmfya9d"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "Constant-time Implementations of RFC 4648 Encoding (Base-64, Base-32, Base-16)")
    (home-page "")
    (license license:expat)))

(define-public php-pragmarx-random
  (package
    (name "php-pragmarx-random")
    (version "0.2.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/antonioribeiro/random.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qg50cn3i6v57ww9jnk96xd5sbp8x7fdd3xy198lglqzhp3d6r4p"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Create random chars, numbers, strings")
    (home-page "https://github.com/antonioribeiro/random")
    (license license:expat)))

(define-public php-clue-stream-filter
  (package
    (name "php-clue-stream-filter")
    (version "1.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clue/stream-filter.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qxyvl6w2f47gwdcxyckp8cgg6i45fy5aiz8a229c74nzl8zqfgk"))))
    (build-system composer-build-system)
    (arguments
     (list
      #:tests? #f))
    (synopsis "")
    (description "A simple and modern approach to stream filtering in PHP")
    (home-page "https://github.com/clue/stream-filter")
    (license license:expat)))

(define-public php-http-stopwatch-plugin
  (package
    (name "php-http-stopwatch-plugin")
    (version "1.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-http/stopwatch-plugin.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bw6dca4al0xpj5rfcn47hg1ap8jsakdiak37lrxdgz46hsf5h5r"))))
    (build-system composer-build-system)
    (inputs (list php-http-client-common php-symfony-stopwatch))
    
    (synopsis "")
    (description "Symfony Stopwatch plugin for HTTPlug")
    (home-page "http://httplug.io")
    (license license:expat)))

(define-public php-http-logger-plugin
  (package
    (name "php-http-logger-plugin")
    (version "1.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-http/logger-plugin.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "13gp75xjd47z6w84vsd4pc47y98njq0wg66gmlw1i52v90038kn6"))))
    (build-system composer-build-system)
    (inputs (list php-http-message php-http-client-common php-psr-log))
    
    (synopsis "")
    (description "PSR-3 Logger plugin for HTTPlug")
    (home-page "http://httplug.io")
    (license license:expat)))

(define-public php-symfony-stopwatch
  (package
    (name "php-symfony-stopwatch")
    (version "8.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/stopwatch.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11db4qmv2hhpabaggnchkqvqw2grwpdy1khsfdxp9lc0k04d0l0b"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-service-contracts))
    (synopsis "")
    (description "Provides a way to profile code")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-psr-http-client
  (package
    (name "php-psr-http-client")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-fig/http-client.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ca0dcl72k2ra137fs7gx9n8n1hsmii3cxpd29cph14m7i7h3lf6"))))
    (build-system composer-build-system)
    (inputs (list php-psr-http-message))
    (synopsis "")
    (description "Common interface for HTTP clients")
    (home-page "https://github.com/php-fig/http-client")
    (license license:expat)))

(define-public php-http-promise
  (package
    (name "php-http-promise")
    (version "1.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/php-http/promise.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cf3s0c7hhmmycv5wxi0fwh07zmcjw6lrm4a3q3f8p6dbhafdkh2"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Promise used for asynchronous HTTP requests")
    (home-page "http://httplug.io")
    (license license:expat)))

(define-public php-guzzlehttp-promises
  (package
    (name "php-guzzlehttp-promises")
    (version "3.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/guzzle/promises.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0s8cbnnzgcfp2n20wz0jy1x44y356ry2ksmlbxn2s3ry4gy9jj98"))))
    (build-system composer-build-system)
    (arguments
      (list
        #:tests? #f))
    (synopsis "")
    (description "Guzzle promises library")
    (home-page "")
    (license license:expat)))

(define-public php-phpseclib-phpseclib
  (package
    (name "php-phpseclib-phpseclib")
    (version "4.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/phpseclib/phpseclib.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10qxl2aijsa9v508m2kzaj1hlvh205w7x6m3zls7a38aqrmlhs7s"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-php82
                  php-paragonie-constant-time-encoding))
    (synopsis "")
    (description
     "PHP Secure Communications Library - Pure-PHP implementations of RSA, AES, SSH2, SFTP, X.509 etc.")
    (home-page "https://phpseclib.com/")
    (license license:expat)))

(define-public php-pagerfanta-core
  (package
    (name "php-pagerfanta-core")
    (version "4.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Pagerfanta/core.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0sd6cyx7745zxd3cb9n4bxjczbq72jg3hyf5r31qdpvpp34vpi6f"))))
    (build-system composer-build-system)
    
    (synopsis "")
    (description "Core Pagerfanta API")
    (home-page "")
    (license license:expat)))

(define-public php-doctrine-inflector
  (package
    (name "php-doctrine-inflector")
    (version "2.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/inflector.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ndj6ajl2pq97i9syasmbkysrn5h3g90giq3s6073r0llfw2qm9q"))))
    (build-system composer-build-system)
    (arguments
     (list
      #:tests? #f))
    (synopsis "")
    (description
     "PHP Doctrine Inflector is a small library that can perform string manipulations with regard to upper/lowercase and singular/plural forms of words.")
    (home-page "https://www.doctrine-project.org/projects/inflector.html")
    (license license:expat)))

(define-public php-webimpress-safe-writer
  (package
    (name "php-webimpress-safe-writer")
    (version "2.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/webimpress/safe-writer.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wfk49dcyv3xijklrrqscjlikvc0j5hclfyjbxsxvycc4na12qgq"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "Tool to write files safely, to avoid race conditions")
    (home-page "")
    (license license:bsd-2)))

(define-public php-zircote-swagger-php
  (package
    (name "php-zircote-swagger-php")
    (version "6.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/zircote/swagger-php.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jic4q83p0yc7rjbirl3wqlgbblaqdf8r9dy2n0mv51w3n8firkm"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-yaml
                  php-symfony-finder
                  php-symfony-deprecation-contracts
                  php-symfony-console
                  php-radebatz-type-info-extras
                  php-psr-log
                  php-phpstan-phpdoc-parser
                  php-nikic-php-parser))
    (synopsis "")
    (description
     "Generate interactive documentation for your RESTful API using PHP attributes (preferred) or PHPDoc annotations")
    (home-page "https://github.com/zircote/swagger-php")
    (license license:asl2.0)))

(define-public php-phpdocumentor-type-resolver
  (package
    (name "php-phpdocumentor-type-resolver")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/phpDocumentor/TypeResolver.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "173x02x9h99jphjvpvsngwzqjkf0rja4jbsdc7wmrcvkr5khvp1c"))))
    (build-system composer-build-system)
    (inputs (list php-doctrine-deprecations php-phpstan-phpdoc-parser
                  php-phpdocumentor-reflection-common))
    (synopsis "")
    (description
     "A PSR-5 based resolver of Class names, Types and Structural Element Names")
    (home-page "")
    (license license:expat)))

(define-public php-phpdocumentor-reflection-docblock
  (package
    (name "php-phpdocumentor-reflection-docblock")
    (version "6.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/phpDocumentor/ReflectionDocBlock.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0r7r4y8928171cqvpm1g6a5mjkc54hvc4mc2vhgbi4b0s0m88lzb"))))
    (build-system composer-build-system)
    (inputs (list php-doctrine-deprecations php-phpstan-phpdoc-parser
                  php-phpdocumentor-reflection-common php-webmozart-assert
                  php-phpdocumentor-type-resolver))
    (synopsis "")
    (description
     "With this component, a library can provide support for annotations via DocBlocks or otherwise retrieve information that is embedded in a DocBlock.")
    (home-page "")
    (license license:expat)))

(define-public php-radebatz-type-info-extras
  (package
    (name "php-radebatz-type-info-extras")
    (version "1.0.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/DerManoMann/type-info-extras.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vlp4d9myz7mw2m9dwi001kiidfxh64jl37vf2alqc2kh94cqpvs"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-type-info php-phpstan-phpdoc-parser))
    (synopsis "")
    (description "Extras for symfony/type-info")
    (home-page "http://radebatz.net/mano/")
    (license license:expat)))

(define-public php-nikic-php-parser
  (package
    (name "php-nikic-php-parser")
    (version "5.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nikic/PHP-Parser.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cih1smfimy2ykbsyrfmy9744mxvw28lszfjf2ryrw1biqz082pl"))))
    (build-system composer-build-system)
    
    (synopsis "")
    (description "A PHP parser written in PHP")
    (home-page "")
    (license license:bsd-3)))

(define-public php-phpdocumentor-reflection-common
  (package
    (name "php-phpdocumentor-reflection-common")
    (version "2.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/phpDocumentor/ReflectionCommon.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1q685cpwbfxqy42iz61xxv6zbcc1qskn07nkipflj6c5s935l8jy"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "Common reflection classes used by phpdocumentor to reflect the code structure")
    (home-page "http://www.phpdoc.org")
    (license license:expat)))

(define-public php-webmozart-assert
  (package
    (name "php-webmozart-assert")
    (version "2.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/webmozarts/assert.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1km35vayy4rfb7hd3cy55i4r4h92cpbqf0yxjp2xlbp0psgqj5dy"))))
    (build-system composer-build-system)
    (synopsis "")
    (description
     "Assertions to validate method input/output with nice error messages.")
    (home-page "")
    (license license:expat)))

(define-public php-kphoen-rulerz-bridge
  (package
    (name "php-kphoen-rulerz-bridge")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/K-Phoen/rulerz-bridge.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1v3vk3xcf81ca5kpfb1b58msn1g6ivfhnb4536c86l7jbzcv89cr"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-form php-symfony-validator php-kphoen-rulerz))
    (synopsis "")
    (description "Symfony RulerZ Bridge")
    (home-page "https://github.com/K-Phoen/rulerz-bridge")
    (license license:expat)))

(define-public php-hoa-ruler
  (package
    (name "php-hoa-ruler")
    (version "2.17.05.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Ruler.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0nc7y75djlgd1p3l67yd1jkz2a31553jzyw93mhwhims8mpxs4af"))))
    (build-system composer-build-system)
    (inputs (list php-hoa-visitor
                  php-hoa-protocol
                  php-hoa-file
                  php-hoa-exception
                  php-hoa-consistency
                  php-hoa-compiler))
    
    (synopsis "")
    (description "The Hoa\\Ruler library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

(define-public php-hoa-visitor
  (package
    (name "php-hoa-visitor")
    (version "2.17.01.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Visitor.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16nf8d1mxga0fgx233nxgxmk22ms04iwvhjgkqzb22abj27254qb"))))
    (build-system composer-build-system)
    (inputs (list php-hoa-consistency))
    
    (synopsis "")
    (description "The Hoa\\Visitor library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

(define-public php-hoa-protocol
  (package
    (name "php-hoa-protocol")
    (version "1.17.01.14")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Protocol.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kqzmnqwm9wz9d9x5qsa7r2d548iajkl72rm0ixyl592wxvhrw0b"))))
    (build-system composer-build-system)
    (inputs (list php-hoa-exception php-hoa-consistency))
    
    (synopsis "")
    (description "The Hoa\\Protocol library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

(define-public php-hoa-file
  (package
    (name "php-hoa-file")
    (version "1.17.07.11")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/File.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zh51sdbnysz1r7a8cfbvs86188djgczlxv8c8avd40kl6wgac0s"))))
    (build-system composer-build-system)
    (inputs (list php-hoa-iterator php-hoa-stream php-hoa-exception
                  php-hoa-event php-hoa-consistency))
    
    (synopsis "")
    (description "The Hoa\\File library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

(define-public php-hoa-consistency
  (package
    (name "php-hoa-consistency")
    (version "2.17.08.29")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Consistency.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0dmnxfgchh0bg5zds4flh0n7a6j79m06k701lk3x5l5x6x3lsmja"))))
    (build-system composer-build-system)
    
    (synopsis "")
    (description "The Hoa\\Consistency library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

(define-public php-hoa-compiler
  (package
    (name "php-hoa-compiler")
    (version "3.17.08.08")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Compiler.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0s7m8cizp806l1yjn2d8pifxq9v966g6ss347f5z3hia5g89frs7"))))
    (build-system composer-build-system)
    (inputs (list php-hoa-visitor
                  php-hoa-regex
                  php-hoa-protocol
                  php-hoa-math
                  php-hoa-iterator
                  php-hoa-file
                  php-hoa-exception
                  php-hoa-consistency))
    
    (synopsis "")
    (description "The Hoa\\Compiler library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

(define-public php-hoa-exception
  (package
    (name "php-hoa-exception")
    (version "2.17.08.30")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Exception.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1906smi9jqb70qzh5wp2gg16bznwrldvbx3r3nrvfiyrxkv68a64"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'create-autoloader
            (lambda _
              (mkdir-p "vendor")
              (call-with-output-file "vendor/autoload.php"
                (lambda (port)
                  (display
                   "<?php
spl_autoload_register(function ($class) {
    if (strncmp($class, 'Hoa\\\\Exception\\\\', 15) === 0) {
        $file = __DIR__ . '/../Source/' .
                str_replace('\\\\', '/', substr($class, 15)) .
                '.php';
        if (is_file($file))
            require $file;
    }

    if (strncmp($class, 'Hoa\\\\Event\\\\', 12) === 0) {
        $file = __DIR__ .
                '/../../event/' .
                str_replace('\\\\', '/', substr($class, 12)) .
                '.php';
        if (is_file($file))
            require $file;
    }
}); "
                   port)))))
      #:install-plan
      #~'(("Source/" "share/web/hoa/exception/Source/")
          ("vendor/autoload.php"
           "share/web/hoa/exception/vendor/autoload.php"))))
    (inputs
     (list php-hoa-event-bootstrap
           php-hoa-consistency))
    (synopsis "Hoa Exception library")
    (description
     "The Hoa\\Exception library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

;;(define-public php-hoa-exception
;;  (package
;;    (name "php-hoa-exception")
;;    (version "2.17.08.30")
;;    (source
;;     (origin
;;       (method git-fetch)
;;       (uri (git-reference
;;             (url "https://github.com/hoaproject/Exception.git")
;;             (commit version)))
;;       (file-name (git-file-name name version))
;;       (sha256
;;        (base32 "1906smi9jqb70qzh5wp2gg16bznwrldvbx3r3nrvfiyrxkv68a64"))))
;;    (build-system composer-build-system)
;;    (arguments
;;     (list
;;      #:tests? #f
;;      #:phases
;;      #~(modify-phases %standard-phases
;;          (add-before 'install 'remove-bootstrap-dependency
;;            (lambda _
;;              ;; Hoa Exception normally requires hoa/event, but Event
;;              ;; depends on Exception.  During this bootstrap build,
;;              ;; provide Event's source through php-hoa-event-bootstrap
;;              ;; instead of asking composer-build-system to install it
;;              ;; as a normal Composer dependency.
;;              (substitute* "composer.json"
;;                (("\"hoa/event\"[[:space:]]*:[[:space:]]*\"dev-master\"[[:space:]]*,?"
;;                  "")
;;                 (("\"hoa/consistency\"[[:space:]]*:[[:space:]]*\"dev-master\",")
;;                  "\"hoa/consistency\":\"dev-master\"")))))
;;
;;          (add-after 'install 'install-event-bootstrap
;;            (lambda* (#:key inputs outputs #:allow-other-keys)
;;              (let* ((out (assoc-ref outputs "out"))
;;                     (event
;;                      (assoc-ref inputs
;;                                 "php-hoa-event-bootstrap"))
;;                     (event-source
;;                      (string-append
;;                       event
;;                       "/share/web/hoa/event")))
;;                ;; The Composer classloader generated by the build system
;;                ;; needs to be able to find Hoa\\Event while building/
;;                ;; using Hoa\\Exception.
;;                (mkdir-p
;;                 (string-append out "/share/web/hoa/event"))
;;                (copy-recursively
;;                 event-source
;;                 (string-append
;;                  out "/share/web/hoa/event"))))))))
;;    (inputs (list 
;;              php-hoa-event-bootstrap
;;              php-hoa-consistency))
;;    (synopsis "")
;;    (description "The Hoa\\Exception library.")
;;    (home-page "https://hoa-project.net/")
;;    (license license:bsd-3)))

(define-public php-hoa-event
  (package
    (name "php-hoa-event")
    (version "2.17.08.30")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Event.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15wl1vlkja2ip1ln2cxvb847xxkwfkl4phf7gszsbhhn2kc0bi84"))))
    (build-system composer-build-system)
    (inputs (list 
              php-hoa-exception 
              php-hoa-consistency))
    
    (synopsis "")
    (description "The Hoa\\Event library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

(define-public php-hoa-event-bootstrap
  (package
    (name "php-hoa-event-bootstrap")
    (version "2.17.08.30")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Event.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "15wl1vlkja2ip1ln2cxvb847xxkwfkl4phf7gszsbhhn2kc0bi84"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("Source/" "share/web/hoa/event/Source/"))))
    (synopsis "Bootstrap source for Hoa Event")
    (description "Bootstrap copy of the Hoa Event library's source files.  This package
exists solely to break the circular dependency between Hoa Event and Hoa
Exception during bootstrapping.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

;;wrote this package definition to get around circular dependency issue between
;; hoa-event and hoa-exception.
;;(define-public php-hoa-event-bootstrap
;;  (package
;;    (inherit php-hoa-event)
;;    (name "php-hoa-event-bootstrap")
;;    (arguments
;;     (substitute-keyword-arguments (package-arguments php-hoa-event)
;;                                   ((#:tests? _ #f) #f)
;;       ((#:phases phases)
;;        `(modify-phases ,phases
;;           (add-before 'configure 'remove-circular-dependency
;;             (lambda _
;;               (let ((composer-file "composer.json"))
;;                 (substitute* composer-file
;;                   (("\"hoa/exception\"[[:space:]]*:[[:space:]]*\"[^\"]+\",?")
;;                    "")))))))))
;;    ;; The bootstrap version deliberately does not depend on
;;    ;; php-hoa-exception.
;;    (inputs
;;     (list php-hoa-consistency))))

;;wrote this package definition to get around circular dependency issue between
;; hoa-event and hoa-exception.
;;(define-public php-hoa-exception-bootstrap
;;  (package
;;    (inherit php-hoa-exception)
;;    (name "php-hoa-exception-bootstrap")
;;    (arguments
;;     (substitute-keyword-arguments (package-arguments php-hoa-exception)
;;       ;;((#:tests? _ #f) #f)
;;       ((#:phases phases)
;;        `(modify-phases ,phases
;;           (add-after 'unpack 'remove-event-dependency
;;             (lambda _
;;               (substitute* "composer.json"
;;                 (("\"hoa/event\"[[:space:]]*:[[:space:]]*\"[^\"]+\",?")
;;                  ""))))))))
;;
;;    (inputs
;;     (list php-hoa-consistency))))

(define-public php-hoa-iterator
  (package
    (name "php-hoa-iterator")
    (version "2.17.01.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Iterator.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03an8xfmrrnfi0fbypavwhm94hgzv1cjb2f5r9b5067mz6g8yin3"))))
    (build-system composer-build-system)
    (inputs (list php-hoa-exception php-hoa-consistency))
    
    (synopsis "")
    (description "The Hoa\\Iterator library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

(define-public php-hoa-stream
  (package
    (name "php-hoa-stream")
    (version "1.17.02.21")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Stream.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1g419pljx8fqs3354bf6bk1ck3s7wm7ax3mg5lsl7gi862kvi444"))))
    (build-system composer-build-system)
    (inputs (list php-hoa-protocol php-hoa-exception php-hoa-event
                  php-hoa-consistency))
    
    (synopsis "")
    (description "The Hoa\\Stream library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

(define-public php-hoa-regex
  (package
    (name "php-hoa-regex")
    (version "1.17.01.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Regex.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00vhqfvchml0w2aw1khhg4vwbfjwzx0iqcpchmc6akw12zx69h1b"))))
    (build-system composer-build-system)
    (inputs (list php-hoa-visitor
                  php-hoa-ustring
                  php-hoa-protocol
                  php-hoa-math
                  php-hoa-exception
                  php-hoa-consistency))
    (synopsis "")
    (description "The Hoa\\Regex library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

(define-public php-hoa-math
  (package
    (name "php-hoa-math")
    (version "1.17.05.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Math.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19kmz07lvqr5dkn7smxamrfcqn74kwfdajs61qczck81b7z403y8"))))
    (build-system composer-build-system)
    (inputs (list php-hoa-zformat
                  php-hoa-protocol
                  php-hoa-iterator
                  php-hoa-exception
                  php-hoa-consistency
                  ;;circular dependency
                  ;;php-hoa-compiler
                  ))
    
    (synopsis "")
    (description "The Hoa\\Math library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

(define-public php-hoa-ustring
  (package
    (name "php-hoa-ustring")
    (version "4.17.01.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Ustring.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0z71hmsj1ry3h2n2pz9w04mdhpn5z6fwkk9l2n07r6sxzrmjcpb0"))))
    (build-system composer-build-system)
    (inputs (list php-hoa-exception php-hoa-consistency))
    
    (synopsis "")
    (description "The Hoa\\Ustring library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

(define-public php-hoa-zformat
  (package
    (name "php-hoa-zformat")
    (version "1.17.01.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoaproject/Zformat.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07wi6wlcx7rxb8n7cl05qj92xmrg6awj21axrxvrz80qbw34xnpb"))))
    (build-system composer-build-system)
    (inputs (list php-hoa-exception php-hoa-consistency))
    (synopsis "")
    (description "The Hoa\\Zformat library.")
    (home-page "https://hoa-project.net/")
    (license license:bsd-3)))

(define-public php-smalot-pdfparser
  (package
    (name "php-smalot-pdfparser")
    (version "v2.12.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/smalot/pdfparser.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0k9kb7rl9kil2qs1b5bykgk52m61s5g5wp77mq3mcxk5aiqp7vf2"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-mbstring))
    (synopsis "")
    (description "Pdf parser library. Can read and extract information from pdf file.")
    (home-page "https://www.pdfparser.org")
    (license license:lgpl3+)))

(define-public php-simplepie-simplepie
  (package
    (name "php-simplepie-simplepie")
    (version "1.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/simplepie/simplepie.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05hrh8dymdijnvrx50947cijfsvnxzfp3lh46x6z4hd196j10r7x"))))
    (build-system composer-build-system)
    (synopsis "")
    (description "A simple Atom/RSS parsing library for PHP")
    (home-page "http://simplepie.org/")
    (license license:bsd-3)))

(define-public php-j0k3r-httplug-ssrf-plugin
  (package
    (name "php-j0k3r-httplug-ssrf-plugin")
    (version "3.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/j0k3r/httplug-ssrf-plugin.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00b0153ph4g6a9ng6g2rrc7z3ql81hl161h5bkzfbw66qq50x9wc"))))
    (build-system composer-build-system)
    (inputs (list php-psr-http-message php-psr-http-factory php-http-message
                  php-http-discovery php-http-client-common))
    (synopsis "")
    (description
     "Server-Side Request Forgery (SSRF) protection plugin for HTTPlug")
    (home-page "https://github.com/j0k3r/httplug-ssrf-plugin")
    (license license:expat)))

(define-public php-j0k3r-graby-site-config
  (package
    (name "php-j0k3r-graby-site-config")
    (version "1.0.215")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/j0k3r/graby-site-config.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07akhdmscf1hcsiv52vwwjs5xl60clsi6pz1m7fg508d5k097w7q"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-finder))
    
    (synopsis "")
    (description "Graby site config files")
    (home-page "")
    (license license:cc0)))

(define-public php-http-interop-http-factory-guzzle
  (package
    (name "php-http-interop-http-factory-guzzle")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/http-interop/http-factory-guzzle.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wwmjj9kgm7wffbxqhzyfz631fy12by0p2jwzhhhvyb7kjfizna7"))))
    (build-system composer-build-system)
    (inputs (list php-guzzlehttp-psr7 php-psr-http-factory))
    (synopsis "")
    (description "An HTTP Factory using Guzzle PSR7")
    (home-page "")
    (license license:expat)))

(define-public php-fossar-htmlawed
  (package
    (name "php-fossar-htmlawed")
    (version "1.3.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fossar/HTMLawed.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gqrkfdp17vysap1x63dnjb3kgm4cczd4a4qzk38m7fbi70cqanm"))))
    (build-system composer-build-system)
    
    (synopsis "")
    (description
     "htmLawed - Process text with HTML markup to make it more compliant with HTML standards and administrative policies")
    (home-page
     "http://www.bioinformatics.org/phplabware/internal_utilities/htmLawed/")
    (license (list license:gpl2+ license:lgpl3))))

(define-public php-symfony-translation
  (package
    (name "php-symfony-translation")
    (version "8.1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/translation.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0syvs4rpmbk4hx2c6kxp9m9awprj8vg93y88lmhiss7kmjz9kyl9"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-translation-contracts
                  php-symfony-polyfill-mbstring))
    (synopsis "")
    (description "Provides tools to internationalize your application")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-willdurand-negotiation
  (package
    (name "php-willdurand-negotiation")
    (version "3.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/willdurand/Negotiation.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10xj3g5b81riwxg06k931r1nln2qs0sbkddaygjmdlhc46p9nsas"))))
    (build-system composer-build-system)
    
    (synopsis "")
    (description
     "Content Negotiation tools for PHP provided as a standalone library.")
    (home-page "http://williamdurand.fr/Negotiation/")
    (license license:expat)))

(define-public php-willdurand-jsonp-callback-validator
  (package
    (name "php-willdurand-jsonp-callback-validator")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/willdurand/JsonpCallbackValidator.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0i2bmknclzi76iys5yrn658hgcxinsv4q3igv2zrd7g2jckraaaj"))))
    (build-system composer-build-system)
    
    (synopsis "")
    (description "JSONP callback validator.")
    (home-page "")
    (license license:expat)))

(define-public php-friendsofsymfony-oauth2-php
  (package
    (name "php-friendsofsymfony-oauth2-php")
    (version "1.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/FriendsOfSymfony/oauth2-php.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bcvc1pqs5wm9l59c1am5c9v2mywys7x613jbxzzvnl5idkmn3bp"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-http-foundation))
    
    (synopsis "")
    (description "OAuth2 library")
    (home-page "https://github.com/FriendsOfSymfony/oauth2-php")
    (license license:expat)))

(define-public php-symfony-serializer
  (package
    (name "php-symfony-serializer")
    (version "8.1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/symfony/serializer.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00n7jbyqwrdnibyfwfgihz1jfckmna4zahcxk741xzzk2d05b2xy"))))
    (build-system composer-build-system)
    (inputs (list php-symfony-polyfill-ctype php-symfony-deprecation-contracts))
    (synopsis "")
    (description
     "Handles serializing and deserializing data structures, including object graphs, into array structures or other formats like XML and JSON.")
    (home-page "https://symfony.com")
    (license license:expat)))

(define-public php-doctrine-sql-formatter
  (package
    (name "php-doctrine-sql-formatter")
    (version "1.5.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/doctrine/sql-formatter.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0cykgrwqq9dgb542izlyr1m0i9y081plk1ld7wii1z4rzsyzlngi"))))
    (build-system composer-build-system)
    (arguments
     (list
      #:tests? #f))
    (synopsis "")
    (description "a PHP SQL highlighting library")
    (home-page "https://github.com/doctrine/sql-formatter/")
    (license license:expat)))

(define-public php-paragonie-random-compat
  (package
    (name "php-paragonie-random-compat")
    (version "9.99.100")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/paragonie/random_compat.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "140s9kx5h6njm2qcf210kscb5vnw03hwd7hijamjka27yb2kqlwz"))))
    (build-system composer-build-system)
    
    (synopsis "")
    (description
     "PHP 5.x polyfill for random_bytes() and random_int() from PHP 7")
    (home-page "")
    (license license:expat)))

;;php-hoa-event-bootstrap
php-hoa-exception
