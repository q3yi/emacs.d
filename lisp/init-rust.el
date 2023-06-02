;;; init-rust.el --- Configure rust-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)
(require 'init-eglot)

(use-package rust-ts-mode
  :if (treesit-available-p)
  :mode (("\\.rs\\'" . rust-ts-mode))
  :hook
  ((rust-ts-mode . eglot-ensure)))

(provide 'init-rust)
;;; init-rust.el ends here
