;;; Main Emacs config

;;; Init load paths
(setq emacs-user-root      "~/.emacs.d/")
(setq emacs-user-lisp-root "~/.emacs.d/site-lisp")

(add-to-list 'load-path emacs-user-root)
(add-to-list 'load-path emacs-user-lisp-root)

(defun add-site-load-path (path)
  "Add local site PATH to `load-path'."
  (add-to-list 'load-path (concat emacs-user-lisp-root "/" path)))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(defun load-files-in-dir (path regexp)
  "Load all files matching REGEXP from directory PATH."
  (mapc #'(lambda (fname) 
	    (if (string-match regexp fname)
		(load-file (concat path "/" fname))))
	(directory-files path)))

(defun load-file-silently (path &optional fallback)
  "Try loading file PATH and execute FALLBACK on failure."
  (if (file-readable-p path) (load-file path)
    (if fallback (funcall fallback))))

;; First try to load configuration from cached conf.el
;; Fallback to reading conf.d/*.el
(load-file-silently "~/.emacs.d/conf.el" 
		    (lambda () 
		      (load-files-in-dir "~/.emacs.d/conf.d" "^\\(.+\\)\.el$")))

;;; Load site-local configuration, if any
(load-file-silently "~/.emacs.d/local.el")
