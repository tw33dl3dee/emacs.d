;;; DVC mode
;;;

(add-to-list 'load-path "~/.emacs.d/site-lisp/dvc")
(require 'dvc-autoloads)

(defun my-git-whatsnew ()
  (interactive) 
  (xgit-changelog "ORIG_HEAD" "HEAD" t))
