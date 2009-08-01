;; XS-mode
;;

(autoload 'xs-mode "xs-mode" "Major mode for XS files" t)
(add-to-list 'auto-mode-alist '("\\.xs$" . xs-mode))
