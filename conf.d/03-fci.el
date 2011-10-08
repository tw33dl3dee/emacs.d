;;; fill-column mode
;;;

(add-hook 'c-mode-common-hook (lambda () (fci-mode t)))
(add-hook 'python-mode-hook (lambda () (fci-mode t)))
(add-hook 'js2-mode-hook (lambda () (fci-mode t)))
