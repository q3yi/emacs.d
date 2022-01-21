;;; init-crux.el --- Configure crux package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package crux
  :bind
  (("C-k" . crux-smart-kill-line)
   ("C-o" . crux-smart-open-line)
   ("C-c \\" . crux-cleanup-buffer-or-region)
   ("C-c j" . crux-top-join-line)
   ([remap move-beginning-of-line] . crux-move-beginning-of-line)))

(provide 'init-crux)
;;; init-crux.el ends here
