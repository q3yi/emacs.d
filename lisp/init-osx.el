;;; init-osx.el --- Set keybindings on macOS -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)
(require 'max-misc)

(use-package exec-path-from-shell
  :pin melpa-stable
  :demand
  :config
  (exec-path-from-shell-initialize))

(max-set-value-if-symbol-exists 'mac-command-modifier 'meta)
(max-set-value-if-symbol-exists 'mac-right-command-modifier 'hyper)
(max-set-value-if-symbol-exists 'mac-option-modifier 'super)

(when (display-graphic-p)
  ;; (setq initial-frame-alist (quote ((fullscreen . maximized))))
  (when (fboundp 'mac-auto-operator-composition-mode)
      ;; mac-auto-operator-composition-mode only exists in emacs-mac
      (mac-auto-operator-composition-mode)))

(provide 'init-osx)
;;; init-osx.el ends here
