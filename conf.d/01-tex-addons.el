;;; AucTEX and other TeX add-ons customization

(load "auctex")
(load "preview-latex")

;; Find master file by looking at all open LaTeX files
(add-hook 'TeX-mode-hook (lambda () (setq TeX-master (guess-TeX-master (buffer-file-name)))))

(defun guess-TeX-master (filename)
  "Guess the master file for FILENAME from currently open .tex files."
  (let ((candidate nil)
        (filename (file-name-nondirectory filename)))
    (save-excursion
      (dolist (buffer (buffer-list))
        (with-current-buffer buffer
          (let ((name (buffer-name))
                (file buffer-file-name))
            (if (and file (string-match "\\.tex$" file))
                (progn
                  (goto-char (point-min))
                  (if (re-search-forward (concat "\\\\input{" filename "}") nil t)
                      (setq candidate file))
                  (if (re-search-forward (concat "\\\\include{" (file-name-sans-extension filename) "}") nil t)
                      (setq candidate file))))))))
    (if candidate
        (message "TeX master document: %s" (file-name-nondirectory candidate)))
    candidate))

;; Default modes
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; RefTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; Set PDF viewer (from local settings)
(add-hook 'LaTeX-mode-hook (lambda ()
                             (when (boundp 'my-TeX-pdf-viewer)
                               (rplacd (assoc "^pdf$" TeX-output-view-style) '("." "okular %o")))))

;; Insert ~ instead of big Yo in russian keyboard layout
(add-hook 'TeX-mode-hook (lambda ()
                           (define-key TeX-mode-map [1025]
                             (lambda () (interactive) (insert "~")))))
