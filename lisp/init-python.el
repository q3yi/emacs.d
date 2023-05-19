;;; init-python.el --- setup python development -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

;;; In order to start eglot, make sure pyright was installed
(use-package python
  :if (treesit-available-p)
  :ensure nil
  :mode (("\\.py[iw]?\\'" . python-ts-mode))
  :custom
  (python-shell-interpreter "python3")
  :hook
  (python-ts-mode . eglot-ensure))

(provide 'init-python)
;;; init-python.el ends here
