;;; init-delight.el -- install delight.el package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package delight
  :demand
  :pin gnu)

(use-package emacs
  :delight
  (emacs-lisp-mode "Elisp" :major)
  (auto-fill-mode " AF")
  (auto-revert-mode)
  (visual-line-mode))

(provide 'init-delight)
;;; init-delight.el ends here
