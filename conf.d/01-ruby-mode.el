;;; Ruby mode
;;; based on http://www.rubygarden.org/Ruby/page/show/InstallingEmacsExtensions  

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(add-hook 'ruby-mode-hook
	  '(lambda ()
             (require 'inf-ruby)
	     (inf-ruby-keys)))

(add-hook 'ruby-mode-hook 'turn-on-font-lock)
