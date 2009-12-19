
;;; Various ways to make Qt "keywords" work

;;; === Way 1 ===

;; ;; syntax-highlighting for Qt
;;  ;; (based on work by Arndt Gulbrandsen, Troll Tech)
;;  (defun jk/c-mode-common-hook ()
;;    "Set up c-mode and related modes.

;;  Includes support for Qt code (signal, slots and alikes)."

;;    ;; base-style
;;    (c-set-style "stroustrup")
;;    ;; set auto cr mode
;;    (c-toggle-auto-hungry-state 1)

;;    ;; qt keywords and stuff ...
;;    ;; set up indenting correctly for new qt kewords
;;    (setq c-protection-key (concat "\\<\\(public\\|public slot\\|protected"
;;                                   "\\|protected slot\\|private\\|private slot"
;;                                   "\\)\\>")
;;          c-C++-access-key (concat "\\<\\(signals\\|public\\|protected\\|private"
;;                                   "\\|public slots\\|protected slots\\|private slots"
;;                                   "\\)\\>[ \t]*:"))
;;    (progn
;;      ;; modify the colour of slots to match public, private, etc ...
;;      (font-lock-add-keywords 'c++-mode
;;                              '(("\\<\\(slots\\|signals\\)\\>" . font-lock-type-face)))
;;      ;; make new font for rest of qt keywords
;;      (make-face 'qt-keywords-face)
;;      (set-face-foreground 'qt-keywords-face "BlueViolet")
;;      ;; qt keywords
;;      (font-lock-add-keywords 'c++-mode
;;                              '(("\\<Q_OBJECT\\>" . 'qt-keywords-face)))
;;      (font-lock-add-keywords 'c++-mode
;;                              '(("\\<SIGNAL\\|SLOT\\>" . 'qt-keywords-face)))
;;      (font-lock-add-keywords 'c++-mode
;;                              '(("\\<Q[A-Z][A-Za-z]*" . 'qt-keywords-face)))
;;      ))
;;  (add-hook 'c-mode-common-hook 'jk/c-mode-common-hook)

;; === Way 2 ===

;; (defun qt-vsemi-status-unknown-p () nil)

;; (defun qt-at-vsemi-after-q-object ( &optional pos )
;;   (let ((pos-or-point (if pos
;;                           pos
;;                         (point))))
;;     (if (and (> pos-or-point (+ (point-min) 8))
;;              (string-equal (buffer-substring (- pos-or-point 8) pos-or-point) "Q_OBJECT"))
;;         t
;;       nil)))

;; (defun test-at-vsemi-after-q-object ()
;;   (interactive)
;;   (if (qt-at-vsemi-after-q-object (point))
;;       (message "is Q_OBJECT")))


;; (defun qt-lineup-topmost-intro-cont (langelem)
;;   (let ((previous-point (point))(previous-line-end-position (line-end-position)))
;;     (save-excursion
;;       ;; Go back to the previous non-blank line, if any.
;;       (while
;;           (progn
;;             (forward-line -1)
;;             (back-to-indentation)
;;             (and (> (point) (c-langelem-pos langelem))
;;                  (looking-at "[ \t]*$"))))
;;       (if (search-forward "Q_OBJECT" (line-end-position) t)
;;           (if (or (re-search-forward "private[ \t]*:" previous-line-end-position t)
;;                   (re-search-forward "protected[ \t]*:" previous-line-end-position t)
;;                   (re-search-forward "public[ \t]*:" previous-line-end-position t)
;;                   (re-search-forward "signals[ \t]*:" previous-line-end-position t)
;;                   )
;;               '-
;;             '0
;;             )
;;         (progn
;;           (goto-char previous-point)
;;           (c-lineup-topmost-intro-cont langelem)
;;           )
;;         )
;;       )
;;     )
;;   )

;; (defun qt-lineup-inher-cont (langelem)
;;   (let ((previous-point (point))(previous-line-end-position (line-end-position)))
;;     (save-excursion
;;       ;; Go back to the previous non-blank line, if any.
;;       (while
;;           (progn
;;             (forward-line -1)
;;             (back-to-indentation)
;;             (and (> (point) (c-langelem-pos langelem))
;;                  (looking-at "[ \t]*$"))))
;;       (if (search-forward "Q_OBJECT" (line-end-position) t)
;;           (if (or (re-search-forward "private[ \t]+slots[ \t]*:" previous-line-end-position t)
;;                   (re-search-forward "protected[ \t]+slots[ \t]*:" previous-line-end-position t)
;;                   (re-search-forward "public[ \t]+slots[ \t]*:" previous-line-end-position t)
;;                   (re-search-forward "private[ \t]+signals[ \t]*:" previous-line-end-position t)
;;                   (re-search-forward "protected[ \t]+signals[ \t]*:" previous-line-end-position t)
;;                   (re-search-forward "public[ \t]+signals[ \t]*:" previous-line-end-position t)
;;                   )
;;               '-
;;             '0
;;             )
;;         (progn
;;           (goto-char previous-point)
;;           (c-lineup-multi-inher langelem)
;;           )
;;         )
;;       )
;;     )
;;   )

;; (setq mw-c-style
;;       '((c-auto-newline                 . nil)
;;         (c-basic-offset                 . 2)
;;         (c-comment-only-line-offset     . 0)
;;         (c-echo-syntactic-information-p . t)
;;         (c-hungry-delete-key            . t)
;;         (c-tab-always-indent            . t)
;;         (c-toggle-hungry-state          . t)
;;         (c-hanging-braces-alist         . ((substatement-open after)
;; 					   (brace-list-open)))
;;         (c-offsets-alist                . ((arglist-close . c-lineup-arglist)
;;                                            (case-label . +)
;;                                            (substatement-open . 0)
;;                                            (topmost-intro-cont . qt-lineup-topmost-intro-cont)
;;                                            (inher-cont . qt-lineup-inher-cont)
;;                                            (block-open . 0) ; no space before {
;;                                            (inline-open . 0) ; no space before {
;;                                            (knr-argdecl-intro . -)))
;;         (c-hanging-colons-alist         . ((member-init-intro before)
;;                                            (inher-intro)
;;                                            (case-label after)
;;                                            (label after)
;;                                            (access-label after)))
;; 	(c-at-vsemi-p-fn                . qt-at-vsemi-after-q-object)
;; 	(c-vsemi-status-unknown-p       . qt-vsemi-status-unknown-p)
;;         (c-cleanup-list                 . (scope-operator
;;                                            empty-defun-braces
;;                                            defun-close-semi))))

;; ;; Construct a hook to be called when entering C mode
;; (defun lconfig-c-mode ()
;;   (progn (define-key c-mode-base-map "\C-m" 'newline-and-indent)
;;          (define-key c-mode-base-map "\C-z" 'undo)
;;          (define-key c-mode-base-map [f4] 'speedbar-get-focus)
;;          (define-key c-mode-base-map [f9] 'insert-breakpoint)
;;          (define-key c-mode-base-map [f10] 'step-over)
;;          (define-key c-mode-base-map [f11] 'step-into)
;;          (c-add-style "Mark's Coding Style" mw-c-style t)))
;; (add-hook 'c-mode-common-hook 'lconfig-c-mode)

;; (font-lock-add-keywords 'c++-mode '(("\\<\\(Q_OBJECT\\)\\>" . font-lock-constant-face)))
;; (font-lock-add-keywords 'c++-mode '(("\\<\\(public slots\\|public signals\\|private slots\\|private signals\\|protected slots\\|protected signals\\|signals\\)\\>" . font-lock-keyword-face)))
