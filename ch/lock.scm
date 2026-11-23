(list (channel
       (name 'rosenthal)
       (url "https://codeberg.org/hako/rosenthal.git")
       (branch "trunk")
       (commit "a6736d8030c9a14bbd0d1a66839828e66c7058d5")
       (introduction
        (make-channel-introduction
         "7677db76330121a901604dfbad19077893865f35"
         (openpgp-fingerprint
          "13E7 6CD6 E649 C28C 3385  4DF5 5E5A A665 6149 17F7"))))
      (channel
       (name 'nonguix)
       (url "https://gitlab.com/nonguix/nonguix")
       (branch "master")
       (commit "ee118ce90d55c9d80af11295f28d6f971369161c")
       (introduction
        (make-channel-introduction
         "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
         (openpgp-fingerprint
          "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
      (channel
       (name 'guix)
       (url "https://git.guix.gnu.org/guix.git")
       (branch "master")
       (commit "b5a4d619c848bd00cbeec9d27d045112636881aa")
       (introduction
        (make-channel-introduction
         "9edb3f66fd807b096b48283debdcddccfea34bad"
         (openpgp-fingerprint
          "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA")))))
