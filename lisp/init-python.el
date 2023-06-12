;;; init-python.el --- setup python development -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)
(require 'init-before-save)

;;; In order to start eglot, make sure pyright was installed
(use-package python
  :if (treesit-available-p)
  :custom
  (python-shell-interpreter "python3")
  :hook
  (python-ts-mode . eglot-ensure)
  :init
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
  :config
  (q3yi-add-before-save-hooks-within-mode 'yaml-ts-mode 'whitespace-cleanup))

(provide 'init-python)
;;; init-python.el ends here
