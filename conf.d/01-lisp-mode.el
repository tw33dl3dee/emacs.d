;; Some misc stuff for Lisp

(defun lisp-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1))
        ((save-excursion (backward-char) (looking-at "\\s\)")) (backward-list 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))))

;; Highlight nested parens and display function documentation in status line.
(mapcar (lambda (mode)
          (add-hook mode
                    '(lambda ()
                       (eldoc-mode t)
                       ;; 4-space indent
                       (set (make-local-variable 'tab-width) 4)
                       (highlight-parentheses-mode t))))
        '(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook))
