;;; init-yaml.el --- Support Yaml files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package yaml-ts-mode
  :if (treesit-available-p)
  :mode (("\\.ya?ml\\'" . yaml-ts-mode)))

(provide 'init-yaml)
;;; init-yaml.el ends here
