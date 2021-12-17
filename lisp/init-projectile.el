;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'f)
(require 'seq)

(defconst max/projectile-search-folders '("~/.emacs.d"
					 "~/.config/dotfiles"
					 "~/repos"))

(use-package projectile
  :custom
  ((projectile-mode-line-prefix " Proj")
   (projectile-completion-system 'ivy)
   (projectile-switch-project-action #'projectile-dired))
  
  :bind-keymap
  ("C-c p" . projectile-command-map)
  
  :config
  (when-let (paths (seq-filter 'f-directory? max/projectile-search-folders))
      (setq projectile-project-search-path paths))
  (when (executable-find "rg")
    (setq-default projectile-generic-command "rg --files --hidden"))
  (projectile-mode))

(use-package counsel-projectile
  :after (projectile counsel)
  :config
  (counsel-projectile-mode))

(provide 'init-projectile)
;;; init-projectile.el ends here

