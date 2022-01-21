;;; init-lsp.el --- Configure LSP for programming -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((lsp-mode . lsp-enable-which-key-integration)))

(use-package consult-lsp
  :after (consult lsp-mode))

(provide 'init-lsp)
;;; init-lsp.el ends here
