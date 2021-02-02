;;; init-yaml.el --- Support Yaml files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package yaml-mode
  :config
  (when (executable-find "yaml-language-server")
    (add-hook 'yaml-mode-hook 'lsp)))

(provide 'init-yaml)
;;; init-yaml.el ends here



