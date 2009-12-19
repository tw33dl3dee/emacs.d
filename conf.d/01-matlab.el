;; Matlab mode
;;

(autoload 'matlab-mode "matlab" "Matlab-mode is a major mode for editing MATLAB dot-m files." t)
(autoload 'matlab-shell "matlab" "Create a buffer with Matlab running as a subprocess." t)
(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))
