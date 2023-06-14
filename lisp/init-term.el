;;; init-term.el --- Configurate term mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-package-util)

;; setup vterm
(use-package vterm
  :commands  (vterm vterm-send-key vterm-send-next-key)
  :custom
  ((vterm-use-vterm-prompt-detection-method t)
   (vterm-buffer-name-string "vterm %s")
   (vterm-max-scrollback 10000))
  :bind
  (:map vterm-mode-map
	("C-q" . vterm-send-next-key)
	:map project-prefix-map
	("t" . vterm))
  :config
  (define-key vterm-mode-map (kbd "M-`") nil t)
  (define-key vterm-mode-map (kbd "<f1>") nil t)
  (define-key vterm-mode-map (kbd "M--") nil t))

;; configurate eshell
(use-package eshell
  :custom
  ((eshell-history-size 10000)
   (eshell-buffer-maxium-lines 10000)
   (eshell-hist-ignoredups t)
   (eshell-scroll-to-bottom-on-input t)))

(provide 'init-term)
;;; init-term.el ends here
