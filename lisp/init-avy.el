;;; init-avy.el -- setup avy package -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;;   `avy' is package for jumping to visible text using a char-based
;;;   decision tree.
;;;
;;;   The package provide tons of filter function, but I only use the
;;;   `avy-goto-char-timer' for most of time.
;;;
;;; Code:

(require 'init-package-util)

(use-package avy
  :commands (avy-goto-char-timer avy-isearch)
  :bind
  ("M-'" . avy-goto-char-timer))

(provide 'init-avy)
;;; init-avy.el ends here
