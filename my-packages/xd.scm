(define-module (my-packages xd)
  ;; gnu packages
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix licenses)
  #:use-module (gnu packages golang))

(define-public xd
  (package
    (name "xd")
    (version "0.4.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/majestrate/XD")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "PLACEHOLDER"))))
    (inputs go)
    (build-system gnu-build-system)
    ;; (arguments
    ;; (list
    ;; #:import-path "github.com/magestrate/XD"))
    (home-page "https://xd-torrent.github.io/")
    (synopsis "I2P-only BitTorrent client written in GO (as a joke)")
    (description
     "XD is a secure Bittorrent client which works with i2pd and java i2p using the SAM api")
    (licence "mit")))

