;;; Misc stuff around Scroll Lock

;; Flash Scroll Lock LED instead of ringing bell
(setq ring-bell-function (lambda ()
			   (call-process-shell-command "xset led 3; xset -led 3" nil 0 nil)))

;; Pressing Scroll Lock locks cursor position and lets text scroll around it
(global-set-key (kbd "<Scroll_Lock>") 'scroll-lock-mode)
