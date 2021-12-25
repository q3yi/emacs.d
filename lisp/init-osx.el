;;; init-osx.el --- Set keybindings on macOS -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package exec-path-from-shell
  :demand ;; ensure be executed once emacs started, since I set deferred as default in use-package
  :config
  (exec-path-from-shell-initialize))

(let ((set-if-exists (lambda (sym val) (when (boundp sym) (set sym val)))))
  (funcall set-if-exists 'mac-command-modifier 'meta)
  (funcall set-if-exists 'mac-right-command-modifier 'hyper)
  (funcall set-if-exists 'mac-option-modifier 'super))

(when (display-graphic-p)
  ;; (setq initial-frame-alist (quote ((fullscreen . maximized))))
  (when (fboundp 'mac-auto-operator-composition-mode)
      ;; mac-auto-operator-composition-mode only exists in emacs-mac
      (mac-auto-operator-composition-mode)))

(provide 'init-osx)
;;; init-osx.el ends here
