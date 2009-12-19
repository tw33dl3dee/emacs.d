;;; Find file smartly by looking in directories of all open buffers

(defun smart-find-file (filename)
  (interactive "B")
  (mapc #'(lambda (buffer)
	    (let ((path (concat (buffer-local-value 'default-directory buffer) filename)))
	      (if (file-readable-p path) (find-file path))))
	(buffer-list)))
