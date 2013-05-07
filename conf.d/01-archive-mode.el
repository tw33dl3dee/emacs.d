;;
;; Extension list for Archive Mode, Auto-Compression Mode and Tar Mode
;;

(add-to-list
 'auto-mode-alist
 '("\\.\\(skz\\|pak\\|pk\\|pk3\\|pk4\\|SKZ\\|PAK\\|PK\\|PK3\\|PK4\\)\\'" . archive-mode))
(add-to-list
 'auto-coding-alist
 '("\\.\\(skz\\|pak\\|pk\\|pk3\\|pk4\\|SKZ\\|PAK\\|PK\\|PK3\\|PK4\\)\\'" . no-conversion))

(add-to-list 'auto-mode-alist '("\\.\\(dia\\|DIA\\)$" . archive-mode))
(add-to-list 'auto-coding-alist '("\\.\\(dia\\|DIA\\)$" . no-conversion))

(eval-after-load "jka-compr"
      '(unless (member "\\.\\(dia\\|DIA\\)\\'" (mapcar (lambda (vec) (elt vec 0))
						       jka-compr-compression-info-list))
         (add-to-list 'jka-compr-compression-info-list
                      ;; this element from emacs 22
                      ["\\.\\(dia\\|DIA\\)\\'"
                       "compressing"    "gzip"  ("-c" "-q")
                       "uncompressing"  "gzip"  ("-c" "-q" "-d")
                       nil t "\037\213"])
         ;; if already enabled then toggle to get our addition recognised (note
         ;; no `auto-compression-mode' variable in xemacs 21)
         (when jka-compr-added-to-file-coding-system-alist
           (auto-compression-mode 0)
           (auto-compression-mode 1))))
