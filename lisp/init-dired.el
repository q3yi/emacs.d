;;; init-dired.el --- Configurate dired mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'dired)
(require 'dired-x)
(require 'ls-lisp)

(setq delete-by-moving-to-trash t)
(setq dired-kill-when-opening-new-dired-buffer t)

;; ATTENTION on macOS
;; ls on BSD system do not support --group-directories-first or --time-style
;; consider install GNU coreutils with homebrew
;; `brew install coreutils`
(setq dired-listing-switches "-AGlhv --group-directories-first --time-style=long-iso")
(setq dired-dwim-target t)
(setq dired-use-ls-dired t)
(setq dired-kill-when-opening-new-dired-buffer t)

(define-key dired-mode-map (kbd "b") 'dired-up-directory)

(add-hook 'dired-mode-hook 'hl-line-mode)


(provide 'init-dired)
;;; init-dired.el ends here
