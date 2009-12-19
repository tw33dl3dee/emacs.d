;;; Find file smartly by looking in directories of all open buffers

(defun smart-find-file (filename)
  (interactive "B")
  (let* ((buffer-dirs (mapcar (lambda (buffer) (buffer-local-value 'default-directory buffer)) (buffer-list)))
	 (uniq-dirs (remove-duplicates buffer-dirs :test 'equal))
	 (files (mapcar (lambda (dir) (concat dir filename)) uniq-dirs))
	 (local-files (delq nil (mapcar (lambda (file) (and (not (file-remote-p file)) (file-readable-p file) file)) files))))
    (if (null local-files) (message "No file found by name: %s" filename)
      (mapc (lambda (path) (find-file path) (message "%s" path)) local-files))))
