;;; init-term.el --- Configurate term mode -*- lexical-binding: t -*-

;; setup vterm
(use-package vterm
  :commands vterm
  :custom
  ((vterm-use-vterm-prompt-detection-method t)
   (vterm-buffer-name-string "vterm %s")
   (vterm-max-scrollback 10000)))

;; configurate eshell
(use-package eshell
  :custom
  ((eshell-history-size 10000)
   (eshell-buffer-maxium-lines 10000)
   (eshell-hist-ignoredups t)
   (eshell-scroll-to-bottom-on-input t)))

(provide 'init-term)
