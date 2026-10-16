(list (channel
        (name 'tailscale)
        (url "https://github.com/umanwizard/guix-tailscale")
        (branch "main")
        (commit "eac06962d453e6ea9bd59ed1eee18ee77ab104ca")
        (introduction
          (make-channel-introduction
            "52e82318f282c555757ef077d93a685fda97565d"
            (openpgp-fingerprint
              "9E53FC33B8328C745E7B31F70226C10D7877B741"))))
      (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        (branch "master")
        (commit "3b66965566fe8c96edb5a41fd39a9e5a90ad9b61")
        (introduction
          (make-channel-introduction
            "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
            (openpgp-fingerprint
              "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
      (channel
        (name 'guix)
        (url "https://git.guix.gnu.org/guix.git")
        (branch "master")
        (commit "80a668385d08c688ef1ff9841a5bafd5d4bc2b10")
        (introduction
          (make-channel-introduction
            "9edb3f66fd807b096b48283debdcddccfea34bad"
            (openpgp-fingerprint
              "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA")))))
