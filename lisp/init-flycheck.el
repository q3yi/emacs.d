;;; init-flycheck.el -- Use flycheck to relpace flymake -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package flycheck
  :commands (flycheck-mode)
  :hook
  (prog-mode . flycheck-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
