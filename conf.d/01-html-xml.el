;;; html mode
(add-to-list 'auto-mode-alist '("\\.\\(tt\\|s?html?\\(\\.[a-zA-Z_]+\\)?\\)\\'" . html-mode))

;;; nXML mode
(add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode))

;;;; html5
(add-site-load-path "html5")

(eval-after-load "rng-loc"
  '(add-to-list 'rng-schema-locating-files (concat emacs-user-lisp-root "/html5/schemas.xml")))
