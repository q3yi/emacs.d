;;; init-fish.el --- Major mode for edit fish scripts -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)
(require 'max-misc)

(defun max-indent-before-save ()
  "Call fish indent function before save."
  (add-hook 'befor-save-hook 'fish_indent-before-save))

(use-package fish-mode
  :pin melpa-stable
  :hook
  ((fish-mode . max-indent-before-save)
   (fish-mode . max-clean-whitespace-before-save)))

(provide 'init-fish)
;;; init-fish.el ends here
