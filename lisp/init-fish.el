;;; init-fish.el --- Major mode for edit fish scripts -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)
(require 'init-before-save)

(defun max-indent-before-save ()
  "Call fish indent function before save."
  (add-hook 'befor-save-hook 'fish_indent-before-save))

(use-package fish-mode
  :pin melpa-stable
  :config
  (require 'whitespace)
  (q3yi-add-before-save-hooks-within-mode 'fish-mode 'whitespace-cleanup)
  (q3yi-add-before-save-hooks-within-mode 'fish-mode 'fish_indent-before-save))

(provide 'init-fish)
;;; init-fish.el ends here
