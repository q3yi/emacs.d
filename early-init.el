;;; early-init.el --- Early Init File -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Initialise installed packages
(setq package-enable-at-startup t)

;; (setq frame-inhibit-implied-resize t)

(setq inhibit-splash-screen t)
(setq inhibit-startup-screen t)


(setq use-file-dialog nil)
(setq use-dialog-box nil)

(setq frame-resize-pixelwise t)

;; adjust
(setq gc-cons-threshold (* 256 1024 1024))
(setq read-process-output-max (* 1024 1024))

;; disable GUI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq native-comp-async-report-warnings-errors 'silent)

;;; early-init.el ends here
