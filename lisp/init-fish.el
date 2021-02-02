;;; init-fish.el --- Major mode for edit fish scripts -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package fish-mode
  :init
  (add-hook 'fish-mode-hook (lambda ()
			     (add-hook 'before-save-hook 'fish_indent-before-save))))

(provide 'init-fish)
;;; init-fish.el ends here
