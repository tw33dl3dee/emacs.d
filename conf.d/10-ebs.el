;;; Setup Easy Buffer Switching

(require 'ebs)
(ebs-initialize)
(global-set-key [(control tab)] 'ebs-switch-buffer)

;;; Depends on defcustom EBS-EXCLUDE-BUFFER-REGEXPS (set in init.el)
