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

;; M-w copies current line when no mark
(defadvice kill-ring-save (before slick-copy activate compile)
      "When called interactively with no active region, copy a single line instead."
      (interactive
       (if mark-active (list (region-beginning) (region-end))
         (message "Copied line")
         (list (line-beginning-position)
               (line-beginning-position 2)))))

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

;; Alternative C-o M-o behaviour

(defvar newline-and-indent t
  "Modify the behavior of the open-*-line functions to cause them to autoindent.")

(defun open-next-line (arg)
  "Move to the next line and then opens a line.
    See also `newline-and-indent'."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))
(global-set-key (kbd "C-o") 'open-next-line)

(defun open-previous-line (arg)
  "Open a new line before the current one. 
     See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))
(global-set-key (kbd "M-o") 'open-previous-line)
