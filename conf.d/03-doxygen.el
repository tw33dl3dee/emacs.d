;;; Setup Doxymacs mode
;;;

(autoload 'doxymacs-mode "doxymacs" "Minor mode for using/creating Doxygen documentation." t)
(add-hook 'c-mode-common-hook 'doxymacs-mode)

(autoload 'doxymacs-font-lock "doxymacs" "Turn on font-lock for Doxygen keywords." t)
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
