;;; init-dired.el --- Configurate dired mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package dired
  :ensure nil
  :config
  (setq dired-listing-switches "-alh"
	dired-dwim-target t))

(use-package dired-single
  :after dired
  :bind
  (:map dired-mode-map
	([remap dired-find-file] . dired-single-buffer)
	([remap dired-up-directory] . dired-single-up-directory)
	("b" . dired-single-up-directory)))

(use-package all-the-icons-dired
  :after (all-the-icons dired)
  :if (display-graphic-p)
  :hook (dired-mode . all-the-icons-dired-mode))

(provide 'init-dired)
;;; init-dired ends here


