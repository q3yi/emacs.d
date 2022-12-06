;;; init-eglot.el -- init eglot language server client -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'init-package-util)

(use-package eglot
  :pin gnu
  :bind
  (:map eglot-mode-map
	("C-c l r" . eglot-rename)
	("C-c l o" . eglot-code-action-organize-imports)
	("C-c l =" . eglot-format-buffer)))

(provide 'init-eglot)
;;; init-eglot.el ends here
