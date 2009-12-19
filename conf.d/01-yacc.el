;;; Flex/Bison modes

(autoload 'bison-mode "bison-mode" "Major mode for editing bison/yacc files" nil t)
(autoload 'flex-mode "flex-mode" "Major mode for editing flex files" nil t)
(add-to-list 'auto-mode-alist '("\\.ll?$" . flex-mode))
(add-to-list 'auto-mode-alist '("\\.yy?$" . bison-mode))
