;;; Misc enhancements

;; Enable this "dangerous" commands
;; What on Earth can be dangerous for Master of the known Universe?..
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Disable stupid "type yes or no" questions
(defalias 'yes-or-no-p 'y-or-n-p)

;; Replace selection when typing
(delete-selection-mode t)

;; Clean unused buffers periodically
(require 'midnight)

;; Use M-<right/left...> to switch between windows
(windmove-default-keybindings 'meta)
