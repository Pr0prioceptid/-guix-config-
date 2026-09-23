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

