;;; init-flycheck.el -- Use flycheck to relpace flymake -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package flycheck
  :ensure t
  :hook
  (prog-mode . flycheck-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
