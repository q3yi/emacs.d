;;; init-paredit.el -- Config paredit -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'init-package-util)

(use-package paredit
  :pin melpa-stable
  :delight " Par"
  :bind
  (:map paredit-mode-map
	("M-<up>" . paredit-splice-sexp)
	("M-<down>" . paredit-wrap-round)
	("C-<right>" . paredit-forward-slurp-sexp)
	("C-<left>" . paredit-backward-slurp-sexp)
	("M-<left>" . paredit-backward-barf-sexp)
	("M-<right>" . paredit-forward-barf-sexp))
  :hook ((emacs-lisp-mode . paredit-mode)
	 (scheme-mode . paredit-mode))
  :config
  (define-key paredit-mode-map (kbd "M-s") nil)
  (define-key paredit-mode-map (kbd "M-?") nil))

(defun max-turn-off-electric-pair-mode ()
  "Turn off `electric-pair-mode'."
  (electric-pair-mode 0))

;; Turn on `electric-pair-mode' on `text-mode' and `prog-mode'
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'text-mode-hook 'electric-pair-mode)

;; Disable `electric-pair-mode' when paredit is enabled
(add-hook 'paredit-mode-hook 'max-turn-off-electric-pair-mode)

(use-package rainbow-delimiters
  :pin melpa-stable
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-paredit)
;;; init-paredit.el ends here
