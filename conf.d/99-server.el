;;; Start server if not started yet

(load "server")
(if (not (server-running-p "server")) (server-mode t))
