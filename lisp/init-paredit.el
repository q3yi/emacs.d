;;; init-paredit.el -- Config paredit -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(use-package paredit
  :delight " Par"
  :bind
  (:map paredit-mode-map
	("M-<up>" . paredit-splice-sexp)
	("M-<down>" . paredit-wrap-round))
  :config
  (define-key paredit-mode-map (kbd "M-s") nil)
  (define-key paredit-mode-map (kbd "M-?") nil)
  :hook
  (emacs-lisp-mode . paredit-mode)
  (scheme-mode . paredit-mode))

(defun max-turn-off-electric-pair-mode ()
  "Turn off `electric-pair-mode'."
  (electric-pair-mode 0))

;; Turn on `electric-pair-mode' on `text-mode' and `prog-mode'
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'text-mode-hook 'electric-pair-mode)

;; Disable `electric-pair-mode' when paredit is enabled
(add-hook 'paredit-mode-hook 'max-turn-off-electric-pair-mode)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-paredit)
;;; init-paredit.el ends here


