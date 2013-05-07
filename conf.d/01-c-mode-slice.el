;;; Slice (Zeroc ICE) files syntax

;; It's C++, essentially.
(add-to-list 'auto-mode-alist '("\\.ice\\'" . c++-mode))

(font-lock-add-keywords
 'c++-mode '(("\\<\\(idempotent\\|interface\\|extends\\)\\>" . font-lock-keyword-face)))
