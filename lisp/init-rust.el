;;; init-rust.el --- Configure rust-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package rustic
  :custom
  ((rustic-lsp-client 'lsp-mode)
   (rustic-lsp-server 'rust-analyzer)
   (rustic-format-on-save t)))

(provide 'init-rust)
;;; init-rust.el ends here
