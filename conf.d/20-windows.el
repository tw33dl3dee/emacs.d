;;; Window management functions
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                 ;;
;;             window layout related               ;;
;;                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;  +-----------------------+----------------------+
;;  |                       |                      |
;;  |                       |                      |
;;  |                       |                      |
;;  +-----------------------+----------------------+
;;  |                       |                      |
;;  |                       |                      |
;;  |                       |                      |
;;  +-----------------------+----------------------+

(defun window-split-4 ()
  "Splite window into 4 sub-windows"
  (interactive)
  (if (= 1 (length (window-list)))
      (progn (split-window-vertically)
	     (split-window-horizontally)
	     (other-window 2)
	     (split-window-horizontally))))

;;  +-----------------------+----------------------+
;;  |                                              |
;;  |                                              |
;;  |                                              |
;;  +-----------------------+----------------------+
;;  |                       |                      |
;;  |                       |                      |
;;  |                       |                      |
;;  +-----------------------+----------------------+

(defun window-split-3 ()
  "Splite window into 3 sub-windows"
  (interactive)
  (if (= 1 (length (window-list)))
      (progn (split-window-vertically)
	     (other-window 1)
	     (split-window-horizontally))))

;;  +----------------------+                 +----------- +-----------+ 
;;  |                      |           \     |            |           | 
;;  |                      |   +-------+\    |            |           | 
;;  +----------------------+   +-------+/    |            |           |
;;  |                      |           /     |            |           | 
;;  |                      |                 |            |           | 
;;  +----------------------+                 +----------- +-----------+ 

(defun window-split-v ()
  (interactive)
  (if (= 2 (length (window-list)))
      (let ((thisBuf (window-buffer))
	    (nextBuf (progn (other-window 1) (buffer-name))))
	(progn   (delete-other-windows)
		 (split-window-horizontally)
		 (set-window-buffer nil thisBuf)
		 (set-window-buffer (next-window) nextBuf)))))

;;  +----------- +-----------+                  +----------------------+ 
;;  |            |           |            \     |                      | 
;;  |            |           |    +-------+\    |                      | 
;;  |            |           |    +-------+/    +----------------------+ 
;;  |            |           |            /     |                      | 
;;  |            |           |                  |                      | 
;;  +----------- +-----------+                  +----------------------+ 

(defun window-split-h ()
  (interactive)
  (if (= 2 (length (window-list)))
      (let ((thisBuf (window-buffer))
	    (nextBuf (progn (other-window 1) (buffer-name))))
	(progn   (delete-other-windows)
		 (split-window-vertically)
		 (set-window-buffer nil thisBuf)
		 (set-window-buffer (next-window) nextBuf)))))

;;  +----------------------+                 +----------- +-----------+ 
;;  |                      |           \     |            |           | 
;;  |                      |   +-------+\    |            |           | 
;;  +----------------------+   +-------+/    |            |-----------|
;;  |          |           |           /     |            |           | 
;;  |          |           |                 |            |           | 
;;  +----------------------+                 +----------- +-----------+ 


(defun window-split-v-3 ()
  "Change 3 window style from horizontal to vertical"
  (interactive)
  (select-window (get-largest-window))
  (if (= 3 (length (window-list)))
      (let ((winList (window-list)))
	(let ((1stBuf (window-buffer (car winList)))
	      (2ndBuf (window-buffer (car (cdr winList))))
	      (3rdBuf (window-buffer (car (cdr (cdr winList))))))
	  (message "%s %s %s" 1stBuf 2ndBuf 3rdBuf)
	  (delete-other-windows)
	  (split-window-horizontally)
	  (set-window-buffer nil 1stBuf)
	  (other-window 1)
	  (set-window-buffer nil 2ndBuf)
	  (split-window-vertically)
	  (set-window-buffer (next-window) 3rdBuf)
	  (select-window (get-largest-window))))))

;;  +----------- +-----------+                  +----------------------+ 
;;  |            |           |            \     |                      | 
;;  |            |           |    +-------+\    |                      | 
;;  |            |-----------|    +-------+/    +----------------------+ 
;;  |            |           |            /     |           |          | 
;;  |            |           |                  |           |          | 
;;  +----------- +-----------+                  +----------------------+ 


(defun window-split-h-3 ()
  "Change 3 window style from vertical to horizontal"
  (interactive)
  (select-window (get-largest-window))
  (if (= 3 (length (window-list)))
      (let ((winList (window-list)))
	(let ((1stBuf (window-buffer (car winList)))
	      (2ndBuf (window-buffer (car (cdr winList))))
	      (3rdBuf (window-buffer (car (cdr (cdr winList))))))
	  (message "%s %s %s" 1stBuf 2ndBuf 3rdBuf)
	  (delete-other-windows)
	  (split-window-vertically)
	  (set-window-buffer nil 1stBuf)
	  (other-window 1)
	  (set-window-buffer nil 2ndBuf)
	  (split-window-horizontally)
	  (set-window-buffer (next-window) 3rdBuf)
	  (select-window (get-largest-window))))))

;;  +----------- +-----------+                    +----------- +-----------+ 
;;  |            |     C     |            \       |            |     A     | 
;;  |            |           |    +-------+\      |            |           | 
;;  |     A      |-----------|    +-------+/      |     B      |-----------| 
;;  |            |     B     |            /       |            |     C     | 
;;  |            |           |                    |            |           | 
;;  +----------- +-----------+                    +----------- +-----------+ 
					;
;;  +------------------------+                     +------------------------+ 
;;  |           A            |           \         |           B            | 
;;  |                        |   +-------+\        |                        | 
;;  +------------------------+   +-------+/        +------------------------+ 
;;  |     B     |     C      |           /         |     C     |     A      | 
;;  |           |            |                     |           |            | 
;;  +------------------------+                     +------------------------+ 


(defun window-roll-v-3 ()
  "Rolling 3 window buffers clockwise"
  (interactive)
  (select-window (get-largest-window))
  (if (= 3 (length (window-list)))
      (let ((winList (window-list)))
	(let ((1stWin (car winList))
	      (2ndWin (car (cdr winList)))
	      (3rdWin (car (cdr (cdr winList)))))
	  (let ((1stBuf (window-buffer 1stWin))
		(2ndBuf (window-buffer 2ndWin))
		(3rdBuf (window-buffer 3rdWin)))
	    (set-window-buffer 1stWin 3rdBuf)
	    (set-window-buffer 2ndWin 1stBuf)
	    (set-window-buffer 3rdWin 2ndBuf))))))


;;;  +----------------------+                +---------- +----------+
;;;  |                      |          \     |           |          |
;;;  |                      |  +-------+\    |           |          |
;;;  +----------------------+  +-------+/    |           |          |
;;;  |                      |          /     |           |          |
;;;  |                      |                |           |          |
;;;  +----------------------+                +---------- +----------+
;;
;;;  +--------- +-----------+                +----------------------+
;;;  |          |           |          \     |                      |
;;;  |          |           |  +-------+\    |                      |
;;;  |          |           |  +-------+/    +----------------------+
;;;  |          |           |          /     |                      |
;;;  |          |           |                |                      |
;;;  +--------- +-----------+                +----------------------+

(defun window-change-split-type-2 ()
  "Changes splitting from vertical to horizontal and vice-versa"
  (interactive)
  (if (= 2 (length (window-list)))
      (let ((thisBuf (window-buffer))
            (nextBuf (progn (other-window 1) (buffer-name)))
            (split-type (if (= (window-width)
                               (frame-width))
                            'split-window-horizontally
			  'split-window-vertically)))
        (progn
          (delete-other-windows)
	  (funcall split-type)
          (set-window-buffer nil thisBuf)
          (set-window-buffer (next-window) nextBuf)))))

;;  +----------------------+                 +----------- +-----------+ 
;;  |                      |           \     |            |           | 
;;  |                      |   +-------+\    |            |           | 
;;  +----------------------+   +-------+/    |            |-----------|
;;  |          |           |           /     |            |           | 
;;  |          |           |                 |            |           | 
;;  +----------------------+                 +----------- +-----------+ 

;;  +----------- +-----------+                  +----------------------+ 
;;  |            |           |            \     |                      | 
;;  |            |           |    +-------+\    |                      | 
;;  |            |-----------|    +-------+/    +----------------------+ 
;;  |            |           |            /     |           |          | 
;;  |            |           |                  |           |          | 
;;  +----------- +-----------+                  +----------------------+ 

(defun window-change-split-type-3 ()
  "Change 3-window style from horizontal to vertical and vice-versa"
  (interactive)
  (select-window (get-largest-window))
  (if (= 3 (length (window-list)))
      (let ((winList (window-list)))
	(let ((1stBuf (window-buffer (car winList)))
	      (2ndBuf (window-buffer (car (cdr winList))))
	      (3rdBuf (window-buffer (car (cdr (cdr winList)))))
	      (split-3 
	       (lambda (1stBuf 2ndBuf 3rdBuf split-1 split-2)
		 "change 3 window from horizontal to vertical and vice-versa"
		 (message "%s %s %s" 1stBuf 2ndBuf 3rdBuf)
		 (delete-other-windows)
		 (funcall split-1)
		 (set-window-buffer nil 1stBuf)
		 (other-window 1)
		 (set-window-buffer nil 2ndBuf)
		 (funcall split-2)
		 (set-window-buffer (next-window) 3rdBuf)
		 (select-window (get-largest-window))))
	      (split-type-1 nil)
	      (split-type-2 nil))
	  (if (= (window-width) (frame-width))
	      (setq split-type-1 'split-window-horizontally split-type-2 'split-window-vertically)
	    (setq split-type-1 'split-window-vertically  split-type-2 'split-window-horizontally))
	  (funcall split-3 1stBuf 2ndBuf 3rdBuf split-type-1 split-type-2)))))


(defun window-change-split-type ()
  "Change 2- or 3-window style from horizontal to vertical and vice-versa"
  (interactive)
  (case (length (window-list))
    (3 (window-change-split-type-3))
    (2 (window-change-split-type-2))))


(defun toggle-fullscreen (&optional f)
  "Toggle fullscreen mode"
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))

;;; Window movement: don't signal error on <M-left>, etc, when there is no window to move to

(defadvice windmove-left (around windmove-left-ignore-errors activate)
  "`windmove-left' with errors ignored."
  (ignore-errors
    ad-do-it))

(defadvice windmove-right (around windmove-right-ignore-errors activate)
  "`windmove-right' with errors ignored."
  (ignore-errors
    ad-do-it))

(defadvice windmove-up (around windmove-up-ignore-errors activate)
  "`windmove-up' with errors ignored."
  (ignore-errors
    ad-do-it))

(defadvice windmove-down (around windmove-down-ignore-errors activate)
  "`windmove-down' with errors ignored."
  (ignore-errors
    ad-do-it))
