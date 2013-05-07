;;; HTML mode
;;(add-to-list 'auto-mode-alist '("\\.\\(tt\\|s?html?\\(\\.[a-zA-Z_]+\\)?\\)\\'" . html-mode))

;;; nXML mode
(add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode))

;;;; Html5 "schema"
(eval-after-load "rng-loc"
  '(add-to-list 'rng-schema-locating-files (concat emacs-user-lisp-root "/html5/schemas.xml")))
