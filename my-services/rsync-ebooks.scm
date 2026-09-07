(define-module (rsync-ebooks)
#:use-module (gnu)
#:use-module (guix gexp)
#:use-module (gnu services shepherd)
#:use-module (gnu packages rsync))

(define (synchro source destination)
 #~(#$(file-append rsync "/bin/rsync")
  "-a"
  "--delete"
  "--include=*/"
  "--include=*.pdf"
  "--include=*.epub"
  "--include=*.mobi"
  "--exclude=*"
  source
  destination))

(define-public rsync-ebooks-transmission
 (shepherd-timer '(rsync-ebooks-transmission) "0 7 * * *"
  (synchro "/var/lib/transmission-daemon/downloads" "/srv/ftp/transmission/")
  ;;Not sure whether to make transmission a requirement, but this probably prevents unforeseen behaviour, so wilco"
  #:requirement '(file-systems vsftpd transmission-daemon)))

(define-public rsync-ebooks-xd
 (shepherd-timer '(rsync-ebooks-xd) "0 7 * * *"
  (synchro "/var/lib/xd/storage/downloads" "/srv/ftp/xd/")
  #:requirement '(file-systems vsftpd xd)))

(define-public rsync-ebooks
 (shepherd-timer '(rsync-ebooks) "0 7 * * *"
  #~(begin
   (define (synchro-sep source destination)
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
   (synchro-sep "/var/lib/transmission-daemon/downloads/"
    "/srv/ftp/transmission/")
   (synchro "var/lib/xd/storage/downloads" 
    "/srv/ftp/xd")
   ;;I could leave this on just file-systems, but I don't want the situation of this service trying to function when some service has not created the relevant parent folder.
  #:requirement '(file-systems vsftpd xd transmission-daemon)))
