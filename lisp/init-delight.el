;;; init-delight.el -- install delight.el package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package delight
  :demand
  :pin gnu
  :config
  (delight '((emacs-lisp-mode "Elisp" :major)
	     (auto-fill-mode " AF" "simple")
	     (subword-mode)
	     (auto-revert-mode nil "autorevert")
	     (visual-line-mode "simple"))))

(provide 'init-delight)
;;; init-delight.el ends here
