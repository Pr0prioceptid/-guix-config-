(define-module (my-services rsync-ebooks)
#:use-module (gnu)
#:use-module (gnu services)
#:use-module (guix gexp)
#:use-module (gnu services shepherd)
#:use-module (gnu packages rsync))

(define rsync-ebooks-program
  (program-file
    "rsync-ebooks" 
    #~(begin (define (synchro source destination) 
	       ;;consider using 'invoke' rather than 'system*': should be a simple replacement
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
	     (synchro "/var/lib/xd/storage/seeding/" 
		      "/srv/ftp/xd/")))) 

(define-public my-rsync-ebooks-timer
	       (simple-service
		 'rsync-ebooks
		 shepherd-root-service-type
		 (list (shepherd-timer '(rsync-ebooks) 
				       "0 7 * * *" 
				       #~(#$rsync-ebooks-program) 
				       ;;I could leave this on just file-systems, but I don't want the situation of this service trying to function when some service has not created the relevant parent folder.  
				       #:requirement '(file-systems vsftpd xd transmission-daemon)))))
