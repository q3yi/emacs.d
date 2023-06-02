;;; init-eglot.el -- init eglot language server client -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'init-package-util)

(use-package eglot
  :pin gnu
  :custom
  ((eglot-events-buffer-size 0)
   ;; imenu use treesitter in *-ts-mode
   (eglot-stay-out-of '(imenu))
   (eglot-ignored-server-capabilities '(:inlayHintProvider)))
  :bind
  (:map eglot-mode-map
	("C-c l a" . eglot-code-actions)
	("C-c l f" . eglot-code-action-quickfix)
	("C-c l r" . eglot-rename)
	("C-c l o" . eglot-code-action-organize-imports)
	("C-c l =" . eglot-format-buffer)))

(provide 'init-eglot)
;;; init-eglot.el ends here
