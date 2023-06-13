;;; init-flymake.el -- Config flymake -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'flymake)

(add-hook 'prog-mode-hook #'flymake-mode)

(define-key flymake-mode-map (kbd "C-c 1 l") #'flymake-show-buffer-diagnostics)
(define-key flymake-mode-map (kbd "C-c 1 L") #'flymake-show-project-diagnostics)
(define-key flymake-mode-map (kbd "C-c 1 n") #'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "C-c 1 p") #'flymake-goto-prev-error)

(provide 'init-flymake)
;;; init-flymake.el ends here
