;;; This file contains lots of unused bullshit. Don't panic

;;; I don't like it
;;(glasses-mode) 

;; CUDA files are C++ also
;; as Slice definitions, too (a little weird, yeah)
(add-to-list 'auto-mode-alist '("\\.\\(cu\\|cpp\\|cxx\\|cc\\|ice\\)$" . c++-mode))

(font-lock-add-keywords 'c++-mode '(("\\<\\(idempotent\\)\\>" . font-lock-keyword-face)))
(font-lock-add-keywords 'c++-mode '(("\\<\\(interface\\)\\>" . font-lock-keyword-face)))
(font-lock-add-keywords 'c++-mode '(("\\<\\(extends\\)\\>" . font-lock-keyword-face)))

;;; Functions for lineup in math exprs (UNUSED)
(defun my-c-lineup-math (langelem)
  (save-excursion
    (let ((equalp (save-excursion
		    (goto-char (c-point 'boi))
		    (let ((eol (c-point 'eol)))
		      (c-forward-token-1 0 t eol)
		      (while (and (not (eq (char-after) ?=))
				  (= (c-forward-token-1 1 t eol) 0))))
		    (and (eq (char-after) ?=)
			 (- (point) (c-point 'boi)))))
	  (langelem-col (c-langelem-col langelem))
	  donep)
      (while (and (not donep)
		  (< (point) (c-point 'eol)))
	(skip-chars-forward "^=" (c-point 'eol))
	(if (c-in-literal (cdr langelem))
	    (forward-char 1)
	  (setq donep t)))
      (if (or (not (eq (char-after) ?=))
	      (save-excursion
		(forward-char 1)
		(c-forward-syntactic-ws (c-point 'eol))
		(eolp)))
	  ;; there's no equal sign on the line
	  ;; c-basic-offset
	  nil
	;; calculate indentation column after equals and ws, unless
	;; our line contains an equals sign
	(if (not equalp)
	    (progn
	      (forward-char 1)
	      (skip-chars-forward " \t")
	      (setq equalp 0)))
	(- (current-column) equalp langelem-col))
      )))

(defun my-c-lineup-space (langelem)
  (save-excursion
    (let ((langelem-col (c-langelem-col langelem)))
      (re-search-forward "[_A-Za-z0-9]* " (c-point 'eol) 'move)
      (goto-char (match-end 0))
      (- (current-column) langelem-col))))

;;  ;; cc-mode
;;  (require 'cc-mode)

;;  ;; automatic indent on return in cc-mode
;;  (define-key c-mode-base-map "\r" 'newline-and-indent)

;;  ;; Do not check for old-style (K&R) function declarations;
;;  ;; this speeds up indenting a lot.
;;  (setq c-recognize-knr-p nil)

;;  ;; Switch fromm *.<impl> to *.<head> and vice versa
;;  (defun switch-cc-to-h ()
;;    (interactive)
;;    (when (string-match "^\\(.*\\)\\.\\([^.]*\\)$" buffer-file-name)
;;      (let ((name (match-string 1 buffer-file-name))
;;  	  (suffix (match-string 2 buffer-file-name)))
;;        (cond ((string-match suffix "c\\|cc\\|C\\|cpp")
;;  	     (cond ((file-exists-p (concat name ".h"))
;;  		    (find-file (concat name ".h"))
;;  		   )
;;  		   ((file-exists-p (concat name ".hh"))
;;  		    (find-file (concat name ".hh"))
;;  		   )
;;  	    ))
;;  	    ((string-match suffix "h\\|hh")
;;  	     (cond ((file-exists-p (concat name ".cc"))
;;  		    (find-file (concat name ".cc"))
;;  		   )
;;  		   ((file-exists-p (concat name ".C"))
;;  		    (find-file (concat name ".C"))
;;  		   )
;;  		   ((file-exists-p (concat name ".cpp"))
;;  		    (find-file (concat name ".cpp"))
;;  		   )
;;  		   ((file-exists-p (concat name ".c"))
;;  		    (find-file (concat name ".c"))
;;  		   )))))))

