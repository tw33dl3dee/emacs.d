;;; Custom Git commands.

(defun my-git-whatsnew ()
  (interactive) 
  (require 'xgit)
  (xgit-changelog "ORIG_HEAD" "HEAD" t))

;;; When opening VC status on vc-controlled subdirectory, jump to the top directory
;;; This makes all paths correct
(defadvice vc-dir-prepare-status-buffer (before my-vcs-goto-top-directory activate compile)
  (let* ((backend (ad-get-arg 2))
	 (vcs-dir (ad-get-arg 1))
	 (vcs-top-dir (vc-call-backend backend 'responsible-p vcs-dir)))
    (when (stringp vcs-top-dir)
      (ad-set-arg 1 vcs-top-dir))))

(defun my-git-find-file-in-whats-push ()
  "Offers user to open a file from the current diff with origin."
  (interactive)
  (let ((top-dir (vc-git-root (buffer-file-name (current-buffer)))))
    (when top-dir
      (find-file
       (concat top-dir
               (ido-completing-read
                "Which file from current CL? "
                (split-string (shell-command-to-string "git diff origin --name-only"))))))))

;; BUG: NOT WORKING YET
;; (defadvice log-edit-hide-buf (around log-edit-hide-buf-no-delete-window activate)
;;   (when (setq buf (get-buffer (or buf log-edit-files-buf)))
;;     (bury-buffer buf)))
