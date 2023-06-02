;;; init-yaml.el --- Support Yaml files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-package-util)
(require 'init-before-save)

(use-package yaml-ts-mode
  :if (treesit-available-p)
  :init
  (add-to-list 'major-mode-remap-alist '(yaml-mode . yaml-ts-mode))
  :config
  (require 'whitespace)
  (q3yi-add-before-save-hooks-within-mode 'yaml-ts-mode 'whitespace-cleanup))

(provide 'init-yaml)
;;; init-yaml.el ends here
