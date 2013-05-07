;;; Flex/Bison modes

;; (autoload 'bison-mode "bison-mode" "Major mode for editing bison/yacc files" t)
;; (autoload 'flex-mode "flex-mode" "Major mode for editing flex files" t)
(add-to-list 'auto-mode-alist '("\\.ll?$" . flex-mode))
(add-to-list 'auto-mode-alist '("\\.yy?$" . bison-mode))
