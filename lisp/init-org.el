;;; init-org.el --- Configurate org-mode -*- lexical-binding: t -*-

(require 'org)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; use org-fragtog to toggle org-mode latex preview
(use-package org-fragtog
  :hook
  (org-mode . org-fragtog-mode))

(provide 'init-org)
