;;; init-crux.el --- Configure crux package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package crux
  :pin melpa-stable
  :bind
  (("C-k" . crux-smart-kill-line)
   ("C-o" . crux-smart-open-line)
   ("C-c \\" . crux-cleanup-buffer-or-region)
   ("M-j" . join-line)
   ([remap move-beginning-of-line] . crux-move-beginning-of-line)))

(provide 'init-crux)
;;; init-crux.el ends here
