;; some misc stuff for LISP

(defun lisp-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1))
	((save-excursion (backward-char) (looking-at "\\s\)")) (backward-list 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))))

;; 8-space tabs are much more convenient in LISP programs
(mapcar (lambda (sym) 
	  (add-hook sym
		    '(lambda ()
		       (set (make-local-variable 'tab-width) 8)
		       (eldoc-mode 1))))
	'(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook))

;; Highlight nested parens
(add-hook 'lisp-mode-hook #'(lambda () 
			      (highlight-parentheses-mode t)))
(add-hook 'emacs-lisp-mode-hook #'(lambda () 
				    (highlight-parentheses-mode t)))
