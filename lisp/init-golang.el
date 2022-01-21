;;; init-golang.el --- Configure go-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package go-mode
  :hook (go-mode . eglot-ensure))

(provide 'init-golang)
;;; init-golang.el ends here
