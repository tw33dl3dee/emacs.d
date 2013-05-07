;;; Setup Doxymacs mode

(add-hook 'c-mode-common-hook 'doxymacs-mode)

(add-hook 'font-lock-mode-hook
          (lambda ()
            (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
                (doxymacs-font-lock))))
