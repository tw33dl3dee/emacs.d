;;; nXML mode
(add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode))

(require 'web-autoload)
(require 'nxhtml-base)
(load "nxhtml-loaddefs")

;;;; Html5 "schema"
(eval-after-load "rng-loc"
  '(add-to-list 'rng-schema-locating-files (concat emacs-user-lisp-root "/html5/schemas.xml")))

;; Prevent ElScreen header from disappearing in MuMaMo
(eval-after-load "mumamo"
  (add-hook 'mumamo-after-change-major-mode-hook 'elscreen-run-screen-update-hook))
