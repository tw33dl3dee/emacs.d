;;; java5-font-lock.el --- Add Java 5'ism font-locking.

;;; Commentary:
;; Adds java5 font-locking (generics, for-in oops, annotations, enum, var-args)
;; support to JDE's existing java font-lock support.

;;; History:
;; 2007/01/31 v0.1 initial version

;; TODO remove hard-coded colors and replace with customizable faces

;;; Code:
;;;###autoload
(defun java5-font-lock ()
  "Add font-lock keywords for Java 1.5'isms.
http://java.sun.com/j2se/1.5.0/docs/guide/language/"
  (interactive)
  (let* ((id "[A-Za-z$_0-9]")
	 (type-or-access-spec "[A-Za-z$_0-9<,> ]+")
         (constant "\\_<[A-Z][A-Z$_0-9]\\{1,\\}\\_>")
         (cap-word (concat "\\_<[[:upper:]]" id "*\\_>"))
         (low-word (concat "\\_<[[:lower:]]" id "*\\_>"))
         (annotation (concat "@" cap-word)))
    (font-lock-add-keywords
     nil
     `((,(face-matcher-factory (concat "\\<\\(enum\\)\\S+\\(" cap-word "\\)")
       			       '(font-lock-type-face font-lock-variable-name-face nil))
        (1 font-lock-keyword-face t)
       	(2 font-lock-type-face t))
       (,(face-matcher-factory "\\<enum\\>" 
       			       '(font-lock-type-face font-lock-variable-name-face nil))
        (0 font-lock-keyword-face t))
       ;; (,(face-matcher-factory (concat "\\(" annotation "\\)\\S+" type-or-access-spec "\\S+\\(" low-word "\\)(")
       ;; 			       '(nil))
       ;;  (1 font-lock-builtin-face t)
       ;; 	(2 font-lock-function-name-face t))
       ;; (,(face-matcher-factory (concat "\\(" annotation "\\)\\S+\\(class\\|interface\\)\\S+\\(" cap-word "\\)")
       ;; 			       '(nil))
       ;;  (1 font-lock-builtin-face t)
       ;; 	(3 font-lock-type-face t))
       ;; (,(face-matcher-factory (concat "\\(" annotation "\\)\\S+" type-or-access-spec "\\S+\\(" low-word "\\)")
       ;; 			       '(nil))
       ;;  (1 font-lock-builtin-face t)
       ;; 	(2 font-lock-variable-name-face t))
       (,(face-matcher-factory (concat "\\(@interface\\)\\S+\\(" cap-word "\\)")
			       '(nil))
        (1 font-lock-keyword-face t)
	(2 font-lock-builtin-face t))
       (,(face-matcher-factory annotation '(nil))
        (0 font-lock-builtin-face t))
       (,(face-matcher-factory constant 
			       '(font-lock-type-face font-lock-variable-name-face nil))
        (0 font-lock-constant-face t))
       (,(face-matcher-factory constant 
			       '(font-lock-type-face font-lock-variable-name-face nil))
	(0 font-lock-constant-face t))
       (font-lock-generics-matcher
        (1 font-lock-type-face t)         ;; non-generic or outer generic type
        (2 '(:foreground "rosybrown") t)  ;; intermediate generic types
        (3 '(:foreground "dark khaki") t) ;; inner generic type
        (4 font-lock-variable-name-face t))))))

(defun face-matcher-factory (regexp match-faces)
  "Return a matcher for REGEXP which matches only within MATCH-FACES.
The matcher is a function of one argument (limit) suitable for
use as a MATCHER in `font-lock-keywords' that will match
occurences of REGEXP which are already fontified with any of
MATCH-FACES."
  `(lambda (limit)
    ,(concat "Factory-generated matcher for matching `" regexp
            "' while avoiding occurences already fontified with any of "
            (prin1-to-string match-faces))
    (if (not (search-forward-regexp ,regexp limit t))
        nil
      (if (member (get-text-property (match-beginning 0) 'face)
		  (quote ,match-faces))
          t
        ;; if already doc/comment/string move point along
        (progn (goto-char (match-end 0))
               (set-match-data (list limit limit limit limit limit
                                     limit limit limit limit limit))
               t)))))
;; eval this to see an example of what the above generates
;; (prin1-to-string (face-matcher-factory "hello" '(f g h)))

(defun font-lock-generics-matcher (limit)
  "Font-lock matcher function for Java 1.5 generics.
The `match-data' set by this
matcher will represent three matched subexpressions (any of which may be
  empty) corresponding to the base type, any intermediate-level types, and the
  inner-most types.  Only returns matches following point.  Moves point to the
  end of the last subexpression.  Doesn't search beyond LIMIT."
  (if (not (search-forward-regexp
            "[^@]\\(\\_<[[:upper:]][A-Za-z0-9$_]*\\_>\\)[<,>]" limit t))
      nil
    ;; TODO: this duplicates logic from face-matcher-factory but I'm too
    ;; tired to refactor this to use that right now.
    (if (or (member (get-text-property (match-beginning 1) 'face)
		    '(font-lock-type-face nil))
            ;; if not suitable face, move point along
            (progn (goto-char (match-end 1)) nil))
        (let* ((hack (backward-char))
	       (b (match-beginning 1))
               (e (match-end 1))
               (low-word "\\_<[[:lower:]][A-Za-z0-9$_]*\\_>")
               (ret (list b e))
               (prev-openers (count-matches "<"
                                            (line-beginning-position) (point)))
               (prev-closers (count-matches ">"
                                            (line-beginning-position) (point)))
               (outer (= prev-openers prev-closers))
               (inner (and (search-forward-regexp "\\([<,>]\\)" limit t)
                           (or (equal ">" (match-string 1))
                               (equal "," (match-string 1)))))
               (varb (or (and (goto-char e)
                              ;; want to use looking-at but must obey limit!
                              (search-forward-regexp
                               (concat "[][> \t]*\\s-*\\(?:\\.\\.\\.\\)?\\s-*"
                                       "\\(" low-word "\\(?:\\s-*,\\s-*"
                                       low-word "\\)*\\)[^(]")
                               limit t)
                              (= e (match-beginning 0)) ;; imitate looking-at
                              (match-beginning 1))
                         0))
               (vare (or (and (> varb 0) (match-end 1))
                         0)))
          ;;(message (format "outer=%s, inner=%s, b=%d, e=%d, varb=%d, vare=%d"
          ;;                 outer inner b e varb vare))
          (if outer
              (setq ret (append ret (list b e 0 0 0 0)))
            (if inner
                (setq ret (append ret (list 0 0 0 0 b e)))
              (setq ret (append ret (list 0 0 b e 0 0)))))
          (set-match-data (append ret (list varb vare (current-buffer))))
          (goto-char (max e vare)) ;; point may have moved since initial search
          t)
      ;; must not return nil from this method to allow artificial point movement
      ;; caused by doc/comment/string detection to be considered.
      (set-match-data (list limit limit limit limit limit
                            limit limit limit limit limit))
      t)))

;;;###autoload(add-hook 'jde-mode-hook 'java5-font-lock)
;;;###autoload(add-hook 'java-mode-hook 'java5-font-lock)

(provide 'java5-font-lock)

;;; java5-font-lock.el ends here
