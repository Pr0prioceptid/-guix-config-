(define-module (my-services syncthing)
  #:use-module (gnu services)
  #:use-module (gnu services syncthing))

;; to encrypt, replace one of the listed devices under the folders with '(syncthing-folder-device (device ...) (encryption-password "..."))'
(define-public my-syncthing-service 
               (service syncthing-service-type 
                        (let ((x555la 
                                (syncthing-device 
                                  (name "X555LA") 
                                  (id "LOMLF7X-6YSPVBH-CPV6UIX-2ANGAFZ-TYTX3EX-RAOHD3Z-XWZ34B2-P2OXOQ5"))) 
                              (hcpc 
                                (syncthing-device 
                                  (name "HCPC") 
                                  (id "SFNZ3J4-6DQIAEO-UZXKKYS-BKXEHSC-FUXBMRB-RM3XHKU-PAFZ5EJ-QEM4SAN")))
                              (pixel6 
                                (syncthing-device 
                                  (name "Pixel 6") 
                                  (id "NT3X345-7HZSCJZ-NFH72PS-UXRKPXX-V76C5CY-WCY6R2W-ZUBGXSY-LBKTIQ7")))
                              (lockdown 
                                (syncthing-device 
                                  (name "lockdown") 
                                  (id "SN3DOKQ-XXISMMV-HCBTJ7H-RE5RFIZ-VMD6CZW-MAVXGPT-EYNXXM7-TJB76AT")))) 
                          (syncthing-configuration 
                            (user "user") 
                            (config-file 
                              (syncthing-config-file 
                                (folders 
                                  (list (syncthing-folder 
                                          (label "phone") 
                                          (id "5yk88-0mqnw") 
                                          (path "~/phone") 
                                          (devices (list pixel6 hcpc x555la lockdown))) 
                                        (syncthing-folder 
                                          (label "main") 
                                          (id "default") 
                                          (path "~/Sync") 
                                          (devices (list pixel6 x555la lockdown hcpc))) 
                                        (syncthing-folder 
                                          (label "notebook") 
                                          (id "taxja-fpukx") 
                                          (path "~/Documents/notebooks") 
                                          (devices (list x555la hcpc lockdown))) 
                                        (syncthing-folder 
                                          (label "garbage") 
                                          (id "aqpzj-wgrdt") 
                                          (path "~/.GARBAGE") 
                                          (devices (list pixel6)))))))))))
