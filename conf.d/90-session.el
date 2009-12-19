;;; Session support

;; Way 1: Save place

;; (require 'saveplace)
;; (setq-default save-place t)	

;; Way 2: Session

(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;; Way 3: Desktop

;;(desktop-save-mode 1)

;; ;; Customization follows below
;; (setq history-length 250)

;; (mapcar
;;  (lambda (symbol) 
;;    (add-to-list 'desktop-globals-to-save symbol))
;;  '((buffer-name-history      . 100)
;;    (dired-regexp-history     . 20)
;;    (extended-command-history . 100)
;;    (file-name-history        . 500)
;;    (grep-history             . 50)
;;    (minibuffer-history       . 100)
;;    (query-replace-history    . 60)
;;    (read-expression-history  . 60)
;;    (regexp-history           . 60)
;;    (regexp-search-ring       . 20)
;;    (search-ring              . 20)
;;    (shell-command-history    . 50)
;;    desktop-dirname))

;; (add-to-list 'desktop-locals-to-save 'buffer-file-coding-system)
;; (add-to-list 'desktop-locals-to-save 'desktop-dirname)

;; (setq desktop-buffers-not-to-save
;; 	  (concat "\\(" "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
;; 			  "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb" 
;; 			  "\\)$"))
;; (add-to-list 'desktop-modes-not-to-save 'Info-mode)
;; (add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)

;; (setq-default desktop-load-locked-desktop nil)
;; (setq-default desktop-missing-file-warning nil)
;; (setq-default desktop-path (list "~/.emacs.d/"))
;; (setq-default desktop-dirname "~/.emacs.d/")
;; (setq-default desktop-save t)
;; (setq-default desktop-save-mode t)
;; (setq-default save-place t)

;; (defun my-desktop-ignore-semantic (desktop-buffer-file-name)
;;        "Function to ignore cedet minor modes during restore of buffers"
;;        nil)
;; (add-to-list 'desktop-minor-mode-handlers '(semantic-stickyfunc-mode . my-desktop-ignore-semantic))
;; (add-to-list 'desktop-minor-mode-handlers '(senator-minor-mode . my-desktop-ignore-semantic))
;; (add-to-list 'desktop-minor-mode-handlers '(semantic-idle-scheduler-mode . my-desktop-ignore-semantic))
;; (add-to-list 'desktop-minor-mode-handlers '(semantic-idle-summary-mode . my-desktop-ignore-semantic))
;; (add-to-list 'desktop-minor-mode-handlers '(semantic-idle-completions-mode . my-desktop-ignore-semantic))
;; (add-to-list 'desktop-minor-mode-handlers '(semantic-mru-bookmark-mode . my-desktop-ignore-semantic))
;; (add-to-list 'desktop-minor-mode-handlers '(semantic-decoration-mode . my-desktop-ignore-semantic))
;; (add-to-list 'desktop-minor-mode-handlers '(srecode-minor-mode . my-desktop-ignore-semantic))
;; (add-to-list 'desktop-minor-mode-handlers '(ede-minor-mode . my-desktop-ignore-semantic))

;; (add-hook 'desktop-after-read-hook #'(lambda () (setq desktop-dirname "~/.emacs.d/") (setq-default desktop-dirname "~/.emacs.d/") (prin1 desktop-dirname)))
;; (add-hook 'desktop-after-read-hook #'(lambda () (interactive) (list-buffers) (switch-to-buffer "*Buffer List*") (delete-other-windows)))

;; (progn (interactive) (desktop-read "~/.emacs.d/") (setq desktop-dirname "~/.emacs.d/"))

;; (setq desktop-dirname "~/.emacs.d/")
;; (setq-default desktop-dirname "~/.emacs.d/")
