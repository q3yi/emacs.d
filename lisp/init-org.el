;;; init-org.el --- Configurate org-mode -*- lexical-binding: t -*-

(require 'org)
(require 'ox-latex)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; enable automatic cut a long line into many lines on screen when
;; edit a *.org file.
(add-hook 'org-mode-hook
	  (lambda () (setq truncate-lines nil)))

;; use org-fragtog to toggle org-mode latex preview
(use-package org-fragtog
  :hook
  (org-mode . org-fragtog-mode))

;; use xelatex to support CJK
(setq org-latex-compiler "xelatex")

(add-to-list 'org-latex-default-packages-alist '("" "ctex" t ("xelatex")))

(provide 'init-org)
