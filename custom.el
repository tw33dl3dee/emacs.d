;;; Variables set by Custom are stored here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-fit-frame-flag nil)
 '(LaTeX-font-list
   (quote
    ((1 "" "" "\\mathcal{" "}")
     (2 "\\textbf{" "}" "\\mathbf{" "}")
     (3 "\\Code{" "}")
     (5 "\\emph{" "}")
     (6 "\\textsf{" "}" "\\mathsf{" "}")
     (9 "\\textit{" "}" "\\mathit{" "}")
     (13 "\\textmd{" "}")
     (14 "\\textnormal{" "}" "\\mathnormal{" "}")
     (18 "\\textrm{" "}" "\\mathrm{" "}")
     (19 "\\textsl{" "}" "\\mathbb{" "}")
     (20 "\\texttt{" "}" "\\mathtt{" "}")
     (21 "\\textup{" "}")
     (22 "\\Term{" "}")
     (4 "" "" t))))
 '(LaTeX-verbatim-environments (quote ("verbatim" "verbatim*" "CodeBlock" "lstlisting")))
 '(TeX-PDF-mode t)
 '(TeX-auto-save t)
 '(TeX-close-quote ">>")
 '(TeX-open-quote "<<")
 '(TeX-parse-self t)
 '(ac-auto-show-menu nil)
 '(ange-ftp-try-passive-mode t)
 '(auto-compression-mode t nil (jka-compr))
 '(auto-image-file-mode t)
 '(auto-insert-alist
   (quote
    ((("\\.\\([Hh]\\|hh\\|hpp\\)\\'" . "C / C++ header")
      (upcase
       (concat "_"
               (file-name-nondirectory
                (file-name-sans-extension buffer-file-name))
               "_"
               (file-name-extension buffer-file-name)
               "_"))
      "#ifndef " str n "#define " str "

" _ "

#endif  // " str "
")
     (("\\.\\([Cc]\\|cc\\|cpp\\)\\'" . "C / C++ program")
      nil "#include \""
      (let
          ((stem
            (file-name-sans-extension buffer-file-name)))
        (cond
         ((file-exists-p
           (concat stem ".h"))
          (file-name-nondirectory
           (concat stem ".h")))
         ((file-exists-p
           (concat stem ".hh"))
          (file-name-nondirectory
           (concat stem ".hh")))))
      "\"" _ "
")
     (("[Mm]akefile\\'" . "Makefile")
      . "makefile.inc")
     (html-mode lambda nil
                (sgml-tag "html"))
     (plain-tex-mode . "tex-insert.tex")
     (bibtex-mode . "tex-insert.tex")
     (latex-mode "options, RET: " "\\documentclass[" str & 93 | -1 123
                 (read-string "class: ")
                 "}
"
                 ("package, %s: " "\\usepackage["
                  (read-string "options, RET: ")
                  & 93 | -1 123 str "}
")
                 _ "
\\begin{document}
" _ "
\\end{document}")
     (("/bin/.*[^/]\\'" . "Shell-Script mode magic number")
      lambda nil
      (if
          (eq major-mode
              (default-value
                (quote major-mode)))
          (sh-mode)))
     (ada-mode . ada-header)
     (("\\.[1-9]\\'" . "Man page skeleton")
      "Short description: " ".\\\" Copyright (C), "
      (format-time-string "%Y")
      "  "
      (getenv "ORGANIZATION")
      |
      (progn user-full-name)
      "
.\\\" You may distribute this file under the terms of the GNU Free
.\\\" Documentation License.
.TH "
      (file-name-base)
      " "
      (file-name-extension
       (buffer-file-name))
      " "
      (format-time-string "%Y-%m-%d ")
      "
.SH NAME
"
      (file-name-base)
      " \\- " str "
.SH SYNOPSIS
.B "
      (file-name-base)
      "
" _ "
.SH DESCRIPTION
.SH OPTIONS
.SH FILES
.SH \"SEE ALSO\"
.SH BUGS
.SH AUTHOR
"
      (user-full-name)
      (quote
       (if
           (search-backward "&"
                            (line-beginning-position)
                            t)
           (replace-match
            (capitalize
             (user-login-name))
            t t)))
      (quote
       (end-of-line 1))
      " <"
      (progn user-mail-address)
      ">
")
     (("\\.el\\'" . "Emacs Lisp header")
      "Short description: " ";;; "
      (file-name-nondirectory
       (buffer-file-name))
      " --- " str "

;; Copyright (C) "
      (format-time-string "%Y")
      "  "
      (getenv "ORGANIZATION")
      |
      (progn user-full-name)
      "

;; Author: "
      (user-full-name)
      (quote
       (if
           (search-backward "&"
                            (line-beginning-position)
                            t)
           (replace-match
            (capitalize
             (user-login-name))
            t t)))
      (quote
       (end-of-line 1))
      " <"
      (progn user-mail-address)
      ">
;; Keywords: "
      (quote
       (require
        (quote finder)))
      (quote
       (setq v1
             (mapcar
              (lambda
                (x)
                (list
                 (symbol-name
                  (car x))))
              finder-known-keywords)
             v2
             (mapconcat
              (lambda
                (x)
                (format "%12s:  %s"
                        (car x)
                        (cdr x)))
              finder-known-keywords "
")))
      ((let
           ((minibuffer-help-form v2))
         (completing-read "Keyword, C-h: " v1 nil t))
       str ", ")
      & -2 "

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; " _ "

;;; Code:



(provide '"
      (file-name-base)
      ")
;;; "
      (file-name-nondirectory
       (buffer-file-name))
      " ends here
")
     (("\\.texi\\(nfo\\)?\\'" . "Texinfo file skeleton")
      "Title: " "\\input texinfo   @c -*-texinfo-*-
@c %**start of header
@setfilename "
      (file-name-base)
      ".info
" "@settitle " str "
@c %**end of header
@copying
"
      (setq short-description
            (read-string "Short description: "))
      ".

" "Copyright @copyright{} "
      (format-time-string "%Y")
      "  "
      (getenv "ORGANIZATION")
      |
      (progn user-full-name)
      "

@quotation
Permission is granted to copy, distribute and/or modify this document
under the terms of the GNU Free Documentation License, Version 1.3
or any later version published by the Free Software Foundation;
with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
A copy of the license is included in the section entitled ``GNU
Free Documentation License''.

A copy of the license is also available from the Free Software
Foundation Web site at @url{http://www.gnu.org/licenses/fdl.html}.

@end quotation

The document was typeset with
@uref{http://www.texinfo.org/, GNU Texinfo}.

@end copying

@titlepage
@title " str "
@subtitle " short-description "
@author "
      (getenv "ORGANIZATION")
      |
      (progn user-full-name)
      " <"
      (progn user-mail-address)
      ">
@page
@vskip 0pt plus 1filll
@insertcopying
@end titlepage

@c Output the table of the contents at the beginning.
@contents

@ifnottex
@node Top
@top " str "

@insertcopying
@end ifnottex

@c Generate the nodes for this menu with `C-c C-u C-m'.
@menu
@end menu

@c Update all node entries with `C-c C-u C-n'.
@c Insert new nodes with `C-c C-c n'.
@node Chapter One
@chapter Chapter One

" _ "

@node Copying This Manual
@appendix Copying This Manual

@menu
* GNU Free Documentation License::  License for copying this manual.
@end menu

@c Get fdl.texi from http://www.gnu.org/licenses/fdl.html
@include fdl.texi

@node Index
@unnumbered Index

@printindex cp

@bye

@c "
      (file-name-nondirectory
       (buffer-file-name))
      " ends here
"))))
 '(backward-delete-char-untabify-method nil)
 '(bookmark-default-file "~/.emacs.d/bookmarks")
 '(bookmark-save-flag 1)
 '(browse-url-browser-function (quote w3m-browse-url))
 '(browse-url-generic-args (quote ("-newpage")))
 '(browse-url-generic-program "")
 '(c-basic-offset 2)
'(c-default-style
(quote
 ((c++-mode . "stroustrup")
  (java-mode . "java")
  (awk-mode . "awk")
  (other . "gnu"))))
 '(c-echo-syntactic-information-p t)
 '(c-electric-pound-behavior (quote (alignleft)))
'(c-offsets-alist
(quote
 ((topmost-intro-cont . align-enum-class)
  (member-init-intro . ++)
  (brace-list-open . 0)
  (statement-cont . align-enum-class-closing-brace)
  (substatement-open . 0)
  (case-label . +)
  (access-label . /)
  (label . /)
  (arglist-intro . 4)
  (cpp-macro-cont . +)
  (innamespace . 0))))
 '(c-tab-always-indent t)
 '(case-fold-search t)
 '(company-idle-delay 0)
 '(cperl-clobber-lisp-bindings t)
 '(cperl-continued-brace-offset -4)
 '(cperl-continued-statement-offset 4)
 '(cperl-electric-linefeed nil)
 '(cperl-electric-parens nil)
 '(cperl-font-lock t)
 '(cperl-hairy nil)
 '(cperl-highlight-variables-indiscriminately t)
 '(cperl-indent-level 2)
 '(cua-enable-cua-keys nil)
 '(cua-enable-modeline-indications t)
 '(cua-highlight-region-shift-only nil)
 '(cua-mode t nil (cua-base))
 '(cua-rectangle-mark-key [67108903])
 '(cua-toggle-set-mark t)
 '(current-language-environment "UTF-8")
 '(debug-on-error t)
 '(default-input-method "russian-computer")
 '(delphi-case-label-indent 2)
 '(delphi-indent-level 2)
 '(dictionary-default-dictionary "jbo->en")
 '(dictionary-server "www.lojban.org")
 '(dired-listing-switches "-alvh")
 '(dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\.")
 '(dired-recursive-copies (quote always))
 '(dired-recursive-deletes (quote top))
 '(dirtrackp t t)
 '(display-time-mode t)
 '(doxymacs-use-external-xml-parser t)
'(ebs-exclude-buffer-regexps
(quote
 ("^ " "^\\*Messages\\*" "^\\*Buffer List\\*" "^\\*Completions\\*" "^\\*scratch\\*" "^\\*debug.*\\*" "^\\*GNU Emacs\\*" "^\\*Help\\*" "-preprocessed\\*$")))
 '(eldoc-echo-area-use-multiline-p nil)
 '(elscreen-buffer-list-enabled t)
 '(elscreen-display-screen-number nil)
 '(elscreen-prefix-key "f")
 '(elscreen-startup-command-line-processing nil)
 '(elscreen-tab-display-control nil)
 '(elscreen-tab-display-kill-screen (quote left))
 '(esense-check-syntax-when-idle 10)
 '(esense-find-function-matching-invocation-pattern t)
 '(esense-indexer-program "~/.emacs.d/site-lisp/esense/esense.sh")
 '(esense-preload-index-information-when-idle 5)
 '(esense-resolve-macros t)
 '(etags-select-go-if-unambiguous t)
 '(explicit-bash-args (quote ("--noediting" "-i")))
 '(fic-highlighted-words (quote ("FIXME" "TODO" "BUG" "HACK")))
 '(fill-column 80)
 '(flycheck-checkers (quote (ycmd)))
 '(flyspell-default-dictionary "american")
 '(font-latex-match-bold-command-keywords (quote (("Code" "bold-command") ("Term" "italic-command"))))
 '(glasses-face "bold")
 '(glasses-separate-parentheses-p nil)
 '(glasses-separator "")
 '(global-auto-revert-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(grep-command "nice grep -nH -e ")
 '(grep-template "nice grep <C> -nH -e <R> <F>")
 '(haskell-program-name "ghci \"+.\"")
 '(ibuffer-movement-cycle nil)
 '(ibuffer-show-empty-filter-groups nil)
 '(ibuffer-use-header-line nil)
 '(ibuffer-use-other-window t)
 '(icomplete-mode t nil (icomplete))
 '(ido-create-new-buffer (quote always))
 '(ido-max-prospects 10)
 '(ido-mode (quote buffer) nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(ispell-dictionary "american")
 '(ispell-program-name "/usr/bin/ispell")
 '(js2-mirror-mode nil)
 '(locate-command "locate")
 '(locate-prompt-for-command nil)
 '(locate-update-command "sudo updatedb")
 '(lojban-cmavo-file "~/.emacs.d/site-lisp/lojban/data/cmavo.txt")
 '(lojban-gismu-file "~/.emacs.d/site-lisp/lojban/data/gismu.txt")
 '(lojban-rafsi-file "~/.emacs.d/site-lisp/lojban/data/rafsi.txt")
 '(make-backup-files nil)
 '(matlab-comment-line-s "%% ")
 '(matlab-comment-region-s "%%%")
 '(matlab-indent-function t)
 '(matlab-indent-level 2)
 '(matlab-shell-command-switches "-nodesktop -nosplash")
 '(menu-bar-mode nil)
 '(mouse-wheel-down-button 4 t)
 '(mouse-wheel-follow-mouse t)
 '(mouse-wheel-mode t nil (mwheel))
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (3 ((shift) . 1) ((control)))))
 '(mouse-wheel-up-button 5 t)
 '(multi-term-dedicated-skip-other-window-p t)
 '(octave-auto-indent t)
 '(octave-auto-newline nil)
 '(octave-block-offset 2)
 '(org-clock-in-resume t)
 '(org-clock-persist t)
 '(org-enforce-todo-dependencies t)
 '(org-log-done (quote time))
 '(org-log-note-clock-out nil)
 '(org-startup-folded (quote content))
 '(org-tags-column -80)
 '(parens-require-spaces nil)
 '(partial-completion-mode t)
 '(pastebin-default-domain "pastebin.com")
 '(perl-tab-always-indent t)
 '(popwin:special-display-config (quote (("*Help*") ("*Completions*" :noselect t))))
 '(prolog-consult-string "[user].
")
 '(python-guess-indent t)
 '(python-indent 2)
 '(read-file-name-completion-ignore-case t)
'(safe-local-variable-values
(quote
 ((goal-column . 120)
  (erlang-indent-level . 2)
  (buffer-file-coding-system . koi8-r-unix)
  (buffer-file-coding-system . utf-8-unix)
  (sgml-indent-step . 4)
  (folded-file . t)
  (prompt-to-byte-compile)
  (sh-indent-comment . t)
  (sgml-parent-document "dancer-oper-guide.sgml" "book")
  (sgml-omittag . t)
  (sgml-shorttag . t)
  (sgml-namecase-general . t)
  (sgml-general-insert-case . lower)
  (sgml-minimize-attributes)
  (sgml-always-quote-attributes . t)
  (sgml-indent-step . 2)
  (sgml-indent-data . t)
  (sgml-parent-document "charybdis-oper-guide.sgml" "book")
  (sgml-exposed-tags)
  (encoding . utf-8)
  (Mode . C)
  (sql-product . postgres)
  (erlang-indent-level . 4)
  (visual-line-mode . t)
  (word-wrap . t)
  (minor-mode . lojban))))
 '(save-place-file "~/.emacs.d/places")
 '(screenshot-default-scheme "remote-ftp" t)
'(screenshot-schemes
(quote
 (("local" :dir "~/pix/")
  ("remote-ftp" :dir "/tmp/" :ssh-dir "mordor:/home/ftp/pix/" :url "ftp://home.twee.cc/pix/")
  ("ftp" :dir "/home/ftp/pix/" :url "ftp://home.twee.cc/pix/"))))
 '(screenshot-take-delay 0.0)
 '(scroll-bar-mode nil)
 '(scroll-preserve-screen-position t)
 '(scss-compile-at-save nil)
 '(select-enable-clipboard t)
 '(session-save-file "~/.emacs.d/.session")
 '(session-undo-check 0)
 '(sh-here-document-word "-EOF")
 '(show-paren-mode t nil (paren))
 '(size-indication-mode t)
 '(split-width-threshold nil)
 '(sql-product (quote mysql))
 '(sql-server "localhost")
 '(sql-user "root")
 '(standard-indent 2)
 '(tab-always-indent t)
'(tab-stop-list
(quote
 (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 80 88 96 104 104 112)))
 '(tab-width 4)
 '(tags-revert-without-query t)
 '(tex-close-quote ">>")
 '(tex-open-quote "<<")
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(tramp-default-proxies-alist (quote (("vps" "root" "/ssh:%h:"))))
 '(tramp-verbose 4)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
 '(use-dialog-box nil)
 '(user-mail-address "tw33dl3.dee@gmail.com")
 '(vc-svn-global-switches (quote ("--non-interactive")))
 '(w3m-home-page "http://localhost/")
 '(w3m-use-cookies t)
 '(warning-suppress-types (quote ((initialization bytecomp))))
 '(wdired-allow-to-change-permissions t)
 '(wdired-confirm-overwrite nil)
 '(which-function-mode t nil (which-func))
 '(whitespace-line-column 120)
 '(winner-boring-buffers (quote ("*Completions*" "*Buffer List*" "*Apropos*")))
 '(winner-mode t nil (winner))
 '(woman-cache-filename "~/.emacs.d/.wmncach.el")
 '(woman-fill-frame t)
 '(woman-use-own-frame nil)
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
 '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :family "monospace"))))
 '(cperl-array-face ((t (:foreground "Blue" :weight bold))))
 '(cperl-hash-face ((((class color) (background light)) (:foreground "Red" :weight bold))))
 '(eldoc-highlight-function-argument ((t (:inherit bold :height 0.95))))
 '(elscreen-tab-current-screen-face ((((class color)) (:background "Gray90" :foreground "black"))))
 '(elscreen-tab-other-screen-face ((((type x w32 mac) (class color)) (:background "Gray80" :foreground "Gray40"))))
 '(linum ((t (:inherit (shadow default) :background "gray95"))))
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background light)) (:background "white"))))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background light)) (:background "#f0f0f0"))))
 '(mumamo-background-chunk-submode2 ((((class color) (min-colors 88) (background light)) (:background "white"))))
 '(mumamo-background-chunk-submode3 ((((class color) (min-colors 88) (background light)) (:background "white"))))
 '(mumamo-background-chunk-submode4 ((((class color) (min-colors 88) (background light)) (:background "white"))))
 '(mumamo-border-face-in ((t (:inherit font-lock-preprocessor-face :underline nil :slant normal :weight normal))))
 '(mumamo-border-face-out ((t (:inherit font-lock-preprocessor-face :underline nil :slant normal :weight normal))))
 '(woman-addition ((t nil)))
 '(woman-bold ((((min-colors 88) (background light)) (:weight bold))))
 '(woman-italic ((((min-colors 88) (background light)) (:underline t :slant italic))))
 '(woman-unknown ((((background light)) nil))))
