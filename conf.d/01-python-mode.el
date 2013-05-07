;;; Python mode customization

;;; Indent after Return
(add-hook 'python-mode-hook 
	  '(lambda () 
	     (define-key python-mode-map "\C-m" 'newline-and-indent)
	     (define-key python-mode-map "\C-j" 'newline)))
