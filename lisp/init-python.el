;;; init-python.el --- setup python development -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package python-mode
  :ensure nil
  :custom
  (python-shell-interpreter "python3"))

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
			 (require 'lsp-python-ms)
			 (lsp-deferred))))

(provide 'init-python)
;;; init-python ends here

