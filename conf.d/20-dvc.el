;;; Various enhancements for DVCSs (dvc-mode, custom commands, etc)
;;;

(add-to-list 'load-path "~/.emacs.d/site-lisp/dvc")
(require 'dvc-autoloads)

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
