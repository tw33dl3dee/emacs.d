;;; Start server if not started yet

(require 'server)
(if (not (server-running-p "server"))
    (server-mode t))
