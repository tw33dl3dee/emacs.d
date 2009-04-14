;;

;;(require 'etags-table)

;;load the etags-select source code
(require 'etags-select)

;;binding the keys
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)

(defun jds-find-tags-file ()
  "recursively searches each parent directory for a file named 'TAGS' and returns the
path to that file or nil if a tags file is not found. Returns nil if the buffer is
not visiting a file"
  (progn
      (defun find-tags-file-r (path)
         "find the tags file from the parent directories"
         (let* ((parent (file-name-directory path))
                (possible-tags-file (concat parent "TAGS")))
           (cond
             ((file-exists-p possible-tags-file) (throw 'found-it possible-tags-file))
             ((string= "/TAGS" possible-tags-file) nil)
             (t (find-tags-file-r (directory-file-name parent))))))

    (if (buffer-file-name)
        (catch 'found-it 
          (find-tags-file-r (buffer-file-name)))
        (error "buffer is not visiting a file"))))

(defun jds-set-tags-file-path ()
  "calls `jds-find-tags-file' to recursively search up the directory tree to find
a file named 'TAGS'. If found, set 'tags-table-list' with that path as an argument,
otherwise raises an error. If path to TAGS differs from its previous value,
resets `tags-completion-table'."
  (interactive)
  (let ((tags-file (jds-find-tags-file)))
	;; do nothing it TAGS not found
	(when (and tags-file (not (equal (list tags-file) tags-table-list)))
	  (setq tags-table-list (list tags-file) 
			tags-completion-table nil)
	  (message "Loaded TAGS table: %s" tags-table-list)
	  )))

;; delay search the TAGS file after open the source file
(add-hook 'find-file-hook
	'(lambda () (jds-set-tags-file-path)))
