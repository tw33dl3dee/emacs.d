;;; ibuffer buffer grouping

(require 'ibuffer)

(setq ibuffer-saved-filter-groups
      '(("default"
	 ("Programming" 
	  (or
	   (mode . actionscript-mode)
	   (mode . ada-mode)
	   (mode . asm-mode)
	   (mode . autoconf-mode)
	   (mode . cmake-mode)
	   (mode . c-mode)
	   (mode . c++-mode)
	   (mode . cobol-mode)
	   (mode . cperl-mode)
	   (mode . csharp-mode)
	   (mode . css-mode)
	   (mode . delphi-mode)
	   (mode . eiffel-mode)
	   (mode . emacs-lisp-mode)
	   (mode . erlang-mode)
	   (mode . espresso-mode)
	   (mode . fortran-mode)
	   (mode . glsl-mode)
	   (mode . gnuplot-mode)
	   (mode . graphviz-dot-mode)
	   (mode . haskell-mode)
	   (mode . html-mode)
	   (mode . idl-mode)
	   (mode . java-mode)
	   (mode . js2-mode)
	   (mode . jython-mode)
	   (mode . lisp-mode)
	   (mode . lua-mode)
	   (mode . makefile-mode)
	   (mode . makefile-automake-mode)
	   (mode . makefile-gmake-mode)
	   (mode . makefile-makepp-mode)
	   (mode . makefile-bsdmake-mode)
	   (mode . makefile-imake-mode)
	   (mode . matlab-mode)
	   (mode . oberon-mode)
	   (mode . objc-mode)
	   (mode . ocaml-mode)
	   (mode . octave-mode)
	   (mode . pascal-mode)
	   (mode . perl-mode)
	   (mode . php-mode)
	   (mode . plsql-mode)
	   (mode . po-mode)
	   (mode . prolog-mode)
	   (mode . python-2-mode)
	   (mode . python-3-mode)
	   (mode . python-basic-mode)
	   (mode . python-mode)
	   (mode . ruby-mode)
	   (mode . scheme-mode)
	   (mode . sh-mode)
	   (mode . smalltalk-mode)
	   (mode . sql-mode)
	   (mode . tcl-mode)))
	 ("LaTeX"
	  (or
	   (mode . bibtex-mode)
	   (mode . latex-mode)))
	 ("VC"
	  (or
	   (mode . vc-dir-mode)
	   (name . "^\\*vc.*\\*$")))
	 ("Shell"
	  (or
	   (mode . erlang-shell-mode)
	   (mode . inferior-haskell-mode)
	   (mode . inferior-octave-mode)
	   (mode . inferior-python-mode) 
	   (mode . inferior-ruby-mode)
	   (mode . shell-mode)))	 
	 ("Configs" 
	  (or
	   (mode . conf-colon-mode)
	   (mode . conf-javaprop-mode)
	   (mode . conf-mode)
	   (mode . conf-mode)
	   (mode . conf-space-mode)
	   (mode . conf-unix-mode)
	   (mode . conf-windows-mode)
	   (mode . Custom-mode)
	   (mode . nxml-mode)
	   (mode . xml-mode)
	   (mode . yaml-mode)))
	 ("Gentoo" 
	  (or
	   (filename . "/etc/portage")
	   (mode . ebuild-mode)
	   (mode . eselect-mode)))
	 ("Output log"
	  (or
	   (name . "^\\*.* output\\*$")
	   (mode . compilation-mode)
	   (mode . grep-mode)))
	 ("Dired" 
	  (mode . dired-mode))	 
	 ("Help"
	  (or
	   (mode . Man-mode)
	   (mode . woman-mode)
	   (name . "^\\*Help\\*$")))
	 ("TASKS"
	  (mode . org-mode))
	 ("Mail"
	  (or
	   (mode . bbdb-mode)
	   (mode . gnus-article-mode)
	   (mode . gnus-group-mode)
	   (mode . gnus-summary-mode)
	   (mode . mail-mode)
	   (mode . message-mode)
	   (name . "^\\.bbdb$")
	   (name . "^\\.newsrc-dribble")))
	 ("IRC" 
	  (mode . erc-mode))
	 ("Internal" 
	  (or
	   (mode . completion-list-mode)
	   (name . "^\\*Buffer List\\*$")
	   (name . "^\\*Ibuffer\\*$")
	   (name . "^\\*Messages\\*$")
	   (name . "^\\*scratch\\*$"))))))

(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-switch-to-saved-filter-groups "default")))

(defun ibuffer-and-jump-to-last ()
  "Open Ibuffer buffer and jump to most recent buffer"
  (interactive)
  (let ((last-buf (buffer-name)))
    (ibuffer)
    (ibuffer-jump-to-buffer last-buf)))

(defadvice ibuffer-update (around ibuffer-preserve-prev-header activate)
  "Preserve line-header used before Ibuffer if it doesn't set one"
  (let ((prev-line-header header-line-format))
    ad-do-it
    (unless header-line-format
      (setq header-line-format prev-line-header))))
