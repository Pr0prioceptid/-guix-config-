(define-module (my-packages myanonamouse)
   ;gnu packages
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix licenses)
  #:use-module (gnu packages bittorrent))

(define-public libtorrent-mam
  (package
    (inherit libtorrent)
    (name "libtorrent-mam")
    (version "0.13.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rakshasa/libtorrent/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1h5y6ab3gs20yyprdfwcw8fh1c6czs4yrdj0kf54d2vp9qwz685r"))))))

(define-public rtorrent-mam
  (package
    (inherit rtorrent)
    (name "rtorrent-mam")
    (version "0.9.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rakshasa/rtorrent/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0hcaf1brk402caa7hhlb2r1c93mjzxkm8gb19xfl33gkp3jpf372"))))
    (inputs (modify-inputs (package-inputs rtorrent)
              (replace "libtorrent" libtorrent-mam)))))
