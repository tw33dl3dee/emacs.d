;;; Python mode

(add-to-list 'load-path "~/.emacs.d/site-lisp/python")

;;; indent after Return
(add-hook 'python-mode-hook 
	  '(lambda () 
	     (define-key python-mode-map "\C-m" 'newline-and-indent)
	     (define-key python-mode-map "\C-j" 'newline)
			 ;;; Turn tabs off
	     (set (make-local-variable 'indent-tabs-mode) nil)))

;; To enable ElDoc by default in your python mode buffers, you might want something like:
(add-hook 'python-mode-hook
          '(lambda () (eldoc-mode 1)) t)

;;; (unused)
(defun my-python-documentation (w)
  "Launch PyDOC on the Word at Point"
  (interactive
   (list (let* ((word (thing-at-point 'word))
		(input (read-string 
			(format "pydoc entry%s: " 
				(if (not word) "" (format " (default %s)" word))))))
	   (if (string= input "") 
	       (if (not word) (error "No pydoc args given")
		 word) ;sinon word
	     input)))) ;sinon input
  (shell-command (concat py-python-command " -c \"from pydoc import help;help(\'" w "\')\"") "*PYDOCS*")
  (view-buffer-other-window "*PYDOCS*" t 'kill-buffer-and-window))
