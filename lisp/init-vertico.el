;;; init-vertico.el -- Setup completions -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'init-package-util)

(use-package vertico
  :bind
  (:map minibuffer-local-map
	("M-h" . backward-kill-word))
  :hook
  (after-init . vertico-mode))

(use-package vertico-directory
  :after vertico
  :ensure nil
    :bind (:map vertico-map
	      ("RET" . vertico-directory-enter)
	      ("DEL" . vertico-directory-delete-char))
    :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package orderless
  :init
  (setq completion-styles '(orderless)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :custom
  (marginalia-align 'right)
  :init
  (marginalia-mode))

(use-package savehist
  :init
  (savehist-mode))

(provide 'init-vertico)
;;; init-vertico.el ends here
