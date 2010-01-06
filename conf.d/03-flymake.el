;; FlyMake minor mode enhancements

(require 'flymake)

(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)

(defun flymake-html-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list "tidy" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
	     '("\\.[xsr]?html?$\\|\\.ctp" flymake-html-init))

(add-to-list 'flymake-err-line-patterns
	     '("line \\([0-9]+\\) column \\([0-9]+\\) - \\(Warning\\|Error\\): \\(.*\\)"
	       nil 1 2 4))

(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name temp-file
		(file-name-directory buffer-file-name))))
    (list "~/.emacs.d/site-lisp/erl-flymake" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init))

(defcustom flymake-shell-of-choice
  "/bin/bash"
  "Path of shell.")

(defcustom flymake-shell-arguments
  (list "-n")
  "Shell arguments to invoke syntax checking.")

(defun flymake-shell-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list flymake-shell-of-choice (append flymake-shell-arguments (list local-file)))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.sh$" flymake-shell-init))
(add-to-list 'flymake-err-line-patterns '("^\\(.+\\): line \\([0-9]+\\): \\(.+\\)$" 1 2 nil 3))

(defun flymake-pylint-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list "~/.emacs.d/site-lisp/python-flymake" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.py\\'" flymake-pylint-init))

(mapcar (lambda (mode)
	  (add-hook mode (lambda () 
			   ; Enter FlyMake mode only if can create temp buffer
			   (if (file-writable-p (flymake-create-temp-inplace (buffer-file-name) nil))
			       (flymake-mode 1)))))
	'(python-mode-hook perl-mode-hook sh-mode-hook erlang-mode-hook))
