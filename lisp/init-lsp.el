;;; init-lsp.el --- Configure LSP for programming

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer")))
  :hook
  (go-mode . eglot-ensure)
  (rust-mode . eglot-ensure))

(provide 'init-lsp)

