;;; Semi-modal mode

(defvar semi-modal-minor-mode-keymap (make-sparse-keymap)
  "keymap holding the prefix key's keymapping, not really used")

(defvar semi-modal-minor-mode-disable-key (kbd "<f11>")
  "key to disable the minor mode")

(defun semi-modal-minor-mode-disable ()
  "disable the minor mode"
  (interactive)
  (semi-modal-minor-mode 0))

(define-minor-mode semi-modal-minor-mode
  "local minor mode that prompts for a prefix key and promotes that keymap to the toplevel
e.g. If there are bindings like the following:

M-g ESC         Prefix Command
M-g g           goto-line
M-g n           next-error
M-g p           previous-error

And you enter 'M-g n' when prompted,
then the minor mode keymap has the bindings
  g   ->   goto-line
  n   ->   next-error
  p   ->   previous-error
  ESC ->   Prefix Command (same as M-g ESC)

The variable semi-modal-minor-mode-disable-key is bound to disable the minor mode map.
This is provided because often the mappings make the keyboard unusable.
Use at your own risk."
  nil " Semi" semi-modal-minor-mode-keymap
  (make-local-variable 'semi-modal-minor-mode)
  (make-local-variable 'minor-mode-map-alist)
  (let ((pair-holding-keymap-to-modify (assq 'semi-modal-minor-mode minor-mode-map-alist)))
    (setcdr pair-holding-keymap-to-modify (make-sparse-keymap))
    (if semi-modal-minor-mode
        (let (key
              keymap)
          ;; all but last (b/c we want a prefix
          (setq key (substring (read-key-sequence "Enter a full key combination, the prefix will be used: ") 0 -1))
          (if (and (not (equal "" key))
                   (not (equal (kbd "C-g") key))
                   (let ((semi-modal-minor-mode nil))
                     (keymapp (setq keymap (key-binding key)))))
              (progn
                (setcdr pair-holding-keymap-to-modify (copy-keymap keymap))
                (when semi-modal-minor-mode-disable-key
                  (define-key (cdr pair-holding-keymap-to-modify)
                    semi-modal-minor-mode-disable-key 'semi-modal-minor-mode-disable)))
            (semi-modal-minor-mode 0))))))
