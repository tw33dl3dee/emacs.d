;; FFAP extension to open module at point

(mapcar (lambda (mode)
          (add-hook mode (lambda () (require 'ffap-perl-module))))
        '(perl-mode-hook cperl-mode-hook))

(autoload 'ffap-perl-module-file-at-point "ffap-perl-module" "Find the filename for a perl module at point." t)

(defun ffap-perl-module ()
  (interactive)
  (find-file (ffap-perl-module-file-at-point)))
