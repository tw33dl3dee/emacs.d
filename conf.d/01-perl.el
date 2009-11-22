;; Perl tweaks

;; we use CPerl mode -- it's much more kawai than default Perl mode
(defalias 'perl-mode 'cperl-mode)

;; add given/when/default keywords
(add-hook 'cperl-mode-hook
	  (lambda ()
	    (font-lock-add-keywords nil
				    '(("\\<\\(given\\|when\\|default\\)\\>" 0 font-lock-keyword-face))
				    t)))

(require 'ffap-perl-module)

(defun ffap-perl-module ()
  (interactive)
  (find-file (ffap-perl-module-file-at-point)))
