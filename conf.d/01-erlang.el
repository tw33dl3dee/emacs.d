(add-to-list 'load-path "~/.emacs.d/site-lisp/erlang")
(autoload 'erlang-mode "erlang")
(add-to-list 'auto-mode-alist '("\\.\\(hrl\\|erl\\)$" . erlang-mode))
