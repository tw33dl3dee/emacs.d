;;; YAML mode

;;(require 'yaml-mode)
(autoload 'yaml-mode "yaml-mode" "Mode for editing YAML configs")
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

(add-hook 'yaml-mode-hook
	  '(lambda ()
	     (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
