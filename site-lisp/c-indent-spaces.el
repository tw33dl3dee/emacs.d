;; See http://www.gnu.org/software/emacs/manual/html_node/ccmode/Syntactic-Symbols.html
(defvar c-elements-to-align-with-spaces
  (list 'func-decl-cont
        'topmost-intro-cont
        'arglist-cont
        'arglist-cont-nonempty
        'statement-cont
        'c
        'inher-cont
        'member-init-cont
        'template-args-cont
        'objc-method-args-cont
        'objc-method-call-cont)
  "List of syntactic elements that should be aligned with spaces.
If you find an element you want to align with spaces but is not handled here,
find the syntactic element with C-c C-s or M-x c-show-syntactic-information
and simply add it to the list.")

(defun c-context-continuation-p (context)
  "Returns t if the given context is part of a continuation, i.e.
it should be aligned with spaces. The syntactic elements defined
as being a part of a continuation is defined by the variable
c-elements-to-align-with-spaces."
  (let ((continuation nil))
    (dolist (elem c-elements-to-align-with-spaces continuation)
      (when (assq elem context)
        (setq continuation t)))))

;;;###autoload
(defun c-indent-align-with-spaces-hook ()
  "If indent-tabs-mode is nil this function does nothing. If
indent-tabs-mode is enabled and if current indentation is an
alignment operation, this function will format the line so that
tabs are used until the indent level of the previous line and use
spaces for the rest (the aligment)."
  (interactive)
  (when indent-tabs-mode
    (let ((context c-syntactic-context)
          (curr-indent (current-indentation))
          (base-indent nil))
      (when (c-context-continuation-p context)
        (save-excursion
          ;; Find indentation of nearest not-continuation context
          (do ()
              ((not (c-context-continuation-p context)))
            (goto-char (c-langelem-pos (car context)))
            (setq context (c-guess-basic-syntax)))
          (setq base-indent (current-indentation)))
        ;; Untabify region between base indent and current indent
        (let ((end (point)))
          (save-excursion
            (while (> (current-column) base-indent)
              (backward-char))
            (untabify (point) end)))
        ;; We might need to adjust the marker to a more correct/practical
        ;; position.
        (when (= (current-column) base-indent)
          (back-to-indentation))))))
