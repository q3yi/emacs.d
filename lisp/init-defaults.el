;;; init-defaults.el -- Better default for build-in -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;;   Adjust some Emacs build-in configuration for better experience
;;;
;;; Code:

;; suppress backup file
(setq make-backup-files nil)

;; suppress anonying ring bell
(setq ring-bell-function 'ignore)

;; smart tab behavior
(setq tab-always-indent 'complete)

;; use y or n to replace yes and no
(defalias 'yes-or-no-p 'y-or-n-p)

;; show column number in modeline
(column-number-mode)

;; enable `global-so-long-mode', builtin package after emacs 27
;; handle performance for very long lines
(when (fboundp 'global-so-long-mode)
  (global-so-long-mode))

(provide 'init-defaults)
;;; init-defaults.el ends here
