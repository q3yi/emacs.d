;;; init-smartparens.el --- Configurate paired structure editing -*- lexical-binding: t -*-

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package smartparens-config
  :demand
  :ensure smartparens
  :config
  (smartparens-global-mode))

(provide 'init-smartparens)
