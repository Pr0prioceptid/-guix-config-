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

