;;; init-emacs-lisp.el -- tweak elisp mode -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:
(require 'init-before-save)
(require 'whitespace)

(defun q3yi-indent-buffer ()
  "Indent current buffer."
  (indent-region (point-min) (point-max)))

(q3yi-add-before-save-hooks-within-mode 'emacs-lisp-mode 'whitespace-cleanup)
(q3yi-add-before-save-hooks-within-mode 'emacs-lisp-mode 'q3yi-indent-buffer)

(provide 'init-emacs-lisp)
;;; init-emacs-lisp.el ends here
