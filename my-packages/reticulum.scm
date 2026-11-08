(define-module (my-packages reticulum)
               #:use-module (guix packages)
               #:use-module (guix download)
               #:use-module (gnu packages python)
               #:use-module (guix build-system pyproject)
               #:use-module (gnu packages python-crypto)
               #:use-module (gnu packages python-xyz)
               #:use-module (gnu packages python-build)
               #:use-module (guix build utils)
               #:use-module (guix gexp))

(define-public 
  python-rns
  (package
    (name "python-rns")
    (version "1.6.0")
    (source
      (origin
        (method url-fetch)
        (uri ((@ (guix build-system pyproject) pypi-uri) "rns" version))
        (sha256
          (base32 "0kaydrd31whylmawalnlnfyqk3mx1xsd1inah5fqj36dv98db6da"))))
    (build-system pyproject-build-system)
    (arguments
      (list
        #:tests? #f
        #:phases
        #~(modify-phases %standard-phases
                         (delete 'sanity-check))))
    (propagated-inputs (list python-cryptography python-pyserial))
    (native-inputs (list python-setuptools))
    (home-page "https://reticulum.network/")
    (synopsis
      "Self-configuring, encrypted and resilient mesh networking stack for LoRa, packet radio, WiFi and everything in between")
    (description
      "Self-configuring, encrypted and resilient mesh networking stack for @code{LoRa},
      packet radio, @code{WiFi} and everything in between.")
      (license #f)))

python-rns
