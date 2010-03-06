;;; autoconf-mode

(add-to-list 'load-path "~/.emacs.d/site-lisp/autoconf-mode")

(autoload 'autoconf-mode "autoconf-mode" "Major mode for editing autoconf files." t)
(autoload 'autotest-mode "autotest-mode" "Major mode for editing autotest files." t)

(add-to-list 'auto-mode-alist '("\\.ac\\'\\|configure\\.in\\'" . autoconf-mode))
(add-to-list 'auto-mode-alist '("\\.at\\'" . autotest-mode))
