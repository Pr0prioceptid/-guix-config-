(define-module (my-packages wallabag)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system composer)
  #:use-module ((guix licenses) #:prefix license:))

(define-public wallabag
  (package
    (name "wallabag")
    (version "2.6.14")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wallabag/wallabag")
             (commit (string-append version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "146ik8lzll8irmf500zc2gwyyxjlmgsq0fvajk7xyxjy0l3s9a9w"))))
    (build-system composer-build-system)
    (synopsis "Self-hostable read-it-later application")
    (description
     "wallabag is a self-hostable application for saving web pages, classifying them, and reading them later.")
    (home-page "https://wallabag.org")
    (license license:expat)))
