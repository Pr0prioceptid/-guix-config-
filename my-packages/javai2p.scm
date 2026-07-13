(define-module (my-packages javai2p)
   ;gnu packages
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system ant)
  #:use-module (guix licenses)
  #:use-module (gnu packages gettext)
#:use-module (gnu packages java))

(define-public i2p
(package
(name "i2p")
(version "2.5.0")
(source
(origin
(method git-fetch) 
       (uri (git-reference
             (url "https://github.com/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1h5y6ab3gs20yyprdfwcw8fh1c6czs4yrdj0kf54d2vp9qwz685r"))))
(build-system ant-build-system)
(inputs openjdk)
(synopsis "A fully encrypted, peer-to-peer overlay network designed for anonymous communication.")
(description "I2P (Invisible Internet Project) is a decentralized, privacy-focused network that allows people to communicate and share information anonymously. It works by routing data through multiple encrypted layers across volunteer-operated nodes, hiding both the sender's and receiver's locations. The result is a secure, censorship-resistant network designed for private websites, messaging, and data sharing.")
(home-page "https://i2p.net/en/")
(license "gpl2+")))
