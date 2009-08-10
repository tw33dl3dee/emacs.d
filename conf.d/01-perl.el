;; Perl tweaks

;; add given/when/default keywords
(add-hook 'perl-mode-hook
	  (lambda ()
	    (font-lock-add-keywords nil
				    '(("\\<\\(given\\|when\\|default\\)\\>" 0 font-lock-keyword-face))
				    t)))
