;;; This contains all load paths required by all modules in site-lisp
;;; Loaded when byte-compiling and generating autoloads in batch mode

;; APE library
(add-site-load-path "apel")
(add-site-load-path "emu")

;; FLIM library
(add-site-load-path "flim")

;; Drew Adams' library
(add-site-load-path "dadams")

;; Everything from other files
(add-site-load-path "auctex")
(add-site-load-path "autoconf-mode")
(add-site-load-path "dictionary")
(add-site-load-path "dvc")
(add-site-load-path "erlang")
(add-site-load-path "gentoo-syntax")
(add-site-load-path "haskell")
(add-site-load-path "html5")
(add-site-load-path "lojban")
(add-site-load-path "po-mode")
(add-site-load-path "preview")
(add-site-load-path "python")
(add-site-load-path "ruby")
(add-site-load-path "w3")
(add-site-load-path "w3m")
(add-site-load-path "yasnippet")

;; nXHTML: big fukken load of shit
(add-site-load-path "nxhtml")
(add-site-load-path "nxhtml/nxhtml")
(add-site-load-path "nxhtml/related")
(add-site-load-path "nxhtml/util")
