;;; init-epa.el -- Configuration for epa and gpg -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package epa
  :ensure nil
  :config
  (setq epg-pinentry-mode 'loopback))

(provide 'init-epa)
;;; init-epa.el ends here
