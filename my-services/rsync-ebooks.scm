(define-module (rsync-ebooks)
#:use-module (gnu)
#:use-module (guix gexp)
#:use-module (gnu services shepherd)
#:use-module (gnu packages rsync))

(define-public rsync-ebooks-service
	       (simple-service
		 'rsync-ebooks
		 shepherd-root-service-type
		 (shepherd-timer '(rsync-ebooks) 
				 "0 7 * * *" 
				 #~(begin (define (synchro source destination) 
					    (system* #$(file-append rsync "/bin/rsync") 
						     "-a" 
						     "--delete" 
						     "--include=*/" 
						     "--include=*.pdf" 
						     "--include=*.epub" 
						     "--include=*.mobi" 
						     "--exclude=*" 
						     source 
						     destination)) 
					  (synchro "/var/lib/transmission-daemon/downloads/" 
						   "/srv/ftp/transmission/") 
					  (synchro "var/lib/xd/storage/downloads" 
						   "/srv/ftp/xd") 
					  ;;I could leave this on just file-systems, but I don't want the situation of this service trying to function when some service has not created the relevant parent folder.  
					  #:requirement '(file-systems vsftpd xd transmission-daemon)))))
