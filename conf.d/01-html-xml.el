;;; html mode
(add-to-list 'auto-mode-alist '("\\.\\(tt\\|s?html?\\(\\.[a-zA-Z_]+\\)?\\)\\'" . html-mode))

;;; nXML mode

;; Already in Emacs 23
;;(add-site-load-path "nxml-mode")
;;(load "rng-auto")

(add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode))
