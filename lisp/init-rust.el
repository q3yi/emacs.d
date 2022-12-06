;;; init-rust.el --- Configure rust-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)
(require 'init-eglot)

(use-package rust-mode
  :pin melpa-stable)

(use-package rustic
  :pin melpa-stable
  :after rust-mode
  :custom
  ((rustic-lsp-client 'eglot)
   (rustic-lsp-server 'rust-analyzer)
   (rustic-format-on-save t)))

(provide 'init-rust)
;;; init-rust.el ends here
