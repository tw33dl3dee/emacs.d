;;; Misc file operation enhancements

;; Kill other buffers with same name
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

;; Big files have no undo history to prevent high memory usage
(defun tj-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 5 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (message "Buffer is set to read-only because it is large.  Undo also disabled.")))

(add-hook 'find-file-hooks 'tj-find-file-check-make-large-file-read-only-hook)

;; Different dialog when closing file
(defadvice kill-buffer (around my-kill-buffer-check activate)
  "Prompt when a buffer is about to be killed."
  (let* ((buffer-file-name (buffer-file-name)))
    (if (and (buffer-modified-p)
             buffer-file-name
             (file-exists-p buffer-file-name))
        (let ((answer (completing-read (format "Buffer modified %s, (d)iff, (s)ave, (k)ill? " (buffer-name))
                                       '("d" "s" "k") nil t)))
          (cond ((equal answer "d")
		 (diff-buffer-with-file (current-buffer)))
                ((equal answer "k")
                 (set-buffer-modified-p nil)
                 ad-do-it)
                (t
                 (save-buffer)
                 ad-do-it)))
      ad-do-it)))
