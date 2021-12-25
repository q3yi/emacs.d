;;; init-proxy.el --- Configurate network proxies -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'url-vars)

(unless url-proxy-services
  ;; Proxy client running on window host in WSL, so we need its ip to setup
  ;; the proxy, The 'WSL_HOST_IP' is set in fish init config.
  ;; In fish init config:
  ;; 
  (let ((proxy (format "%s:7890" (or (getenv "WSL_HOST_IP") "127.0.0.1")))
	(bypass "^\\(localhost\\|127\\.0\\.0\\.1\\|10\\..*\\|192\\.168\\..*\\)"))
    (setq url-proxy-services `(("no_proxy" . ,bypass)
			       ("http" . ,proxy)
			       ("https" . ,proxy)))))

(provide 'init-proxy)
;;; init-proxy.el ends here

