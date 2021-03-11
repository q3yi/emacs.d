;;; init-smartparens.el --- Configurate paired structure editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package smartparens
  :demand
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode))

(provide 'init-smartparens)
;;; init-smartparens.el ends here
