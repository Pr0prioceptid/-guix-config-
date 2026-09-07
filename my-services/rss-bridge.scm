(define-module (my-services rss-bridge)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (guix gexp)
  #:use-module (gnu packages web))

(define-public my-rss-bridge-service
  (service (service-type (name 'rss-bridge)
                         (extensions (list (service-extension nginx-service-type
			  (const (list (nginx-server-configuration
			   (listen '("80"))
			   (server-name '("rss.bridge"))
                           (locations
                            (list (nginx-location-configuration
                                   (uri "/static/")
                                   (body (string-append
                                     "alias " (file-append rss-bridge "/share/rss-bridge/static/") ";\n")))
			            (nginx-location-configuration
			             (uri "= /")
			             (body
			              (string-append
         			      	 "root " (file-append rss-bridge "/share/rss-bridge") ";\n"
         			      	 "include share/nginx/conf/fastcgi.conf;\n"
					 "fastcgi_read_timeout 45s;\n"
					 "fastcgi_pass unix:/run/php/rss-bridge.sock;\n")))))))))))
                         (default-value #f)
                         (description "Run rss-bridge"))))
