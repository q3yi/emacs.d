;;; init-emacs-lisp.el -- tweak elisp mode -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'max-misc)

(add-hook 'emacs-lisp-mode-hook 'max-clean-whitespace-before-save)

(provide 'init-emacs-lisp)
;;; init-emacs-lisp.el ends here
