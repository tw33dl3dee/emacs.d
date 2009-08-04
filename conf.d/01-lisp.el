;; some misc stuff for LISP

(defun lisp-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1))
		((save-excursion (backward-char) (looking-at "\\s\)")) (backward-list 1))
		(t (self-insert-command (or arg 1)))))