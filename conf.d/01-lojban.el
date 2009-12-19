;; Lojban support

(add-to-list 'load-path "~/.emacs.d/site-lisp/lojban")
(autoload 'lojban-parse-region "lojban" "Parse the region as lojban text." t)
(autoload 'lojban-describe-valsi "lojban" "Qualify VALSI and returns its description" t)
(autoload 'lojban-mode "lojban-mode" "Lojban language mode." t)

(add-to-list 'auto-mode-alist '("\\.jbo$" . lojban-mode))

(add-hook 'lojban-mode-hook
	  '(lambda ()
	     (local-set-key [C-down] 'lojban-paragraph-forward)
	     (local-set-key [C-up] 'lojban-paragraph-backward)
	     (local-set-key (kbd "C-;") 'lojban-gloss-word)
	     (local-set-key (kbd "C-'") 'lojban-parse-sentence)
	     (local-set-key (kbd "C-M-;") 'lojban-gloss-region)
	     (local-set-key (kbd "C-M-'") 'lojban-parse-region)
	     (local-set-key (kbd "C-,") 'lojban-describe-valsi)
	     (local-set-key (kbd "C-.") 'lojban-describe-valsi-at-point)))
