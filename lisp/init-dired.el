;;; init-dired.el --- Configurate dired mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'dired)
(require 'dired-x)

(setq dired-listing-switches "-alh")
(setq dired-dwim-target t)

(defun max/dired-find-file ()
  "Extend `dired-find-file', so it open directory in current buffer."
  (interactive)
  (let ((file-name (dired-get-file-for-visit)))
    (if (file-directory-p file-name)
	(progn
	  (set-buffer-modified-p nil)
	  (find-alternate-file file-name))
      (dired--find-possibly-alternative-file file-name))))

(defun max/dired-up-directory ()
  "Vist parent directory in same buffer."
  (interactive)
  (set-buffer-modified-p nil)
  (find-alternate-file ".."))

(define-key dired-mode-map [remap dired-find-file] 'max/dired-find-file)
(define-key dired-mode-map [remap dired-up-directory] 'max/dired-up-directory)
(define-key dired-mode-map (kbd "b") 'max/dired-up-directory)

(use-package all-the-icons-dired
  :after (all-the-icons dired)
  :if (display-graphic-p)
  :delight
  :hook (dired-mode . all-the-icons-dired-mode))

(provide 'init-dired)
;;; init-dired.el ends here


