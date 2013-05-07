;;; CPerl mode override

;; Use CPerl mode -- it's much more kawai than default Perl mode
(defalias 'perl-mode 'cperl-mode)

;; Perl 5.10 keywords
(add-hook 'cperl-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil '(("\\<\\(given\\|when\\|default\\)\\>" 0 font-lock-keyword-face)) t)))
