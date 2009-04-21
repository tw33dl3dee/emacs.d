;;; Main Emacs config

;;; Init load paths
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;;; Variables set by Custom are stored here
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(PC-include-file-path (quote ("/usr/include" "/usr/local/include" "/opt/boost/include/" "/usr/include/mysql" "/usr/lib/qt4/include/QtCore" "/usr/lib/qt4/include/QtQui" "/usr/lib/qt4/include/QtNetwork" "/usr/lib/qt4/include/QtSql" "/usr/lib/qt4/include/QtOpenGL")))
 '(ange-ftp-try-passive-mode t)
 '(auto-compression-mode t nil (jka-compr))
 '(backward-delete-char-untabify-method nil)
 '(browse-url-browser-function (quote w3m-browse-url))
 '(browse-url-generic-args (quote ("-newpage")))
 '(browse-url-generic-program "")
 '(c-basic-offset 4)
 '(c-echo-syntactic-information-p t)
 '(c-electric-pound-behavior (quote (alignleft)))
 '(c-offsets-alist (quote ((brace-list-open . 0) (substatement-open . 0) (statement-cont . +) (topmost-intro-cont . +) (cpp-macro-cont . +))))
 '(c-tab-always-indent t)
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(debug-on-error t)
 '(default-input-method "cyrillic-jcuken")
 '(delphi-case-label-indent 4)
 '(delphi-indent-level 4)
 '(display-time-mode t)
 '(doxymacs-doxygen-dirs (quote (("^/home/twee/work/videofon/views/" "/home/twee/work/videofon/views/tags.xml" "file:///home/twee/work/videofon/views/doc/html/"))))
 '(doxymacs-use-external-xml-parser t)
 '(ebs-exclude-buffer-regexps (quote ("^ " "^\\*Messages\\*" "^\\*Buffer List\\*" "^\\*Completions\\*" "^\\*scratch\\*" "^\\*debug.*\\*" "^\\*GNU Emacs\\*")))
 '(etags-select-go-if-unambiguous t)
 '(explicit-bash-args (quote ("--noediting" "--login" "-i")))
 '(glasses-face "bold")
 '(glasses-separate-parentheses-p nil)
 '(glasses-separator "")
 '(global-font-lock-mode t nil (font-lock))
 '(grep-command "nice grep -nH -e ")
 '(grep-template "nice grep <C> -nH -e <R> <F>")
 '(icomplete-mode t nil (icomplete))
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(locate-command "slocate")
 '(locate-prompt-for-command nil)
 '(locate-update-command "sudo updatedb")
 '(make-backup-files nil)
 '(mouse-wheel-down-button 4 t)
 '(mouse-wheel-follow-mouse t)
 '(mouse-wheel-mode t nil (mwheel))
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (3 ((shift) . 1) ((control)))))
 '(mouse-wheel-up-button 5 t)
 '(octave-auto-indent t)
 '(octave-auto-newline nil)
 '(octave-block-offset 4)
 '(partial-completion-mode t nil (complete))
 '(perl-tab-always-indent t)
 '(python-guess-indent nil)
 '(save-place-file "~/.emacs.d/places")
 '(session-undo-check 0)
 '(show-paren-mode t nil (paren))
 '(size-indication-mode t)
 '(split-width-threshold nil)
 '(sql-product (quote mysql))
 '(sql-server "localhost")
 '(sql-user "root")
 '(standard-indent 4)
 '(tab-always-indent nil)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 88 96 104 104 112)))
 '(tab-width 4)
 '(tags-revert-without-query t)
 '(tramp-default-method "ssh")
 '(tramp-verbose 4)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(user-mail-address "twee@tweedle-dee.org")
 '(w3m-home-page "http://localhost/")
 '(w3m-use-cookies t)
 '(which-function-mode t nil (which-func))
 '(x-select-enable-clipboard t)
 '(xref-completion-access-check t)
 '(xref-completion-delete-pending-identifier nil)
 '(xref-completion-inserts-parenthesis t)
 '(xref-completion-linkage-check t)
 '(xref-display-active-project-in-minibuffer nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :family "courier")))))

;;; Load configuration from conf.d/*.el
(defun load-files-in-dir (path regexp)
  (mapc #'(lambda (fname) 
		  (if (string-match regexp fname)
			  (load-file (concat path "/" fname))))
	  (directory-files path)))

(load-files-in-dir "~/.emacs.d/conf.d" "^\\(.+\\)\.el$")

;;; Load site-local configuration, if any
(defun load-file-silently (path)
  (if (file-readable-p path) (load-file path)))

(load-file-silently "~/.emacs.d/local.el")
