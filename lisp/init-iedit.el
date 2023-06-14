;;; init-iedit.el -- use iedit for multiple cursor editing -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:
(use-package iedit
  :pin melpa
  :commands (iedit-mode)
  :bind
  ("C-;" . iedit-mode))

(provide 'init-iedit)
;;; init-iedit.el ends here
