;;; PHP mode

(autoload 'php-mode "php-mode" "Major mode for editing PHP code" t)
(add-to-list 'auto-mode-alist '("\\.php[^\\.]*$" . php-mode))
