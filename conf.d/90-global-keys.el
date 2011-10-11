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
(global-set-key [(f7)] 'switch-cc-to-h)
(global-set-key (kbd "C-=") 'lisp-match-paren)
(global-set-key "\C-\M-g" (lambda () (interactive) (scroll-other-window '-)))
(global-set-key "\C-xvw" 'my-git-whatsnew)
(global-set-key (kbd "C-x K") 'kill-other-buffers-of-this-file-name)
(global-set-key (kbd "C-;") 'iedit-mode)
(global-set-key (kbd "<f9>") 'elscreen-create)
(global-set-key (kbd "S-<f9>") 'elscreen-kill)
(global-set-key (kbd "C-<f9>") 'elscreen-clone)
(global-set-key (kbd "<S-left>") 'elscreen-previous)
(global-set-key (kbd "<S-right>") 'elscreen-next)
(global-set-key (kbd "C-x C-b") 'ibuffer-and-jump-to-last)
(global-set-key (kbd "C-x B") 'buffer-menu)
;; Rebind CAPS to f12 for this to work
(global-set-key [(f13)] 'toggle-input-method)

;; These keys are very easy to press in C-SPC END combo, so better unbind them
(global-unset-key (kbd "<C-end>"))
(global-unset-key (kbd "<C-home>"))

;; make C-return alias to M-TAB (coz' ESC TAB is too slow)
(global-set-key [C-return] "\M-\t")

;; window split operation
(global-set-key (kbd "C-c <up>") 'transpose-frame)
(global-set-key (kbd "C-c <down>") 'window-duplicate)
(global-set-key (kbd "C-z C-3") 'window-split-3)
(global-set-key (kbd "C-z C-4") 'window-split-4)
(global-set-key (kbd "C-z C-5") 'window-split-5)
(global-set-key (kbd "C-z C-6") 'window-split-6)

(global-set-key [pause] 'toggle-current-window-dedication)

(global-set-key (kbd "C-<f10>") 'toggle-fullscreen)

;; buffer movement
(global-set-key (kbd "S-M-<up>") 'buf-move-up)
(global-set-key (kbd "S-M-<down>") 'buf-move-down)
(global-set-key (kbd "S-M-<left>") 'buf-move-left)
(global-set-key (kbd "S-M-<right>") 'buf-move-right)
