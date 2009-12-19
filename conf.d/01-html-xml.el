;;; html mode
(add-to-list 'auto-mode-alist '("\\.\\(tt\\|s?html?\\(\\.[a-zA-Z_]+\\)?\\)\\'" . html-mode))

;;; nXML mode

;; Already in Emacs 23
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/nxml-mode")
;;(load "rng-auto")

(add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode))
