;;; Dired customization

;; This will prevent Dired from creating new buffer for opening subdirectory

(eval-after-load "dired"
  '(progn
     (defadvice dired-advertised-find-file (around dired-subst-directory activate)
       "Replace current buffer if file is a directory."
       (interactive)
       (let* ((orig (current-buffer))
	      ;; (filename (dired-get-filename))
	      (filename (dired-get-filename t t))
	      (bye-p (file-directory-p filename)))
	 ad-do-it
	 (when (and bye-p (not (string-match "[/\\\\]\\.$" filename)))
	   (kill-buffer orig))))))

;; And this -- for going up (^)

(eval-after-load "dired"
  ;; don't remove `other-window', the caller expects it to be there
  '(defun dired-up-directory (&optional other-window)
     "Run Dired on parent directory of current directory."
     (interactive "P")
     (let* ((dir (dired-current-directory))
     	    (orig (current-buffer))
     	    (up (file-name-directory (directory-file-name dir))))
       (or (dired-goto-file (directory-file-name dir))
     	   ;; Only try dired-goto-subdir if buffer has more than one dir.
     	   (and (cdr dired-subdir-alist)
     		(dired-goto-subdir up))
     	   (progn
     	     (kill-buffer orig)
     	     (dired up)
     	     (dired-goto-file dir))))))