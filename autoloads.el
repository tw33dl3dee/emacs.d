;;; autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (autoconf-mode) "autoconf-mode" "site-lisp/autoconf-mode/autoconf-mode.el"
;;;;;;  (19318 42079))
;;; Generated autoloads from site-lisp/autoconf-mode/autoconf-mode.el

(autoload 'autoconf-mode "autoconf-mode" "\
A major-mode to edit Autoconf files like configure.ac.
\\{autoconf-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (autotest-mode) "autotest-mode" "site-lisp/autoconf-mode/autotest-mode.el"
;;;;;;  (19318 42079))
;;; Generated autoloads from site-lisp/autoconf-mode/autotest-mode.el

(autoload 'autotest-mode "autotest-mode" "\
A major-mode to edit Autotest files like testsuite.at.
\\{autotest-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (cflow-mode) "cflow-mode" "site-lisp/cflow-mode.el"
;;;;;;  (19230 40475))
;;; Generated autoloads from site-lisp/cflow-mode.el

(autoload 'cflow-mode "cflow-mode" "\
Major mode for viewing cflow output files

Key bindings are:
\\{cflow-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (desktop-entry-mode) "desktop-entry-mode" "site-lisp/desktop-entry-mode.el"
;;;;;;  (19318 30384))
;;; Generated autoloads from site-lisp/desktop-entry-mode.el

(autoload 'desktop-entry-mode "desktop-entry-mode" "\
Major mode for editing freedesktop.org desktop entry files.
See <http://www.freedesktop.org/Standards/desktop-entry-spec> for more
information.  See `desktop-entry-mode-version' for information about which
version of the specification this mode is up to date with.

Turning on desktop entry mode calls the value of the variable
`desktop-entry-mode-hook' with no args, if that value is non-nil.

\(fn)" t nil)
(add-to-list 'auto-mode-alist '("\\.desktop\\(\\.in\\)?$" . desktop-entry-mode))

;;;***

;;;### (autoloads (dict) "dict-web" "site-lisp/dict-web.el" (18982
;;;;;;  62036))
;;; Generated autoloads from site-lisp/dict-web.el

(autoload 'dict "dict-web" "\
Lookup a word or phrase in the Online Dictionary Database.

\(fn WORD)" t nil)

;;;***

;;;### (autoloads nil "doxymacs" "site-lisp/doxymacs.el" (19236 6510))
;;; Generated autoloads from site-lisp/doxymacs.el

(or (assoc 'doxymacs-mode minor-mode-alist) (setq minor-mode-alist (cons '(doxymacs-mode " doxy") minor-mode-alist)))

;;;***

;;;### (autoloads (espresso-mode) "espresso" "site-lisp/espresso.el"
;;;;;;  (19212 9280))
;;; Generated autoloads from site-lisp/espresso.el

(autoload 'espresso-mode "espresso" "\
Major mode for editing JavaScript source text.

Key bindings:

\\{espresso-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (etags-select-find-tag etags-select-find-tag-at-point
;;;;;;  etags-select-go-if-unambiguous etags-select-use-short-name-completion
;;;;;;  etags-select-highlight-delay etags-select-highlight-tag-after-jump
;;;;;;  etags-select-mode-hook etags-select-no-select-for-one-match
;;;;;;  etags-select-mode) "etags-select" "site-lisp/etags-select.el"
;;;;;;  (18915 21676))
;;; Generated autoloads from site-lisp/etags-select.el

(let ((loads (get 'etags-select-mode 'custom-loads))) (if (member '"etags-select" loads) nil (put 'etags-select-mode 'custom-loads (cons '"etags-select" loads))))

(defvar etags-select-no-select-for-one-match t "\
*If non-nil, don't open the selection window if there is only one
matching tag.")

(custom-autoload 'etags-select-no-select-for-one-match "etags-select" t)

(defvar etags-select-mode-hook nil "\
*List of functions to call on entry to etags-select-mode mode.")

(custom-autoload 'etags-select-mode-hook "etags-select" t)

(defvar etags-select-highlight-tag-after-jump t "\
*If non-nil, temporarily highlight the tag after you jump to it.")

(custom-autoload 'etags-select-highlight-tag-after-jump "etags-select" t)

(defvar etags-select-highlight-delay 1.0 "\
*How long to highlight the tag.")

(custom-autoload 'etags-select-highlight-delay "etags-select" t)

(defface etags-select-highlight-tag-face '((t (:foreground "white" :background "cadetblue4" :bold t))) "\
Font Lock mode face used to highlight tags." :group (quote etags-select-mode))

(defvar etags-select-use-short-name-completion nil "\
*Use short tag names during completion.  For example, say you
have a function named foobar in several classes and you invoke
`etags-select-find-tag'.  If this variable is nil, you would have
to type ClassA::foo<TAB> to start completion.  Since avoiding
knowing which class a function is in is the basic idea of this
package, if you set this to t you can just type foo<TAB>.

Only works with GNU Emacs.")

(custom-autoload 'etags-select-use-short-name-completion "etags-select" t)

(defvar etags-select-go-if-unambiguous nil "\
*If non-nil, jump by tag number if it is unambiguous.")

(custom-autoload 'etags-select-go-if-unambiguous "etags-select" t)

(autoload 'etags-select-find-tag-at-point "etags-select" "\
Do a find-tag-at-point, and display all exact matches.  If only one match is
found, see the `etags-select-no-select-for-one-match' variable to decide what
to do.

\(fn)" t nil)

(autoload 'etags-select-find-tag "etags-select" "\
Do a find-tag, and display all exact matches.  If only one match is
found, see the `etags-select-no-select-for-one-match' variable to decide what
to do.

\(fn)" t nil)

;;;***

;;;### (autoloads (etags-table-search-up-depth etags-table-alist
;;;;;;  etags-table) "etags-table" "site-lisp/etags-table.el" (18915
;;;;;;  21212))
;;; Generated autoloads from site-lisp/etags-table.el

(let ((loads (get 'etags-table 'custom-loads))) (if (member '"etags-table" loads) nil (put 'etags-table 'custom-loads (cons '"etags-table" loads))))

(defvar etags-table-alist nil "\
*Map filename to tag file(s)

Example:

\(setq etags-table-alist
      (list
       '(\"/home/me/Projects/foo/.*\\\\.[ch]$\" \"/home/me/Projects/lib1/TAGS\" \"/home/me/Projects/lib2/TAGS\")
       '(\"/home/me/Projects/bar/.*\\\\.py$\" \"/home/me/Projects/python/common/TAGS\")
       '(\".*\\\\.[ch]$\" \"/usr/local/include/TAGS\")
       ))

A file named, for example, \"/home/me/Projects/foo/main.c\" would set the
`tags-table-list' to a list of:

\"/home/me/Projects/lib1/TAGS\"
\"/home/me/Projects/lib2/TAGS\"
\"/usr/local/include/TAGS\"

and possibly a local tags file at the head of the list if `etags-table-search-up-depth'
is non-nil.  You can use \\&, \\1, etc. in the tag file names to substitute pieces
captured with \\(\\) in the key.
")

(custom-autoload 'etags-table-alist "etags-table" t)

(defvar etags-table-search-up-depth nil "\
*Max depth to search up for a tags file.  nil means don't search.")

(custom-autoload 'etags-table-search-up-depth "etags-table" t)

;;;***

;;;### (autoloads (ffap-perl-module-path) "ffap-perl-module" "site-lisp/ffap-perl-module.el"
;;;;;;  (19209 24163))
;;; Generated autoloads from site-lisp/ffap-perl-module.el

(defvar ffap-perl-module-path nil "\
List of directories to search for perl modules.
If nil then function `ffap-perl-module-path' initializes it from
Perl's @INC when you first attempt an `ffap' perl module lookup.")

(custom-autoload 'ffap-perl-module-path "ffap-perl-module" t)

;;;***

;;;### (autoloads (find-file-in-project) "find-file-in-project" "site-lisp/find-file-in-project.el"
;;;;;;  (19242 38718))
;;; Generated autoloads from site-lisp/find-file-in-project.el

(autoload 'find-file-in-project "find-file-in-project" "\
Prompt with a completing list of all files in the project to find one.

The project's scope is defined as the first directory containing
an `.emacs-project' file. You can override this by locally
setting the `ffip-project-root' variable.

\(fn)" t nil)

;;;***

;;;### (autoloads (ebuild-run-command gentoo-newsitem-mode eselect-mode
;;;;;;  ebuild-mode) "gentoo-syntax" "site-lisp/gentoo-syntax/gentoo-syntax.el"
;;;;;;  (19338 22996))
;;; Generated autoloads from site-lisp/gentoo-syntax/gentoo-syntax.el

(autoload 'ebuild-mode "gentoo-syntax" "\
Major mode for Portage .ebuild and .eclass files.

\(fn)" t nil)

(autoload 'eselect-mode "gentoo-syntax" "\
Major mode for .eselect files.

\(fn)" t nil)

(autoload 'gentoo-newsitem-mode "gentoo-syntax" "\
Major mode for Gentoo GLEP 42 news items.

\(fn)" t nil)

(autoload 'ebuild-run-command "gentoo-syntax" "\
Run ebuild COMMAND, with output to a compilation buffer.

\(fn COMMAND)" t nil)

(add-to-list 'auto-mode-alist '("\\.\\(ebuild\\|eclass\\|eblit\\)\\'" . ebuild-mode))

(add-to-list 'auto-mode-alist '("\\.eselect\\'" . eselect-mode))

(add-to-list 'auto-mode-alist '("/[0-9]\\{4\\}-[01][0-9]-[0-3][0-9]-.+\\.[a-z]\\{2\\}\\.txt\\'" . gentoo-newsitem-mode))

(add-to-list 'interpreter-mode-alist '("runscript" . sh-mode))

;;;***

;;;### (autoloads (graphviz-dot-mode) "graphviz-dot-mode" "site-lisp/graphviz-dot-mode.el"
;;;;;;  (19347 45194))
;;; Generated autoloads from site-lisp/graphviz-dot-mode.el

(autoload 'graphviz-dot-mode "graphviz-dot-mode" "\
Major mode for the dot language. \\<graphviz-dot-mode-map> 
TAB indents for graph lines. 

\\[graphviz-dot-indent-graph]	- Indentaion function.
\\[graphviz-dot-preview]	- Previews graph in a buffer.
\\[graphviz-dot-view]	- Views graph in an external viewer.
\\[graphviz-dot-indent-line]	- Indents current line of code.
\\[graphviz-dot-complete-word]	- Completes the current word.
\\[electric-graphviz-dot-terminate-line]	- Electric newline.
\\[electric-graphviz-dot-open-brace]	- Electric open braces.
\\[electric-graphviz-dot-close-brace]	- Electric close braces.
\\[electric-graphviz-dot-semi]	- Electric semi colons.

Variables specific to this mode:

  graphviz-dot-dot-program            (default `dot')
       Location of the dot program.
  graphviz-dot-view-command           (default `doted %s')
       Command to run when `graphviz-dot-view' is executed.
  graphviz-dot-view-edit-command      (default nil)
       If the user should be asked to edit the view command.
  graphviz-dot-save-before-view       (default t)
       Automatically save current buffer berore `graphviz-dot-view'.
  graphviz-dot-preview-extension      (default `png')
       File type to use for `graphviz-dot-preview'.
  graphviz-dot-auto-indent-on-newline (default t)
       Whether to run `electric-graphviz-dot-terminate-line' when 
       newline is entered.
  graphviz-dot-auto-indent-on-braces (default t)
       Whether to run `electric-graphviz-dot-open-brace' and
       `electric-graphviz-dot-close-brace' when braces are 
       entered.
  graphviz-dot-auto-indent-on-semi (default t)
       Whether to run `electric-graphviz-dot-semi' when semi colon
       is typed.
  graphviz-dot-toggle-completions  (default nil)
       If completions should be displayed in the buffer instead of a
       completion buffer when \\[graphviz-dot-complete-word] is
       pressed repeatedly.

This mode can be customized by running \\[graphviz-dot-customize].

Turning on Graphviz Dot mode calls the value of the variable 
`graphviz-dot-mode-hook' with no args, if that value is non-nil.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-c-mode) "haskell-c" "site-lisp/haskell/haskell-c.el"
;;;;;;  (19288 57620))
;;; Generated autoloads from site-lisp/haskell/haskell-c.el

(add-to-list 'auto-mode-alist '("\\.hsc\\'" . haskell-c-mode))

(autoload 'haskell-c-mode "haskell-c" "\
Major mode for Haskell FFI files.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-cabal-mode) "haskell-cabal" "site-lisp/haskell/haskell-cabal.el"
;;;;;;  (19288 57620))
;;; Generated autoloads from site-lisp/haskell/haskell-cabal.el

(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

(autoload 'haskell-cabal-mode "haskell-cabal" "\
Major mode for Cabal package description files.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-decl-scan-mode) "haskell-decl-scan" "site-lisp/haskell/haskell-decl-scan.el"
;;;;;;  (19288 57620))
;;; Generated autoloads from site-lisp/haskell/haskell-decl-scan.el

(autoload 'haskell-decl-scan-mode "haskell-decl-scan" "\
Minor mode for declaration scanning for Haskell mode.
Top-level declarations are scanned and listed in the menu item \"Declarations\".
Selecting an item from this menu will take point to the start of the
declaration.

\\[haskell-ds-forward-decl] and \\[haskell-ds-backward-decl] move forward and backward to the start of a declaration.

Under XEmacs, the following keys are also defined:

\\[fume-list-functions] lists the declarations of the current buffer,
\\[fume-prompt-function-goto] prompts for a declaration to move to, and
\\[fume-mouse-function-goto] moves to the declaration whose name is at point.

This may link with `haskell-doc' (only for Emacs currently).

For non-literate and LaTeX-style literate scripts, we assume the
common convention that top-level declarations start at the first
column.  For Bird-style literate scripts, we assume the common
convention that top-level declarations start at the third column,
ie. after \"> \".

Anything in `font-lock-comment-face' is not considered for a
declaration.  Therefore, using Haskell font locking with comments
coloured in `font-lock-comment-face' improves declaration scanning.

To turn on declaration scanning for all Haskell buffers, add this to
.emacs:

  (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)

To turn declaration scanning on for the current buffer, call
`turn-on-haskell-decl-scan'.

Literate Haskell scripts are supported: If the value of
`haskell-literate' (automatically set by the Haskell mode of
Moss&Thorn) is `bird', a Bird-style literate script is assumed.  If it
is nil or `tex', a non-literate or LaTeX-style literate script is
assumed, respectively.

Invokes `haskell-decl-scan-mode-hook'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (haskell-doc-show-type haskell-doc-mode) "haskell-doc"
;;;;;;  "site-lisp/haskell/haskell-doc.el" (19288 57620))
;;; Generated autoloads from site-lisp/haskell/haskell-doc.el

(autoload 'haskell-doc-mode "haskell-doc" "\
Enter `haskell-doc-mode' for showing fct types in the echo area.
See variable docstring.

\(fn &optional ARG)" t nil)

(defalias 'turn-on-haskell-doc-mode 'haskell-doc-mode)

(autoload 'haskell-doc-show-type "haskell-doc" "\
Show the type of the function near point.
For the function under point, show the type in the echo area.
This information is extracted from the `haskell-doc-prelude-types' alist
of prelude functions and their types, or from the local functions in the
current buffer.

\(fn &optional SYM)" t nil)

;;;***

;;;### (autoloads (haskell-indent-mode) "haskell-indent" "site-lisp/haskell/haskell-indent.el"
;;;;;;  (19288 57620))
;;; Generated autoloads from site-lisp/haskell/haskell-indent.el

(autoload 'haskell-indent-mode "haskell-indent" "\
``Intelligent'' Haskell indentation mode.
This deals with the layout rule of Haskell.
\\[haskell-indent-cycle] starts the cycle which proposes new
possibilities as long as the TAB key is pressed.  Any other key
or mouse click terminates the cycle and is interpreted except for
RET which merely exits the cycle.
Other special keys are:
    \\[haskell-indent-insert-equal]
      inserts an =
    \\[haskell-indent-insert-guard]
      inserts an |
    \\[haskell-indent-insert-otherwise]
      inserts an | otherwise =
these functions also align the guards and rhs of the current definition
    \\[haskell-indent-insert-where]
      inserts a where keyword
    \\[haskell-indent-align-guards-and-rhs]
      aligns the guards and rhs of the region
    \\[haskell-indent-put-region-in-literate]
      makes the region a piece of literate code in a literate script

Invokes `haskell-indent-hook' if not nil.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (haskell-indentation-mode) "haskell-indentation"
;;;;;;  "site-lisp/haskell/haskell-indentation.el" (19288 57620))
;;; Generated autoloads from site-lisp/haskell/haskell-indentation.el

(autoload 'haskell-indentation-mode "haskell-indentation" "\
Haskell indentation mode that deals with the layout rule.
It rebinds RET, DEL and BACKSPACE, so that indentations can be
set and deleted as if they were real tabs.  It supports
autofill-mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (haskell-hayoo haskell-hoogle literate-haskell-mode
;;;;;;  haskell-mode) "haskell-mode" "site-lisp/haskell/haskell-mode.el"
;;;;;;  (19288 57620))
;;; Generated autoloads from site-lisp/haskell/haskell-mode.el

(add-to-list 'load-path (or (file-name-directory load-file-name) (car load-path)))

(autoload 'haskell-mode "haskell-mode" "\
Major mode for editing Haskell programs.
Blank lines separate paragraphs, comments start with `-- '.
\\<haskell-mode-map>
Literate scripts are supported via `literate-haskell-mode'.
The variable `haskell-literate' indicates the style of the script in the
current buffer.  See the documentation on this variable for more details.

Modules can hook in via `haskell-mode-hook'.  The following modules
are supported with an `autoload' command:

   `haskell-decl-scan', Graeme E Moss
     Scans top-level declarations, and places them in a menu.

   `haskell-doc', Hans-Wolfgang Loidl
     Echoes types of functions or syntax of keywords when the cursor is idle.

   `haskell-indentation', Kristof Bastiaensen
     Intelligent semi-automatic indentation Mk2

   `haskell-indent', Guy Lapalme
     Intelligent semi-automatic indentation.

   `haskell-simple-indent', Graeme E Moss and Heribert Schuetz
     Simple indentation.

Module X is activated using the command `turn-on-X'.  For example,
`haskell-indent' is activated using `turn-on-haskell-indent'.
For more information on a module, see the help for its `X-mode'
function.  Some modules can be deactivated using `turn-off-X'.  (Note
that `haskell-doc' is irregular in using `turn-(on/off)-haskell-doc-mode'.)

Use `haskell-version' to find out what version this is.

Invokes `haskell-mode-hook'.

\(fn)" t nil)

(autoload 'literate-haskell-mode "haskell-mode" "\
As `haskell-mode' but for literate scripts.

\(fn)" t nil)
(add-to-list 'auto-mode-alist '("\\.\\(?:[gh]s\\|hi\\)\\'" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.l[gh]s\\'" . literate-haskell-mode))

(autoload 'haskell-hoogle "haskell-mode" "\
Do a Hoogle search for QUERY.

\(fn QUERY)" t nil)

(defalias 'hoogle 'haskell-hoogle)

(autoload 'haskell-hayoo "haskell-mode" "\
Do a Hayoo search for QUERY.

\(fn QUERY)" t nil)

(defalias 'hayoo 'haskell-hayoo)

;;;***

;;;### (autoloads (inferior-haskell-find-haddock inferior-haskell-find-definition
;;;;;;  inferior-haskell-info inferior-haskell-type inferior-haskell-load-file
;;;;;;  switch-to-haskell) "inf-haskell" "site-lisp/haskell/inf-haskell.el"
;;;;;;  (19288 57620))
;;; Generated autoloads from site-lisp/haskell/inf-haskell.el

(defalias 'run-haskell 'switch-to-haskell)

(autoload 'switch-to-haskell "inf-haskell" "\
Show the inferior-haskell buffer.  Start the process if needed.

\(fn &optional ARG)" t nil)

(autoload 'inferior-haskell-load-file "inf-haskell" "\
Pass the current buffer's file to the inferior haskell process.
If prefix arg \\[universal-argument] is given, just reload the previous file.

\(fn &optional RELOAD)" t nil)

(autoload 'inferior-haskell-type "inf-haskell" "\
Query the haskell process for the type of the given expression.
If optional argument `insert-value' is non-nil, insert the type above point
in the buffer.  This can be done interactively with the \\[universal-argument] prefix.
The returned info is cached for reuse by `haskell-doc-mode'.

\(fn EXPR &optional INSERT-VALUE)" t nil)

(autoload 'inferior-haskell-info "inf-haskell" "\
Query the haskell process for the info of the given expression.

\(fn SYM)" t nil)

(autoload 'inferior-haskell-find-definition "inf-haskell" "\
Attempt to locate and jump to the definition of the given expression.

\(fn SYM)" t nil)

(autoload 'inferior-haskell-find-haddock "inf-haskell" "\
Find and open the Haddock documentation of SYM.
Make sure to load the file into GHCi or Hugs first by using C-c C-l.
Only works for functions in a package installed with ghc-pkg, or
whatever the value of `haskell-package-manager-name' is.

This function needs to find which package a given module belongs
to.  In order to do this, it computes a module-to-package lookup
alist, which is expensive to compute (it takes upwards of five
seconds with more than about thirty installed packages).  As a
result, we cache it across sessions using the cache file
referenced by `inferior-haskell-module-alist-file'. We test to
see if this is newer than `haskell-package-conf-file' every time
we load it.

\(fn SYM)" t nil)

;;;***

;;;### (autoloads (ld-script-mode) "ld-script" "site-lisp/ld-script.el"
;;;;;;  (18909 1940))
;;; Generated autoloads from site-lisp/ld-script.el

(add-to-list 'auto-mode-alist '("\\.ld[si]?\\>" . ld-script-mode))

(add-to-list 'auto-mode-alist '("\\.x[bdsru]?[cn]?\\'" . ld-script-mode))

(autoload 'ld-script-mode "ld-script" "\
A major mode to edit GNU ld script files

\(fn)" t nil)

;;;***

;;;### (autoloads (matlab-shell matlab-mode) "matlab" "site-lisp/matlab.el"
;;;;;;  (19004 51910))
;;; Generated autoloads from site-lisp/matlab.el

(autoload 'matlab-mode "matlab" "\
Matlab-mode is a major mode for editing MATLAB dot-m files.
\\<matlab-mode-map>
Convenient editing commands are:
 \\[matlab-comment-region]   - Comment/Uncomment out a region of code.
 \\[matlab-fill-comment-line] - Fill the current comment line.
 \\[matlab-fill-region] - Fill code and comments in region.
 \\[matlab-fill-paragraph]     - Refill the current command or comment.
 \\[matlab-complete-symbol]   - Symbol completion of matlab symbolsbased on the local syntax.

Convenient navigation commands are:
 \\[matlab-beginning-of-command]   - Move to the beginning of a command.
 \\[matlab-end-of-command]   - Move to the end of a command.
 \\[matlab-beginning-of-defun] - Move to the beginning of a function.
 \\[matlab-end-of-defun] - Move do the end of a function.
 \\[matlab-forward-sexp] - Move forward over a syntactic block of code.
 \\[matlab-backward-sexp] - Move backwards over a syntactic block of code.

Convenient template insertion commands:
 \\[tempo-template-matlab-function] - Insert a function definition.
 \\[tempo-template-matlab-if] - Insert an IF END block.
 \\[tempo-template-matlab-for] - Insert a FOR END block.
 \\[tempo-template-matlab-switch] - Insert a SWITCH END statement.
 \\[matlab-insert-next-case] - Insert the next CASE condition in a SWITCH.
 \\[matlab-insert-end-block] - Insert a matched END statement.  With optional ARG, reindent.
 \\[matlab-stringify-region] - Convert some plaintext into a string with correctly quoted chars.

Variables:
  `matlab-indent-level'		Level to indent blocks.
  `matlab-cont-level'		Level to indent continuation lines.
  `matlab-case-level'		Level to unindent case statements.
  `matlab-indent-past-arg1-functions'
                                Regexp of functions to indent past the first
                                  argument on continuation lines.
  `matlab-maximum-indents'      List of maximum indents during lineups.
  `matlab-comment-column'       Goal column for on-line comments.
  `fill-column'			Column used in auto-fill.
  `matlab-indent-function'	If non-nil, indents body of MATLAB functions.
  `matlab-return-function'	Customize RET handling with this function
  `matlab-auto-fill'            Non-nil, do auto-fill at startup
  `matlab-fill-code'            Non-nil, auto-fill code.
  `matlab-fill-strings'         Non-nil, auto-fill strings.
  `matlab-verify-on-save-flag'  Non-nil, enable code checks on save
  `matlab-highlight-block-match-flag'
                                Enable matching block begin/end keywords
  `matlab-vers-on-startup'	If t, show version on start-up.
  `matlab-handle-simulink'      If t, enable simulink keyword highlighting.

All Key Bindings:
\\{matlab-mode-map}

\(fn)" t nil)

(autoload 'matlab-shell "matlab" "\
Create a buffer with Matlab running as a subprocess.

Matlab shell cannot work on the MS Windows platform because Matlab is not
a console application.

\(fn)" t nil)

;;;***

;;;### (autoloads (multi-term) "multi-term" "site-lisp/multi-term.el"
;;;;;;  (19247 18137))
;;; Generated autoloads from site-lisp/multi-term.el

(autoload 'multi-term "multi-term" "\
Create new term buffer.
Will prompt you shell name when you type `C-u' before this command.

\(fn)" t nil)

;;;***

;;;### (autoloads (pastebin pastebin-buffer pastebin) "pastebin"
;;;;;;  "site-lisp/pastebin.el" (19348 51159))
;;; Generated autoloads from site-lisp/pastebin.el

(let ((loads (get 'pastebin 'custom-loads))) (if (member '"pastebin" loads) nil (put 'pastebin 'custom-loads (cons '"pastebin" loads))))

(autoload 'pastebin-buffer "pastebin" "\
Send the whole buffer to pastebin.com.
Optional argument subdomain will request the virtual host to use,
 eg:'emacs' for 'emacs.pastebin.com'.

\(fn &optional SUBDOMAIN)" t nil)

(autoload 'pastebin "pastebin" "\
An interface to the pastebin code snippet www service.

See pastebin.com for more information about pastebin.

Called interactively pastebin uses the current region for
preference for sending... if the mark is NOT set then the entire
buffer is sent.

Argument START is the start of region.
Argument END is the end of region.

If subdomain is used pastebin prompts for a subdomain to be used as the
virtual host to use.  For example use 'emacs' for 'emacs.pastebin.com'.

\(fn START END &optional SUBDOMAIN)" t nil)

;;;***

;;;### (autoloads (php-mode php-file-patterns) "php-mode" "site-lisp/php-mode.el"
;;;;;;  (18982 62474))
;;; Generated autoloads from site-lisp/php-mode.el

(defvar php-file-patterns '("\\.php[s34]?\\'" "\\.phtml\\'" "\\.inc\\'") "\
List of file patterns for which to automatically invoke `php-mode'.")

(custom-autoload 'php-file-patterns "php-mode" nil)

(autoload 'php-mode "php-mode" "\
Major mode for editing PHP code.

\\{php-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (svn-status svn-checkout) "psvn" "site-lisp/psvn.el"
;;;;;;  (18816 27141))
;;; Generated autoloads from site-lisp/psvn.el

(autoload 'svn-checkout "psvn" "\
Run svn checkout REPOS-URL PATH.

\(fn REPOS-URL PATH)" t nil)
 (defalias 'svn-examine 'svn-status)

(autoload 'svn-status "psvn" "\
Examine the status of Subversion working copy in directory DIR.
If ARG is -, allow editing of the parameters. One could add -N to
run svn status non recursively to make it faster.
For every other non nil ARG pass the -u argument to `svn status', which
asks svn to connect to the repository and check to see if there are updates
there.

If there is no .svn directory, examine if there is CVS and run
`cvs-examine'. Otherwise ask if to run `dired'.

\(fn DIR &optional ARG)" t nil)

;;;***

;;;### (autoloads (jython-mode python-3-mode python-mode python-2-mode
;;;;;;  run-python) "python" "site-lisp/python/python.el" (19328
;;;;;;  9901))
;;; Generated autoloads from site-lisp/python/python.el

(add-to-list 'interpreter-mode-alist '("jython" . jython-mode))

(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(autoload 'run-python "python" "\
Run an inferior Python process, input and output via buffer *Python*.
CMD is the Python command to run.  NOSHOW non-nil means don't show the
buffer automatically.

Normally, if there is a process already running in `python-buffer',
switch to that buffer.  Interactively, a prefix arg allows you to edit
the initial command line (default is `python-command'); `-i' etc. args
will be added to this as appropriate.  A new process is started if:
one isn't running attached to `python-buffer', or interactively the
default `python-command', or argument NEW is non-nil.  See also the
documentation for `python-buffer'.

Note that, as a security measure, modules won't be loaded from the
current directory if this command is invoked initially in a
world-writable directory.

Runs the hook `inferior-python-mode-hook' (after the
`comint-mode-hook' is run).  (Type \\[describe-mode] in the process
buffer for a list of commands.)

\(fn &optional CMD NOSHOW NEW)" t nil)

(autoload 'python-2-mode "python" "\
Major mode for editing Python 2.x files.
Supports the syntax and builtins of Python 2.6.

Turns on Font Lock mode unconditionally since it is currently required
for correct parsing of the source.
See also `jython-mode', which is actually invoked if the buffer appears to
contain Jython code.  See also `run-python' and associated Python mode
commands for running Python under Emacs.

The Emacs commands which work with `defun's, e.g. \\[beginning-of-defun], deal
with nested `def' and `class' blocks.  They take the innermost one as
current without distinguishing method and class definitions.  Used multiple
times, they move over others at the same indentation level until they reach
the end of definitions at that level, when they move up a level.
\\<python-mode-map>
Colon is electric: it outdents the line if appropriate, e.g. for
an else statement.  \\[python-backspace] at the beginning of an indented statement
deletes a level of indentation to close the current block; otherwise it
deletes a character backward.  TAB indents the current line relative to
the preceding code.  Successive TABs, with no intervening command, cycle
through the possibilities for indentation on the basis of enclosing blocks.

\\[fill-paragraph] fills comments and multi-line strings appropriately, but has no
effect outside them.

Supports Eldoc mode (only for functions, using a Python process),
Info-Look and Imenu.  In Outline minor mode, `class' and `def' lines
count as headers.

Symbol completion is available similarly to the `rlcompleter' module
in the Python shell.  This completion is added to the Hippie Expand
functions locally if Hippie Expand mode is turned on.  Completion of
symbols of the form x.y only works if the components are literal
module/attribute names, not variables.  An abbrev table is set up with
skeleton expansions for compound statement templates.  Turn on Abbrev
mode to use it.

See also \\[python-3-mode].

\\{python-mode-map}

\(fn)" t nil)

(autoload 'python-mode "python" "\
Major mode for editing Python files.

The version of the language supported depends on
`python-default-version':  either `python-2-mode' or `python-3-mode',
q.v., is invoked.  `python-python-command' determines which
interpreter is used by the Python sub-shell, and you may want to
ensure it corresponds to the language version you edit if version 2
and 3 variants are both available.

\(fn)" t nil)

(autoload 'python-3-mode "python" "\
Major mode for editing Python 3.x files.
Supports the syntax and builtins of Python 3.0.

Turns on Font Lock mode unconditionally since it is currently required
for correct parsing of the source.
See also `jython-mode', which is actually invoked if the buffer appears to
contain Jython code.  See also `run-python' and associated Python mode
commands for running Python under Emacs.

The Emacs commands which work with `defun's, e.g. \\[beginning-of-defun], deal
with nested `def' and `class' blocks.  They take the innermost one as
current without distinguishing method and class definitions.  Used multiple
times, they move over others at the same indentation level until they reach
the end of definitions at that level, when they move up a level.
\\<python-mode-map>
Colon is electric: it outdents the line if appropriate, e.g. for
an else statement.  \\[python-backspace] at the beginning of an indented statement
deletes a level of indentation to close the current block; otherwise it
deletes a character backward.  TAB indents the current line relative to
the preceding code.  Successive TABs, with no intervening command, cycle
through the possibilities for indentation on the basis of enclosing blocks.

\\[fill-paragraph] fills comments and multi-line strings appropriately, but has no
effect outside them.

Supports Eldoc mode (only for functions, using a Python process),
Info-Look and Imenu.  In Outline minor mode, `class' and `def' lines
count as headers.

Symbol completion is available similarly to the `rlcompleter' module
in the Python shell.  This completion is added to the Hippie Expand
functions locally if Hippie Expand mode is turned on.  Completion of
symbols of the form x.y only works if the components are literal
module/attribute names, not variables.  An abbrev table is set up with
skeleton expansions for compound statement templates.  Turn on Abbrev
mode to use it.

See also \\[python-2-mode].

\\{python-mode-map}

\(fn)" t nil)

(autoload 'jython-mode "python" "\
Major mode for editing Jython files.
Like `python-mode', but sets up parameters for Jython subprocesses.
Runs `jython-mode-hook' after `python-mode-hook'.

\(fn)" t nil)

;;;***

;;;### (autoloads (ruby-mode) "ruby-mode" "site-lisp/ruby/ruby-mode.el"
;;;;;;  (19318 30375))
;;; Generated autoloads from site-lisp/ruby/ruby-mode.el

(autoload 'ruby-mode "ruby-mode" "\
Major mode for editing ruby scripts.
\\[ruby-indent-command] properly indents subexpressions of multi-line
class, module, def, if, while, for, do, and case statements, taking
nesting into account.

The variable ruby-indent-level controls the amount of indentation.
\\{ruby-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (rubydb) "rubydb2x" "site-lisp/ruby/rubydb2x.el"
;;;;;;  (19318 30375))
;;; Generated autoloads from site-lisp/ruby/rubydb2x.el

(autoload 'rubydb "rubydb2x" "\
Run rubydb on program FILE in buffer *gud-FILE*.
The directory containing FILE becomes the initial working directory
and source-file directory for your debugger.

\(fn COMMAND-LINE)" t nil)

;;;***

;;;### (autoloads (rubydb) "rubydb3x" "site-lisp/ruby/rubydb3x.el"
;;;;;;  (19318 30375))
;;; Generated autoloads from site-lisp/ruby/rubydb3x.el

(autoload 'rubydb "rubydb3x" "\
Run rubydb on program FILE in buffer *gud-FILE*.
The directory containing FILE becomes the initial working directory
and source-file directory for your debugger.

\(fn COMMAND-LINE)" t nil)

;;;***

;;;### (autoloads (lisp-complete-symbol symbol-completion-try-complete
;;;;;;  symbol-complete) "sym-comp" "site-lisp/python/sym-comp.el"
;;;;;;  (18816 27141))
;;; Generated autoloads from site-lisp/python/sym-comp.el

(autoload 'symbol-complete "sym-comp" "\
Perform completion of the symbol preceding point.
This is done in a way appropriate to the current major mode,
perhaps by interrogating an inferior interpreter.  Compare
`complete-symbol'.
If no characters can be completed, display a list of possible completions.
Repeating the command at that point scrolls the list.

When called from a program, optional arg PREDICATE is a predicate
determining which symbols are considered.

This function requires `symbol-completion-completions-function'
to be set buffer-locally.  Variables `symbol-completion-symbol-function',
`symbol-completion-predicate-function' and
`symbol-completion-transform-function' are also consulted.

\(fn &optional PREDICATE)" t nil)

(autoload 'symbol-completion-try-complete "sym-comp" "\
Completion function for use with `hippie-expand'.
Uses `symbol-completion-symbol-function' and
`symbol-completion-completions-function'.  It is intended to be
used something like this in a major mode which provides symbol
completion:

  (if (featurep 'hippie-exp)
      (set (make-local-variable 'hippie-expand-try-functions-list)
	   (cons 'symbol-completion-try-complete
                 hippie-expand-try-functions-list)))

\(fn OLD)" nil nil)

(autoload 'lisp-complete-symbol "sym-comp" "\
Perform completion on Lisp symbol preceding point.
Compare that symbol against the known Lisp symbols.
If no characters can be completed, display a list of possible completions.
Repeating the command at that point scrolls the list.

When called from a program, optional arg PREDICATE is a predicate
determining which symbols are considered, e.g. `commandp'.
If PREDICATE is nil, the context determines which symbols are
considered.  If the symbol starts just after an open-parenthesis, only
symbols with function definitions are considered.  Otherwise, all
symbols with function definitions, values or properties are
considered.

\(fn &optional PREDICATE)" t nil)

;;;***

;;;### (autoloads (xml-reformat-tags insert-xml read-xml) "xml-parse"
;;;;;;  "site-lisp/xml-parse.el" (18890 9021))
;;; Generated autoloads from site-lisp/xml-parse.el

(autoload 'read-xml "xml-parse" "\
Parse XML data at point into a Lisp structure.
See `insert-xml' for a description of the format of this structure.
Point is left at the end of the XML structure read.

\(fn &optional PROGRESS-CALLBACK)" nil nil)

(autoload 'insert-xml "xml-parse" "\
Insert DATA, a recursive Lisp structure, at point as XML.
DATA has the form:

  ENTRY       ::=  (TAG CHILD*)
  CHILD       ::=  STRING | ENTRY
  TAG         ::=  TAG_NAME | (TAG_NAME ATTR+)
  ATTR        ::=  (ATTR_NAME . ATTR_VALUE)
  TAG_NAME    ::=  STRING
  ATTR_NAME   ::=  STRING
  ATTR_VALUE  ::=  STRING

If ADD-NEWLINES is non-nil, newlines and indentation will be added to
make the data user-friendly.

If PUBLIC and SYSTEM are non-nil, a !DOCTYPE tag will be added at the
top of the document to identify it as an XML document.

DEPTH is normally for internal use only, and controls the depth of the
indentation.

\(fn DATA &optional ADD-NEWLINES PUBLIC SYSTEM DEPTH RET-DEPTH)" nil nil)

(autoload 'xml-reformat-tags "xml-parse" "\
If point is on the open bracket of an XML tag, reformat that tree.
Note that this only works if the opening tag starts at column 0.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("site-lisp/auctex.el" "site-lisp/auto-install.el"
;;;;;;  "site-lisp/bison-mode.el" "site-lisp/cmake-mode.el" "site-lisp/ebs.el"
;;;;;;  "site-lisp/elscreen-buffer-list.el" "site-lisp/elscreen-color-theme.el"
;;;;;;  "site-lisp/elscreen-dired.el" "site-lisp/elscreen-w3m.el"
;;;;;;  "site-lisp/elscreen.el" "site-lisp/flex-mode.el" "site-lisp/gentoo-syntax/ebuild-mode-keywords.el"
;;;;;;  "site-lisp/gentoo-syntax/eselect-mode-keywords.el" "site-lisp/glsl-mode.el"
;;;;;;  "site-lisp/haskell/haskell-font-lock.el" "site-lisp/haskell/haskell-ghci.el"
;;;;;;  "site-lisp/haskell/haskell-hugs.el" "site-lisp/haskell/haskell-simple-indent.el"
;;;;;;  "site-lisp/haskell/haskell-site-file.el" "site-lisp/iedit.el"
;;;;;;  "site-lisp/plsql.el" "site-lisp/preview-latex.el" "site-lisp/promela-mode.el"
;;;;;;  "site-lisp/pymacs.el" "site-lisp/qt-mode.el" "site-lisp/ruby/inf-ruby.el"
;;;;;;  "site-lisp/ruby/ruby-electric.el" "site-lisp/ruby/ruby-style.el"
;;;;;;  "site-lisp/screenshot.el" "site-lisp/session.el" "site-lisp/smarter-find.el"
;;;;;;  "site-lisp/tempo.el" "site-lisp/tex-site.el" "site-lisp/xs-mode.el"
;;;;;;  "site-lisp/yaml-mode.el") (19348 51196 629339))

;;;***

(provide 'autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; autoloads.el ends here
