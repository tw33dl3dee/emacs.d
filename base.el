;;; Basic utils used for configuration loading

(defun user-path (path)
  "Translate relative user PATH to absolute."
  (concat emacs-user-root "/" path))

(defun add-site-load-path (path)
  "Add local site PATH to `load-path'."
  (add-to-list 'load-path (concat emacs-user-lisp-root "/" path)))

(defun load-files-in-dir (path regexp)
  "Load all files matching REGEXP from directory PATH."
  (mapc #'(lambda (fname)
            (if (string-match regexp fname)
                (load-file (concat path "/" fname))))
        (directory-files path)))

(defun load-file-silently (path &optional fallback)
  "Try loading file PATH and execute FALLBACK on failure."
  (if (file-readable-p path) (load-file path)
    (if fallback (funcall fallback))))

(defun walk-subdirectories (root-dir fun &optional hidden)
  "Walks through all subdirectories recursively,
calling FUN with subdirectory path as argument.

If HIDDEN is t, hidden directories are walked, too."
  (funcall fun root-dir)
  (mapc #'(lambda (file-attrs)
            (let ((file-name (car file-attrs))
                  (is-dir (cadr file-attrs)))
              (when (and is-dir
                         (not (equal "." file-name))
                         (not (equal ".." file-name))
                         (or hidden
                             (not (string-match-p "^\\." file-name))))
                (walk-subdirectories (concat root-dir "/" file-name) fun))))
        (directory-files-and-attributes root-dir)))

;;; Routines invoked from Makefile

(defun user-update-autoloads ()
  "Updates autoloads from `emacs-user-lisp-root' and it's subdirs
listed in `user-autoloaded-subdirs' and saves them to `generated-autoload-file'.

To be called from Makefile."
  (load-file (user-path "conf.d/00-load-paths.el"))
  (apply 'update-directory-autoloads
         (cons emacs-user-lisp-root
               (mapcar (lambda (dir) (concat emacs-user-lisp-root "/" dir))
                       user-autoloaded-subdirs))))

(defun user-byte-recompile ()
  "Byte-recompiles all compiled files under `emacs-user-lisp-root'.

To be called from Makefile."
  (load-file (user-path "conf.d/00-load-paths.el"))
  (byte-recompile-directory emacs-user-lisp-root))

;;; Load paths

(setq emacs-user-root      "~/.emacs.d")
(setq emacs-user-lisp-root "~/.emacs.d/site-lisp")

(add-to-list 'load-path emacs-user-root)
(add-to-list 'load-path emacs-user-lisp-root)

;; Autoloads from `emacs-user-lisp-root'
(setq generated-autoload-file (user-path "autoloads.el"))

;; From which directories to generate autoloads
(setq user-autoloaded-subdirs
      '("autoconf-mode"
        "gentoo-syntax"
        "haskell"
        "lojban"
        "python"
        "ruby"))
