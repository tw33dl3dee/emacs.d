;;; ORG-mode customization

;;; Turn on visual line wrapping automatically
;;; Remove S-right/left bindings as they collide with ElScreen
(add-hook 'org-mode-hook
	  '(lambda ()
	     (interactive)
	     (local-unset-key (kbd "<S-left>"))
	     (local-unset-key (kbd "<S-right>"))
	     (unless visual-line-mode
	       (visual-line-mode))))
