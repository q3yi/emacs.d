;;; init-network.el --- Configurate network proxies -*- lexical-binding: t -*-

(unless url-proxy-services
  (setq url-proxy-services '(("no_proxy" . "^\\(localhost\\|127\\.0\\.0\\.1\\|10\\..*\\|192\\.168\\..*\\)")
			     ("http" . "127.0.0.1:1081")
			     ("https" . "127.0.0.1:1081"))))

(provide 'init-network)
