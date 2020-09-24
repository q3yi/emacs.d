;;; init-gui.el -- Disable some default UIs -*- lexical-binding: t -*-

(setq inhibit-splash-screen t)
(setq use-file-dialog nil)
(setq use-dialog-box nil)

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(provide 'init-gui)
