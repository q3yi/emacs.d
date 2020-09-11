;;; init-gui.el

(setq inhibit-splash-screen t)
(setq use-file-dialog nil)
(setq use-dialog-box nil)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(provide 'init-gui)
