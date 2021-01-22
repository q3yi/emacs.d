;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defconst qy/projectile-search-folders '("~/.emacs.d"
					 "~/.config/dotfiles"
					 "~/200-craft/210-computer/repos"
					 "~/200-craft/270-ruc/repos"))

(use-package projectile			
  :config
  (projectile-mode)
  :custom
  ((projectile-mode-line-prefix " Proj")
   (projectile-completion-system 'ivy)
   (projectile-project-search-path qy/projectile-search-folders)
   (projectile-switch-project-action #'projectile-dired))
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package counsel-projectile
  :after (projectile counsel)
  :config
  (counsel-projectile-mode))

(provide 'init-projectile)


