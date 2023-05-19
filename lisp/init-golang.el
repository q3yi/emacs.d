;;; init-golang.el --- Configure go-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)
(require 'init-eglot)

(use-package go-ts-mode
  :if (treesit-available-p)
  :mode (("\\.go\\'" . go-ts-mode))
  :hook (go-ts-mode . eglot-ensure))

(provide 'init-golang)
;;; init-golang.el ends here
