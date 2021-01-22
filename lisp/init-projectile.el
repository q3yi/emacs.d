;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'f)
(require 'seq)

(defconst qy/projectile-search-folders '("~/.emacs.d"
					 "~/.config/dotfiles"
					 "~/200-craft/210-computer/repos"
					 "~/200-craft/270-ruc/repos"))

(use-package projectile
  :custom
  ((projectile-mode-line-prefix " Proj")
   (projectile-completion-system 'ivy)
   (projectile-switch-project-action #'projectile-dired))
  
  :bind-keymap
  ("C-c p" . projectile-command-map)
  
  :config
  (when-let (paths (seq-filter 'f-directory? qy/projectile-search-folders))
      (setq projectile-project-search-path paths))
  (when (executable-find "rg")
    (setq-default projectile-generic-command "rg --files --hidden"))
  (projectile-mode))

(when-let (paths (seq-filter 'f-directory? qy/projectile-search-folders))
      (setq projectile-project-search-path paths))

(use-package counsel-projectile
  :after (projectile counsel)
  :config
  (counsel-projectile-mode))

(provide 'init-projectile)
