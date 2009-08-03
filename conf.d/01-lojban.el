;; Lojban support

(add-to-list 'load-path "~/.emacs.d/site-lisp/lojban")
(autoload 'lojban-parse-region "lojban" nil t)
(autoload 'lojban-mode "lojban-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.jbo$" . lojban-mode))

(add-hook 'lojban-mode-hook
		  '(lambda ()
			 (local-set-key [C-down] "\C-c}")
			 (local-set-key [C-up] "\C-c{")
			 ;; C-;
			 (local-set-key [67108923] 'lojban-gloss-word)
			 ;; C-'
			 (local-set-key [67108903] 'lojban-parse-sentence)
			 ;; C-M-;
			 (local-set-key [201326651] 'lojban-gloss-region)
			 ;; C-M-'
			 (local-set-key [201326631] 'lojban-parse-region)
			 ;; C-,
			 (local-set-key [67108908] 'lojban-describe-gismu)
			 ;; C-.
			 (local-set-key [67108910] 'lojban-describe-cmavo)
			 ))
