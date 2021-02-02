;;; init-golang.el --- Configure go-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package go-mode
  :hook (go-mode . lsp-deferred))

(provide 'init-golang)
;;; init-golang.el ends here
