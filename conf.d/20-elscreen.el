;;; Setup ElScreen (tabbed Emacs)

(require 'elscreen)
(require 'elscreen-w3m)
(require 'elscreen-buffer-list)

;; (defadvice switch-to-buffer (before elscreen-switch activate compile)
;;   "When called non-interactive, switch first to the appropriate elscreen."
;;   (when buffer-or-name 
;;     (elscreen-find-and-goto-by-buffer buffer-or-name nil t)))

;; (defun elscreen-frame-title-update ()
;;   (when (elscreen-screen-modified-p 'elscreen-frame-title-update)
;;     (let* ((screen-list (sort (elscreen-get-screen-list) '<))
;; 	   (screen-to-name-alist (elscreen-get-screen-to-name-alist))
;; 	   (title (mapconcat
;; 		   (lambda (screen)
;; 		     (format "%d%s %s"
;; 			     screen (elscreen-status-label screen)
;; 			     (get-alist screen screen-to-name-alist)))
;; 		   screen-list " ")))
;;       (if (fboundp 'set-frame-name)
;; 	  (set-frame-name title)
;; 	(setq frame-title-format title)))))

;; (eval-after-load "elscreen"
;;   '(add-hook 'elscreen-screen-update-hook 'elscreen-frame-title-update))
