;;; Haskell mode

(add-hook 'haskell-mode-hook
          (lambda ()
            (require 'inf-haskell)
            (haskell-indent-mode t)
            (haskell-doc-mode t)))
