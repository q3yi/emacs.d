;;; init-python.el --- setup python development -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

;;; In order to start eglot, make sure pyright was installed
(use-package python-mode
  :ensure nil
  :custom
  (python-shell-interpreter "python3")
  :hook
  (python-mode . eglot-ensure))

(provide 'init-python)
;;; init-python.el ends here
