;;; Kill other buffers with same name

(defun kill-other-buffers-of-this-file-name (&optional buffer)
  "Kill all other buffers visiting files of the same base name."
  (interactive "bBuffer to make unique: ")
  (setq buffer (if buffer (get-buffer buffer) (current-buffer)))
  (cond ((buffer-file-name buffer)
     (let ((name (file-name-nondirectory (buffer-file-name buffer))))
       (loop for ob in (buffer-list)
         do (if (and (not (eq ob buffer))
                 (buffer-file-name ob)
                 (let ((ob-file-name (file-name-nondirectory (buffer-file-name ob))))
                   (or (equal ob-file-name name)
                   (string-match (concat name "\\(\\.~.*\\)?~$") ob-file-name))) )
            (kill-buffer ob)))))
    ((message "This buffer has no file name."))))
