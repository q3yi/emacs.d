;;; init-dired.el --- Configurate dired mode -*- lexical-binding: t -*-

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


