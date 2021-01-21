;;; init-osx.el --- Set keybindings on macOS -*- lexical-binding: t -*-

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :demand ;; ensure be executed once emacs started, since I set deferred as default in use-package
  :config
  (exec-path-from-shell-initialize))

(setq mac-command-modifier 'meta)
(setq mac-right-command-modifier 'super)
(setq mac-option-modifier 'none)

(global-set-key (kbd "S-h") 'ns-do-hide-emacs)

;; use fullscreen when start on mac
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(provide 'init-osx)
