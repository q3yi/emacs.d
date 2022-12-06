;;; init-golang.el --- Configure go-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)
(require 'init-eglot)

(use-package go-mode
  :pin melpa-stable
  :hook (go-mode . eglot-ensure))

(provide 'init-golang)
;;; init-golang.el ends here
