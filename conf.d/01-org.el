;;; ORG-mode customization

;;; Turn on visual line wrapping automatically
(add-hook 'org-mode-hook
	  '(lambda ()
	     (interactive)
	     (unless visual-line-mode
	       (visual-line-mode))))
