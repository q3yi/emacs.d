;;; init-scroll.el -- imporve scroll experience -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

;; enable pixel-scroll-precision-mode after emacs 29
(when (version< "29.0" emacs-version)
  (pixel-scroll-precision-mode))

(defun max-scroll-up-line-and-forward ()
  "Scroll one line up, and move cursor to next line."
  (interactive)
  (scroll-up-line)
  (forward-line))

(defun max-scroll-down-line-and-backward ()
  "Scroll one line down, and move cursor to previous line."
  (interactive)
  (scroll-down-line)
  (forward-line -1))

;; shortcuts are defined in Dvorak keyboard layout
;; so "s-c" means "s-i", "s-t" means "s-k" in QWER keyboard
(global-set-key (kbd "s-c") 'max-scroll-down-line-and-backward)
(global-set-key (kbd "s-t") 'max-scroll-up-line-and-forward)

(setq scroll-preserve-screen-position nil)

(provide 'init-scroll)
;;; init-scroll.el ends here
