;;; init-epa.el -- Configuration for epa and gpg -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package epa
  :ensure nil
  :config
  (setq epg-pinentry-mode 'loopback))

(provide 'init-epa)
;;; init-epa.el ends here
