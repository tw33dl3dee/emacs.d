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

(load-files-in-dir "~/.emacs.d/conf.d" "^\\(.+\\)\.el$")

;;; Load site-local configuration, if any
(defun load-file-silently (path)
  (if (file-readable-p path) (load-file path)))

(load-file-silently "~/.emacs.d/local.el")
