;;; This file contains lots of unused bullshit. Don't panic

;; CUDA files are C++ also
;; as Slice definitions, too (a little weird, yeah)
(add-to-list 'auto-mode-alist '("\\.\\(cu\\|cpp\\|cxx\\|cc\\|ice\\)$" . c++-mode))

;; Slice keywords
(font-lock-add-keywords
 'c++-mode '(("\\<\\(idempotent\\|interface\\|extends\\)\\>" . font-lock-keyword-face)))

;; C++11 class enum
;; BUG: not really working.
(defun inside-class-enum-p (pos)
  "Checks if POS is within the braces of a C++ \"enum class\"."
  (ignore-errors
    (save-excursion
      (goto-char pos)
      (up-list -1)
      (backward-sexp 1)
      (looking-back "enum[ \t]+class[ \t]+[^}]*"))))

(defun align-enum-class (langelem)
  (if (inside-class-enum-p (c-langelem-pos langelem))
      0
    (c-lineup-topmost-intro-cont langelem)))

(defun align-enum-class-closing-brace (langelem)
  (if (inside-class-enum-p (c-langelem-pos langelem))
      '-
    '+))

;; C++11 keywords
(font-lock-add-keywords
 'c++-mode '(("\\<\\(nullptr\\)\\>" . font-lock-constant-face)
             ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)))

;; Switch fromm *.<impl> to *.<head> and vice versa
(defun switch-cc-to-h ()
  (interactive)
  (when (string-match "^\\(.*\\)\\.\\([^.]*\\)$" buffer-file-name)
    (let ((name (match-string 1 buffer-file-name))
 	  (suffix (match-string 2 buffer-file-name)))
      (cond ((string-match suffix "c\\|cc\\|C\\|cpp")
 	     (cond ((file-exists-p (concat name ".h"))
 		    (find-file (concat name ".h"))
		    )
		   ((file-exists-p (concat name ".H"))
 		    (find-file (concat name ".H"))
		    )
 		   ((file-exists-p (concat name ".hh"))
 		    (find-file (concat name ".hh"))
		    )
		   ((file-exists-p (concat name ".hpp"))
 		    (find-file (concat name ".hpp"))
		    )
		   ))
 	    ((string-match suffix "h\\|H\\|hh\\|hpp")
 	     (cond ((file-exists-p (concat name ".cc"))
 		    (find-file (concat name ".cc"))
		    )
 		   ((file-exists-p (concat name ".C"))
 		    (find-file (concat name ".C"))
		    )
 		   ((file-exists-p (concat name ".cpp"))
 		    (find-file (concat name ".cpp"))
		    )
 		   ((file-exists-p (concat name ".c"))
 		    (find-file (concat name ".c"))
		    )))))))
