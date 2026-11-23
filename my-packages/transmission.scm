(define-module (my-packages transmission)
               #:use-module (guix packages) 
               #:use-module (gnu packages bittorrent)
               #:use-module (guix git-download)
               #:use-module (guix gexp)
               )

(define-public transmission-4.1.3
               (package
                 (inherit transmission)
                 (version "4.1.3")
                 (source (origin
                           (method git-fetch)
                           (uri (git-reference
                                  (url "https://github.com/transmission/transmission")
                                  (commit version)
                                  ;; TODO: Unbundle more available inputs, see:
                                  ;; <https://codeberg.org/guix/guix/pulls/6542#issuecomment-10935599>.
                                  (recursive? #t)))
                           (file-name (git-file-name "transmission" version))
                           (sha256
                             (base32
                               "0h90lpmhj30xj5fbmhxrsnw2rd3cph3ls1rcwhr4vmpyrs0kszp3"))
                           (modules '((guix build utils)))
                           (snippet
                             #~(begin
                                 (for-each
                                   (lambda (x)
                                     (delete-file-recursively (string-append "third-party/" x)))
                                   '("fast_float"
                                     "fmt"
                                     "libdeflate"
                                     "libevent"
                                     "libnatpmp"
                                     "libpsl"
                                     "miniupnp"))
                                 (for-each
                                   (lambda (x)
                                     (delete-file (string-append "cmake/" x)))
                                   '("FindFmt.cmake" "FindFastFloat.cmake"))))))))

;;transmission-4.1.3
