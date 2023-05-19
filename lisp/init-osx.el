;;; init-osx.el --- Set keybindings on macOS -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package exec-path-from-shell
  :pin melpa-stable
  :demand
  :config
  (exec-path-from-shell-initialize))

(when (boundp 'mac-command-modifier)
  (setq mac-command-modifier 'meta
	mac-right-command-modifier 'hyper
	mac-option-modifier 'super))

(when (display-graphic-p)
  ;; (setq initial-frame-alist (quote ((fullscreen . maximized))))
  (when (fboundp 'mac-auto-operator-composition-mode)
    ;; mac-auto-operator-composition-mode only exists in emacs-mac
    (mac-auto-operator-composition-mode)))

(provide 'init-osx)
;;; init-osx.el ends here
