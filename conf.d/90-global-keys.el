;; key rebinding

(global-unset-key "\C-z")
(global-set-key "\C-z\C-c" 'compile)
(global-set-key "\C-z\C-s" 'shell)
(global-set-key "\C-zs" (lambda () (interactive) (shell (switch-to-buffer-other-window "*shell*"))))
(global-set-key "\C-z\C-o" (lambda () (interactive) (shell (switch-to-buffer-other-window "*shell*"))))
(global-set-key "\C-z\C-d" 'gdb)
(global-set-key "\C-z\C-g" 'rgrep)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-z\C-i" 'indent-region)
(global-set-key "\C-z\C-l" 'locate)
(global-set-key "\C-z\C-p" 'pastebin)
(global-set-key "\C-z\C-m" 'matlab-shell)
(global-set-key "\C-zl" 'locate-with-filter)
(global-set-key "\C-z\C-j" 'lojban-describe-valsi)
(global-set-key "\C-z\C-x" (lambda () (interactive) (compile-and-run)))
(global-set-key "\C-z\C-f" 'smart-find-file)
(global-set-key "\C-z\C-r" (lambda () (interactive) (revert-buffer nil t)))
(global-set-key [(f1)] (lambda () (interactive) (manual-entry (current-word))))
(global-set-key [(f2)] 'ffap-perl-module)
(global-set-key [(f5)] (lambda () (interactive) (smart-find-file (current-word))))
(global-set-key [(f6)] (lambda () (interactive) (switch-to-buffer (find-buffer-visiting (current-word)))))
(global-set-key (kbd "C-=") 'lisp-match-paren)
(global-set-key "\C-\M-g" (lambda () (interactive) (scroll-other-window '-)))
(global-set-key "\C-xvw" 'my-git-whatsnew)

;; make C-return alias to M-TAB (coz' ESC TAB is too slow)
(global-set-key [C-return] "\M-\t")
