(define-module (my-packages xd)
  ;; gnu packages
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages golang)
  ;;pkg-sftp
  #:use-module (gnu packages golang-crypto)
  ;;zeebo-bencode
  ;;leonelquinteros-gotext
  #:use-module (gnu packages golang-xyz)
  ;;org-x-crypto
  #:use-module (gnu packages golang-build)
  ;;for gexp patches in arguments
  #:use-module (guix gexp)
  #:use-module (gnu packages perl))

;;below has been imported by guix import go github.com/majestrate/xd
(define-public go-github-com-majestrate-xd
  (package
    (name "go-github-com-majestrate-xd")
    (version "0.4.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/majestrate/XD")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "146ik8lzll8irmf500zc2gwyyxjlmgsq0fvajk7xyxjy0l3s9a9w"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/majestrate/XD" 
      ;;this test-flag modification avoids a bug which happens due to the go version being too new
      #:test-flags
      #~(list "-vet=off")
      ;;xd uses a package in the guix repo (gotext), but uses a different name, so we just force replace all the mentions of it.
      #:phases 
      #~(modify-phases %standard-phases 
      (add-after 'unpack 'rewrite-gotext-import
      (lambda _
      (substitute* (find-files "." "\\.go$")
      (("gopkg\\.in/leonelquinteros/gotext\\.v1")
      "github.com/leonelquinteros/gotext")))))))
    ;;perl is necessary here for sha256sum package
    (native-inputs (list perl))
    (propagated-inputs (list go-github-com-pkg-sftp
                             go-github-com-zeebo-bencode
                             go-golang-org-x-crypto
                             go-github-com-leonelquinteros-gotext))
    (home-page "https://github.com/majestrate/xd")
    (synopsis "XD")
    (description "I2P @code{BitTorrent} Client written in GO.")
    ;;according to code in repo, mit license is actually expat? whatever
    (license license:expat)))

;;go-github-com-majestrate-xd
