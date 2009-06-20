;; Matlab mode
;;

(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(autoload 'matlab-shell "matlab")
(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))
