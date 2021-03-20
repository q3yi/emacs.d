;;; init-osx.el --- Set keybindings on macOS -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :demand ;; ensure be executed once emacs started, since I set deferred as default in use-package
  :config
  (exec-path-from-shell-initialize))

(setq mac-command-modifier 'meta)
(setq mac-right-command-modifier 'hyper)
(setq mac-option-modifier 'super)

;; use fullscreen when start on mac
(when (display-graphic-p)
  ;; (setq initial-frame-alist (quote ((fullscreen . maximized))))
  (mac-auto-operator-composition-mode))

(provide 'init-osx)
;;; init-osx.el ends here
