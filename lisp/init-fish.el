;;; init-fish.el --- Major mode for edit fish scripts -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'max-misc)

(defun max-indent-before-save ()
  "Call fish indent function before save."
  (add-hook 'befor-save-hook 'fish_indent-before-save))

(use-package fish-mode
  :init
  (add-hook 'fish-mode-hook 'max-indent-before-save)
  (add-hook 'fish-mode-hook 'max-clean-whitespace-before-save))

(provide 'init-fish)
;;; init-fish.el ends here
