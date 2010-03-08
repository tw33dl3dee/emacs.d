;;; Main Emacs config

;;; Init load paths
(load-file "base.el")

(add-to-list 'load-path emacs-user-root)
(add-to-list 'load-path emacs-user-lisp-root)

(setq custom-file (user-path "custom.el"))
(load custom-file 'noerror)

;; Redefined in base.el
(load-file-silently generated-autoload-file
		    (lambda ()
		      (error "You need to run `make' in %s (%s is missing)" 
			     emacs-user-root generated-autoload-file)))

;; First try to load configuration from cached conf.el
;; Fallback to reading conf.d/*.el
(load-file-silently (user-path "conf.el")
		    (lambda () 
		      (load-files-in-dir (user-path "conf.d") "^\\(.+\\)\.el$")))

;;; Load site-local configuration, if any
(load-file-silently "~/.emacs.d/local.el")
