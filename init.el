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
 '(LaTeX-font-list (quote ((1 "" "" "\\mathcal{" "}") (2 "\\textbf{" "}" "\\mathbf{" "}") (3 "\\Code{" "}") (5 "\\emph{" "}") (6 "\\textsf{" "}" "\\mathsf{" "}") (9 "\\textit{" "}" "\\mathit{" "}") (13 "\\textmd{" "}") (14 "\\textnormal{" "}" "\\mathnormal{" "}") (18 "\\textrm{" "}" "\\mathrm{" "}") (19 "\\textsl{" "}" "\\mathbb{" "}") (20 "\\texttt{" "}" "\\mathtt{" "}") (21 "\\textup{" "}") (4 "" "" t))))
 '(PC-include-file-path (quote ("/usr/include" "/usr/local/include")))
 '(TeX-PDF-mode t)
 '(TeX-auto-save t)
 '(TeX-close-quote ">>")
 '(TeX-open-quote "<<")
 '(TeX-output-view-style (quote (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f") ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f") ("^dvi$" ("^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d") ("^dvi$" "^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "%(o?)xdvi %dS -paper a4 %d") ("^dvi$" ("^\\(?:a5\\(?:comb\\|paper\\)\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d") ("^dvi$" "^\\(?:a5\\(?:comb\\|paper\\)\\)$" "%(o?)xdvi %dS -paper a5 %d") ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d") ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d") ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d") ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d") ("^dvi$" "." "%(o?)xdvi %dS %d") ("^pdf$" "." "kpdf %o") ("^html?$" "." "netscape %o"))))
 '(TeX-parse-self t)
 '(ange-ftp-try-passive-mode t)
 '(auto-compression-mode t nil (jka-compr))
 '(auto-image-file-mode t)
 '(backward-delete-char-untabify-method nil)
 '(browse-url-browser-function (quote w3m-browse-url))
 '(browse-url-generic-args (quote ("-newpage")))
 '(browse-url-generic-program "")
 '(c-basic-offset 4)
 '(c-echo-syntactic-information-p t)
 '(c-electric-pound-behavior (quote (alignleft)))
 '(c-offsets-alist (quote ((topmost-intro-cont . 0) (brace-list-open . 0) (statement-cont . +) (substatement-open . 0) (cpp-macro-cont . +))))
 '(c-tab-always-indent t)
 '(case-fold-search t)
 '(cperl-clobber-lisp-bindings t)
 '(cperl-continued-brace-offset -4)
 '(cperl-continued-statement-offset 4)
 '(cperl-electric-linefeed nil)
 '(cperl-electric-parens nil)
 '(cperl-font-lock t)
 '(cperl-hairy nil)
 '(cperl-highlight-variables-indiscriminately t)
 '(cperl-indent-level 4)
 '(current-language-environment "UTF-8")
 '(debug-on-error t)
 '(default-input-method "russian-computer")
 '(delphi-case-label-indent 4)
 '(delphi-indent-level 4)
 '(dictionary-default-dictionary "jbo->en")
 '(dictionary-server "www.lojban.org")
 '(dired-listing-switches "-al --group-directories-first -v -h")
 '(dired-recursive-copies (quote always))
 '(dired-recursive-deletes (quote top))
 '(dirtrackp t t)
 '(display-time-mode t)
 '(doxymacs-use-external-xml-parser t)
 '(ebs-exclude-buffer-regexps (quote ("^ " "^\\*Messages\\*" "^\\*Buffer List\\*" "^\\*Completions\\*" "^\\*scratch\\*" "^\\*debug.*\\*" "^\\*GNU Emacs\\*" "^\\*Help\\*")))
 '(eldoc-echo-area-use-multiline-p nil)
 '(elscreen-prefix-key "\C-cf")
 '(elscreen-tab-display-control nil)
 '(elscreen-tab-display-kill-screen (quote left))
 '(esense-check-syntax-when-idle 10)
 '(esense-find-function-matching-invocation-pattern t)
 '(esense-indexer-program "~/.emacs.d/site-lisp/esense/esense.sh")
 '(esense-preload-index-information-when-idle 5)
 '(esense-resolve-macros t)
 '(etags-select-go-if-unambiguous t)
 '(explicit-bash-args (quote ("--noediting" "-i")))
 '(flymake-no-changes-timeout 2)
 '(flymake-start-syntax-check-on-find-file t)
 '(flymake-start-syntax-check-on-newline t)
 '(glasses-face "bold")
 '(glasses-separate-parentheses-p nil)
 '(glasses-separator "")
 '(global-font-lock-mode t nil (font-lock))
 '(grep-command "nice grep -nH -e ")
 '(grep-template "nice grep <C> -nH -e <R> <F>")
 '(haskell-program-name "ghci \"+.\"")
 '(icomplete-mode t nil (icomplete))
 '(ido-create-new-buffer (quote always))
 '(ido-max-prospects 10)
 '(ido-mode (quote buffer) nil (ido))
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(locate-command "slocate")
 '(locate-prompt-for-command nil)
 '(locate-update-command "sudo updatedb")
 '(lojban-cmavo-file "~/.emacs.d/site-lisp/lojban/data/cmavo.txt")
 '(lojban-gismu-file "~/.emacs.d/site-lisp/lojban/data/gismu.txt")
 '(lojban-rafsi-file "~/.emacs.d/site-lisp/lojban/data/rafsi.txt")
 '(make-backup-files nil)
 '(matlab-comment-line-s "%% ")
 '(matlab-comment-region-s "%%%")
 '(matlab-indent-function t)
 '(matlab-indent-level 4)
 '(matlab-shell-command-switches "-nodesktop -nosplash")
 '(mouse-wheel-down-button 4 t)
 '(mouse-wheel-follow-mouse t)
 '(mouse-wheel-mode t nil (mwheel))
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (3 ((shift) . 1) ((control)))))
 '(mouse-wheel-up-button 5 t)
 '(multi-term-dedicated-skip-other-window-p t)
 '(octave-auto-indent t)
 '(octave-auto-newline nil)
 '(octave-block-offset 4)
 '(org-startup-folded nil)
 '(partial-completion-mode t nil (complete))
 '(perl-tab-always-indent t)
 '(prolog-consult-string "[user].
")
 '(python-guess-indent t)
 '(read-file-name-completion-ignore-case t)
 '(safe-local-variable-values (quote ((sh-indent-comment . t) (sgml-parent-document "dancer-oper-guide.sgml" "book") (sgml-omittag . t) (sgml-shorttag . t) (sgml-namecase-general . t) (sgml-general-insert-case . lower) (sgml-minimize-attributes) (sgml-always-quote-attributes . t) (sgml-indent-step . 2) (sgml-indent-data . t) (sgml-parent-document "charybdis-oper-guide.sgml" "book") (sgml-exposed-tags) (encoding . utf-8) (Mode . C) (sql-product . postgres) (erlang-indent-level . 4) (visual-line-mode . t) (word-wrap . t) (minor-mode . lojban))))
 '(save-place-file "~/.emacs.d/places")
 '(screenshot-default-scheme "ftp")
 '(screenshot-schemes (quote (("local" :dir "~/pix/") ("current-directory" :dir default-directory) ("remote-ftp" :dir "/tmp/" :ssh-dir "home.twee.cc:/home/ftp/pix/" :url "ftp://home.twee.cc/pix/") ("ftp" :dir "/home/ftp/pix/" :url "ftp://home.twee.cc/pix/"))))
 '(screenshot-take-delay 0.0)
 '(session-undo-check 0)
 '(sh-here-document-word "-EOF")
 '(show-paren-mode t nil (paren))
 '(size-indication-mode t)
 '(split-width-threshold nil)
 '(sql-product (quote mysql))
 '(sql-server "localhost")
 '(sql-user "root")
 '(standard-indent 4)
 '(tab-always-indent t)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 80 88 96 104 104 112)))
 '(tab-width 4)
 '(tags-revert-without-query t)
 '(tex-close-quote ">>")
 '(tex-open-quote "<<")
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(tramp-verbose 4)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(use-dialog-box nil)
 '(user-mail-address "twee@tweedle-dee.org")
 '(vc-svn-global-switches (quote ("--non-interactive")))
 '(w3m-home-page "http://localhost/")
 '(w3m-use-cookies t)
 '(wdired-allow-to-change-permissions t)
 '(wdired-confirm-overwrite nil)
 '(which-function-mode t nil (which-func))
 '(whitespace-line-column 120)
 '(winner-boring-buffers (quote ("*Completions*" "*Buffer List*" "*Apropos*")))
 '(winner-mode t nil (winner))
 '(woman-cache-filename "~/.emacs.d/.wmncach.el")
 '(woman-fill-frame t)
 '(woman-use-own-frame nil)
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
 '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :family "courier"))))
 '(cperl-array-face ((t (:foreground "Blue" :weight bold))))
 '(cperl-hash-face ((((class color) (background light)) (:foreground "Red" :weight bold))))
 '(eldoc-highlight-function-argument ((t (:inherit bold :height 0.95))))
 '(linum ((t (:inherit (shadow default) :background "gray95"))))
 '(woman-addition ((t nil)))
 '(woman-bold ((((min-colors 88) (background light)) (:weight bold))))
 '(woman-italic ((((min-colors 88) (background light)) (:underline t :slant italic))))
 '(woman-unknown ((((background light)) nil))))

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
