(define-public i2psnark-standalone
  (package
    (name "i2psnark-standalone")
    (version "0.9.70+")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/I2PPlus/i2pplus")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ant-build-system)
    (arguments
     (list
      #:tests? #f
      #:build-target "i2psnark_nozip"
      ;;#:phases
      ;;#~(modify-phases %standard-phases
      ;;    
      ;;    ;; Upstream's "i2psnark_nozip" target assembles the
      ;;    ;; standalone distribution in
      ;;    ;; apps/i2psnark/java/standalone/.
      ;;    (replace 'install
      ;;      (lambda* (#:key outputs #:allow-other-keys)
      ;;        (use-modules (guix build utils))

      ;;        (let* ((out (assoc-ref outputs "out"))
      ;;               (share (string-append out "/share/i2psnark"))
      ;;               (bin (string-append out "/bin")))
      ;;          
      ;;          ;; Install the assembled runtime tree.
      ;;          (copy-recursively "apps/i2psnark/java/standalone" share)

      ;;          ;; Install a launcher.
      ;;          (mkdir-p bin)
      ;;          (call-with-output-file (string-append bin "/i2psnark")
      ;;            (lambda (port)
      ;;              (format port "#!~a/bin/sh~%"
      ;;                      (which "sh"))
      ;;              (format port "cd ~s~%" share)
      ;;              (format port
      ;;               "exec java ${JAVA_OPTS:+$JAVA_OPTS} -jar i2psnark.jar \"$@\"~%")))

      ;;          (chmod (string-append bin "/i2psnark") #o555)))))
		))
    (native-inputs (list ant zip))
    (inputs (list openjdk17))
    (home-page "https://github.com/I2PPlus/i2pplus")
    (synopsis "Standalone I2P-only BitTorrent client")
    (description
     "I2PSnark Standalone is a BitTorrent client for the I2P anonymous network, distributed independently of the full java I2P router.")
    (license license:gpl2)))
