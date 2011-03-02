;;; Load nXhtml/MuMaMo autoloads

;; Prevent ElScreen header from disappearing
(eval-after-load "mumamo"
  (add-hook 'mumamo-after-change-major-mode-hook 'elscreen-run-screen-update-hook))

(require 'web-autoload)
(require 'nxhtml-base)
(load "nxhtml-loaddefs")
