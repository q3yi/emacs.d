;;; init-lsp.el --- Configure LSP for programming -*- lexical-binding: t -*-

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer"))) ;; use rust-analyzer instead of rls
  :hook
  (go-mode . eglot-ensure)
  (rust-mode . eglot-ensure))

(provide 'init-lsp)

