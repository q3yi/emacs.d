  ;;; init-rust.el --- Configure rust-mode -*- lexical-binding: t -*-

(use-package rust-mode
  :mode "\\.rs\\'"
  :config
  (setq rust-format-on-save t)
  :hook
  ('rust-mode-hook . (lambda() (setq indent-tabs-mode nil))))

(provide 'init-rust)
