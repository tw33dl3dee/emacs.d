;;; Some fucking SVN customization

;;; UNUSED anyway

(defun svncmdbuf (cmd &optional fn)
  "run the given svn command on the current window"
  (interactive "scmd:")
  (let
	  ((buf "*svn-cmd*"))
	(if (not fn)
		(setq fn (buffer-file-name)))
	(if (shell-command (format "svn %s %s" cmd fn) buf)
		(switch-to-buffer-other-window buf))))

(defun svndiff ()
  "diff the current buffer with subversion"
  (interactive)
  (let
	  ((fn (buffer-file-name)))
	(if (and fn (shell-command (format "svn diff %s" fn) "*svn-diff*"))
		(switch-to-buffer-other-window "*svn-diff*"))))

(defun svn (c)
  "run svn command tool"
  (interactive "c: (a)dd (d)iff (D)iff revision (c)ommit (l)og (r)esolve (R)evert (b)lame (u)p (x)delete")
  (case c
		(?a (svncmdbuf "add"))
		(?b (svncmdbuf "blame"))
		(?d (svncmdbuf "diff"))
		(?D (call-interactively 'sd))
		(?c (svncmdbuf (concat "commit -m \"" (read-string "checkin message:") "\"")))
		(?l (svncmdbuf "log"))
		(?u (svncmdbuf "up"))
		(?r (svncmdbuf "resolved"))
		(?x (svncmdbuf "rm"))
		(?R (if (yes-or-no-p "revert?") (svncmdbuf "revert")))
		(t (message "unknown command key %c" c)
		   )
		)
  )

;;(load "psvn")
