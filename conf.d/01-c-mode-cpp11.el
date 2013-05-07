;;; C++11 support

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
