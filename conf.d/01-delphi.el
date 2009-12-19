;;; Delphi mode

(autoload 'delphi-mode "Major mode for editing Delphi code" t)
(add-to-list 'auto-mode-alist '("\\.\\(pas\\|dpr\\|dpk\\)$" . delphi-mode))

