;;; This contains all load paths required by all modules in site-lisp
;;; Loaded when byte-compiling and generating autoloads in batch mode

;; APE library
(add-site-load-path "apel")
(add-site-load-path "emu")

;; FLIM library
(add-site-load-path "flim")

;; Everything from other files
(add-site-load-path "auctex")
(add-site-load-path "preview")
(add-site-load-path "gentoo-syntax")
(add-site-load-path "ruby")
(add-site-load-path "lojban")
(add-site-load-path "python")
(add-site-load-path "dvc")
(add-site-load-path "yasnippet")
(add-site-load-path "dictionary")
(add-site-load-path "haskell")
(add-site-load-path "w3m")
(add-site-load-path "erlang")
(add-site-load-path "autoconf-mode")
