;;; init-osx.el

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :demand
  :config
  (exec-path-from-shell-initialize))

(setq mac-command-modifier 'meta)
(setq mac-right-command-modifier 'super)
(setq mac-option-modifier 'none)

(global-set-key (kbd "S-h") 'ns-do-hide-emacs)

(provide 'init-osx)
