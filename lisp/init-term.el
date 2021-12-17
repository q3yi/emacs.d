;;; init-term.el --- Configurate term mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; setup vterm
(use-package vterm
  :commands vterm
  :custom
  ((vterm-use-vterm-prompt-detection-method t)
   (vterm-buffer-name-string "vterm %s")
   (vterm-max-scrollback 10000))
  :bind (:map vterm-mode-map
	      ("C-c C-c" . vterm-send-C-c)))

;; configurate eshell
(use-package eshell
  :custom
  ((eshell-history-size 10000)
   (eshell-buffer-maxium-lines 10000)
   (eshell-hist-ignoredups t)
   (eshell-scroll-to-bottom-on-input t)))

(provide 'init-term)
;;; init-term.el ends here
