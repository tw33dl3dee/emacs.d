;;; Misc enhancements

;; Enable this "dangerous" commands
;; What on Earth can be dangerous for Master of the known Universe?..
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Disable stupid "type yes or no" questions
(defalias 'yes-or-no-p 'y-or-n-p)

;; Replace selection when typing
(delete-selection-mode t)

;; Clean unused buffers periodically
(require 'midnight)

;; Use M-<right/left...> to switch between windows
(windmove-default-keybindings 'meta)

;; C-w kills current line when no mark
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
    (if mark-active (list (region-beginning) (region-end))
      (list (line-beginning-position)
        (line-beginning-position 2)))))

;; Use iedit for fancy replace
(require 'iedit)

;; Drew Adams' enhancements

(require 'menu-bar+)
(require 'info+)
(require 'apropos+)
(require 'thingatpt+)
(require 'isearch+)
(require 'replace+)

;; When mouse pointer leaves minibuffer, kill it (abort recursive edit)
(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (>= (recursion-depth) 1)
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)
