;;; Some few ways to close buffer after compilation

;; === Way 1 ===

;;; close buffer on compilation
;;;
;; Helper for compilation. Close the compilation window if
;; there was no error at all.
;; (defun compilation-exit-autoclose (status code msg)
;;   ;; If M-x compile exists with a 0
;;   (when (and (eq status 'exit) (zerop code))
;; 	;; then bury the *compilation* buffer, so that C-x b doesn't go there
;; 	(bury-buffer)
;; 	;; and delete the *compilation* window
;; 	(delete-window (get-buffer-window (get-buffer "*compilation*"))))
;;   ;; Always return the anticipated result of compilation-exit-message-function
;;   (cons msg code))
;; ;; Specify my function (maybe I should have done a lambda function)
;; (setq compilation-exit-message-function 'compilation-exit-autoclose)

;; === Way 2 ===

;; Close the compilation window if there was no error at all.
;; (setq compilation-exit-message-function
;; 	  (lambda (status code msg)
;; 		;; If M-x compile exists with a 0
;; 		(when (and (eq status 'exit) (zerop code))
;; 		  ;; then bury the *compilation* buffer, so that C-x b doesn't go there
;; 		  (bury-buffer "*compilation*")
;; 		  ;; and return to whatever were looking at before
;; 		  (replace-buffer-in-windows "*compilation*"))
;; 		;; Always return the anticipated result of compilation-exit-message-function
;; 		(cons msg code)))

;;; === Way 3 ===

(add-to-list 'compilation-finish-functions 'compile-autoclose)

(defun compile-autoclose (buffer string)
  (when (string= (buffer-name buffer) "*compilation*")
    (if (string-match "finished" string)
	(progn (winner-undo)
	       (bury-buffer "*compilation*"))
      (message "Compilation exited abnormally: %s" string))))
