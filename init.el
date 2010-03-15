;;; Main Emacs config

;;; Init load paths
(load-file "~/.emacs.d/base.el")

;; Redefined in base.el
(load-file-silently generated-autoload-file
		    (lambda ()
		      (error "You need to run `make' in %s (%s is missing)" 
			     emacs-user-root generated-autoload-file)))

(setq custom-file (user-path "custom.el"))
(load custom-file 'noerror)

;; First try to load configuration from cached conf.el
;; Fallback to reading conf.d/*.el
(load-file-silently (user-path "conf.el")
		    (lambda () 
		      (load-files-in-dir (user-path "conf.d") "^\\(.+\\)\.el$")))

;;; Load site-local configuration, if any
(load-file-silently "~/.emacs.d/local.el")
