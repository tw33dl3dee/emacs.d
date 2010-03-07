;;; Main Emacs config

;;; Init load paths
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;;; Load configuration from conf.d/*.el
(defun load-files-in-dir (path regexp)
  (mapc #'(lambda (fname) 
	    (if (string-match regexp fname)
		(load-file (concat path "/" fname))))
	(directory-files path)))

(defun load-file-silently (path &optional fallback)
  (if (file-readable-p path) (load-file path)
    (if fallback (funcall fallback))))

;; First try to load configuration from cached conf.el
;; Fallback to raeding conf.d
(load-file-silently "~/.emacs.d/conf.el" 
		    (lambda () 
		      (load-files-in-dir "~/.emacs.d/conf.d" "^\\(.+\\)\.el$")))

;;; Load site-local configuration, if any
(load-file-silently "~/.emacs.d/local.el")
