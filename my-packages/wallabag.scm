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
    (inputs (list php-babdev-pagerfanta-bundle
                  php-bdunogier-guzzle-site-authenticator
                  php-craue-config-bundle
                  php-defuse-php-encryption
                  php-doctrine-collections
                  php-doctrine-common
                  php-doctrine-dbal
                  php-doctrine-doctrine-bundle
                  php-doctrine-doctrine-migrations-bundle
                  php-doctrine-event-manager
                  php-doctrine-migrations
                  php-doctrine-orm
                  php-doctrine-persistence
                  php-egulias-email-validator
                  php-enshrined-svg-sanitize
                  php-friendsofsymfony-jsrouting-bundle
                  php-friendsofsymfony-oauth-server-bundle
                  php-friendsofsymfony-rest-bundle
                  php-friendsofsymfony-user-bundle
                  php-guzzlehttp-guzzle
                  php-guzzlehttp-psr7
                  php-html2text-html2text
                  php-incenteev-composer-parameter-handler
                  php-j0k3r-graby
                  php-j0k3r-php-readability
                  php-javibravo-simpleue
                  php-jms-serializer
                  php-jms-serializer-bundle
                  php-kphoen-rulerz
                  php-kphoen-rulerz-bundle
                  php-laminas-laminas-code
                  php-lcobucci-jwt
                  php-lexik-form-filter-bundle
                  php-mgargano-simplehtmldom
                  php-mnapoli-piwik-twig-extension
                  php-nelmio-api-doc-bundle
                  php-nelmio-cors-bundle
                  php-ocramius-proxy-manager
                  php-pagerfanta-doctrine-orm-adapter
                  php-pagerfanta-twig
                  php-amqplib-php-amqplib
                  php-amqplib-rabbitmq-bundle
                  php-http-client-common
                  php-http-discovery
                  php-http-guzzle5-adapter
                  php-http-httplug
                  php-http-httplug-bundle
                  php-http-message
                  php-http-message-factory
                  php-pragmarx-recovery
                  php-predis-predis
                  php-psr-http-message
                  php-psr-log
                  php-scheb-2fa-backup-code
                  php-scheb-2fa-bundle
                  php-scheb-2fa-email
                  php-scheb-2fa-google-authenticator
                  php-scheb-2fa-qr-code
                  php-scheb-2fa-trusted-device
                  php-sensio-framework-extra-bundle
                  php-sentry-sentry-symfony
                  php-stof-doctrine-extensions-bundle
                  php-symfony-asset
                  php-symfony-config
                  php-symfony-console
                  php-symfony-debug
                  php-symfony-dependency-injection
                  php-symfony-doctrine-bridge
                  php-symfony-dom-crawler
                  php-symfony-error-handler
                  php-symfony-event-dispatcher
                  php-symfony-finder
                  php-symfony-form
                  php-symfony-framework-bundle
                  php-symfony-google-mailer
                  php-symfony-http-foundation
                  php-symfony-http-kernel
                  php-symfony-mailer
                  php-symfony-mime
                  php-symfony-monolog-bundle
                  php-symfony-options-resolver
                  php-symfony-proxy-manager-bridge
                  php-symfony-routing
                  php-symfony-security-bundle
                  php-symfony-security-core
                  php-symfony-security-http
                  php-symfony-templating
                  php-symfony-twig-bundle
                  php-symfony-validator
                  php-tecnickcom-tcpdf
                  php-twig-extra-bundle
                  php-twig-string-extra
                  php-twig-twig
                  php-wallabag-php-mobi
                  php-wallabag-phpepub
                  php-willdurand-hateoas
                  php-willdurand-hateoas-bundle))
    (native-inputs (list php-dama-doctrine-test-bundle
                         php-doctrine-doctrine-fixtures-bundle
                         php-ergebnis-composer-normalize
                         php-friendsofphp-php-cs-fixer
                         php-friendsoftwig-twigcs
                         php-m6web-redis-mock
                         php-http-mock-client
                         php-phpstan-extension-installer
                         php-phpstan-phpstan
                         php-phpstan-phpstan-doctrine
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan-symfony
                         php-symfony-browser-kit
                         php-symfony-css-selector
                         php-symfony-debug-bundle
                         php-symfony-maker-bundle
                         php-symfony-phpunit-bridge
                         php-symfony-var-dumper
                         php-symfony-web-profiler-bundle
                         php-symfony-web-server-bundle))
    (synopsis "")
    (description "open source self hostable read-it-later web application")
    (home-page "https://github.com/wallabag/wallabag")
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
    (inputs (list php-pagerfanta-core
                  php-psr-container
                  php-symfony-config
                  php-symfony-dependency-injection
                  php-symfony-http-foundation
                  php-symfony-http-kernel
                  php-symfony-property-access
                  php-symfony-routing))
    (native-inputs (list php-jms-serializer
                         php-jms-serializer-bundle
                         php-matthiasnoback-symfony-dependency-injection-test
                         php-pagerfanta-twig
                         php-phpstan-extension-installer
                         php-phpstan-phpstan
                         php-phpstan-phpstan-phpunit
                         php-phpstan-phpstan-symfony
                         php-phpunit-phpunit
                         php-symfony-serializer
                         php-symfony-twig-bridge
                         php-symfony-twig-bundle
                         php-symfony-translation
                         php-twig-twig))
    (synopsis "")
    (description "Bundle integrating Pagerfanta with Symfony")
    (home-page "")
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
    (inputs (list php-guzzlehttp-guzzle
                  php-psr-log
                  php-symfony-config
                  php-symfony-dependency-injection
                  php-symfony-expression-language
                  php-symfony-http-kernel))
    (native-inputs (list php-friendsofphp-php-cs-fixer php-monolog-monolog
                         php-nyholm-symfony-bundle-test
                         php-symfony-phpunit-bridge))
    (synopsis "")
    (description
     "A guzzle plugin that adds, if necessary, authentication data to requests. Uses credentials and cookies, with login requests to the sites.")
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
    (inputs (list php-doctrine-doctrine-bundle
                  php-psr-cache
                  php-symfony-cache
                  php-symfony-config
                  php-symfony-dependency-injection
                  php-symfony-form
                  php-symfony-framework-bundle
                  php-symfony-http-foundation
                  php-symfony-http-kernel
                  php-symfony-options-resolver
                  php-symfony-validator))
    (native-inputs (list php-composer-semver
                         php-craue-translations-tests
                         php-doctrine-orm
                         php-phpstan-extension-installer
                         php-phpstan-phpstan
                         php-phpstan-phpstan-deprecation-rules
                         php-phpstan-phpstan-strict-rules
                         php-phpstan-phpstan-symfony
                         php-phpunit-phpunit
                         php-symfony-asset
                         php-symfony-browser-kit
                         php-symfony-phpunit-bridge
                         php-symfony-property-info
                         php-symfony-twig-bundle
                         php-symfony-web-profiler-bundle))
    (synopsis "")
    (description
     "Database-stored settings made available via a service for your Symfony project.")
    (home-page "https://github.com/craue/CraueConfigBundle")
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
    (native-inputs (list php-yoast-phpunit-polyfills php-phpunit-phpunit))
    (synopsis "")
    (description "Secure PHP Encryption Library")
    (home-page "")
    (license license:expat)))

