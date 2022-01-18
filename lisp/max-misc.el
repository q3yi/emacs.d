;;; max-misc.el -- Some useful functions -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:
(require 'whitespace)

(defun max-clean-whitespace-before-save ()
  "Add hook to `before-save-hook', clean whitespace in buffer."
  (add-hook 'before-save-hook 'whitespace-cleanup))

(provide 'max-misc)
;;; max-misc.el ends here
