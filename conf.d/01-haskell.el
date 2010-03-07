;;; Haskell mode

(add-site-load-path "haskell")
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))

(autoload 'haskell-mode "haskell-mode" "Major mode for editing Haskell programs." t)
(autoload 'haskell-indent-mode "haskell-indent" "``Intelligent'' Haskell indentation mode." t)
(autoload 'haskell-doc-mode "haskell-doc" "Enter `haskell-doc-mode' for showing fct types in the echo area." t)

(add-hook 'haskell-mode-hook (lambda ()
			       (require 'inf-haskell)
			       (haskell-indent-mode t)
			       (haskell-doc-mode t)))
