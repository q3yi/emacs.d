;;; init-undo-tree.el --- Configurate undo-tree mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package undo-tree
  :pin gnu
  :demand
  :delight
  :custom ((undo-tree-auto-save-history nil))
  :config
  (global-undo-tree-mode))

(provide 'init-undo-tree)
;;; init-undo-tree.el ends here
