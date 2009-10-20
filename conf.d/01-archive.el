;;
;; Extension list for Archive Mode, Auto-Compression Mode and Tar Mode
;;

(add-to-list 'auto-mode-alist '("\\.\\(skz\\|pak\\|pk\\|pk3\\|pk4\\|SKZ\\|PAK\\|PK\\|PK3\\|PK4\\)$" . archive-mode))
(add-to-list 'auto-coding-alist '("\\.\\(skz\\|pak\\|pk\\|pk3\\|pk4\\|SKZ\\|PAK\\|PK\\|PK3\\|PK4\\)$" . no-conversion))

;; (add-to-list' jka-compr-compression-info-list ["\\.txz\\(~\\|\\.~[0-9]+~\\)?\\'"
;; 					       "compressing"        "gzip"         ("-c" "-q")
;; 					       "uncompressing"      "gzip"         ("-c" "-q" "-d")
;; 					       t nil "\037\213"])

;;(add-to-list 'jka-compr-mode-alist-additions (cons "\\.txz\\'" 'tar-mode))
