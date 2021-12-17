;;; init-network.el --- Configurate network proxies -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'url-vars)

(unless url-proxy-services
  (setq url-proxy-services '(("no_proxy" . "^\\(localhost\\|127\\.0\\.0\\.1\\|10\\..*\\|192\\.168\\..*\\)")
			     ("http" . "127.0.0.1:7890")
			     ("https" . "127.0.0.1:7890"))))

(provide 'init-network)
;;; init-network.el ends here

