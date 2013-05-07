;;; PROMELA mode

;; (autoload 'promela-mode "promela-mode" "PROMELA mode" t)
(add-to-list 'auto-mode-alist '("\\.promela$" . promela-mode))
(add-to-list 'auto-mode-alist '("\\.spin$" . promela-mode))
(add-to-list 'auto-mode-alist '("\\.pml$" . promela-mode))
