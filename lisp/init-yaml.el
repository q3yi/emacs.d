;;; init-yaml.el --- Support Yaml files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)
(require 'max-misc)

(use-package yaml-mode
  :hook
  ((yaml-mode . max-clean-whitespace-before-save)))

(provide 'init-yaml)
;;; init-yaml.el ends here
