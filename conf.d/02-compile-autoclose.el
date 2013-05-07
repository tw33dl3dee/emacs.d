;;; Close buffer after compilation

(add-to-list 'compilation-finish-functions 'compile-autoclose)

(defun compile-autoclose (buffer string)
  (when (string= (buffer-name buffer) "*compilation*")
    (if (string-match "finished" string)
        (progn (winner-undo)
               (bury-buffer "*compilation*"))
      (message "Compilation exited abnormally: %s" string))))
