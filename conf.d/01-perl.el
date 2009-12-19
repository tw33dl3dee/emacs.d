;;; Perl tweaks

;; we use CPerl mode -- it's much more kawai than default Perl mode
(defalias 'perl-mode 'cperl-mode)

;; add given/when/default keywords
(add-hook 'cperl-mode-hook
	  (lambda ()
	    (font-lock-add-keywords nil
				    '(("\\<\\(given\\|when\\|default\\)\\>" 0 font-lock-keyword-face))
				    t)))

;; FFAP extension to open module at point

(mapcar (lambda (mode)
	  (add-hook mode (lambda () (require 'ffap-perl-module))))
	'(perl-mode-hook cperl-mode-hook))

(autoload 'ffap-perl-module-file-at-point "ffap-perl-module" "Find the filename for a perl module at point." t)

(defun ffap-perl-module ()
  (interactive)
  (find-file (ffap-perl-module-file-at-point)))
