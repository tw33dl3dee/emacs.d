;; Lojban mode customization.

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
