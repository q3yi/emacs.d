;;; init-completion.el --- Completion framework -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'init-package-util)

;; minibuffer completion
(use-package vertico
  :pin gnu
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
	      ("DEL" . vertico-directory-delete-char)
	      ("C-j" . vertico-exit-input))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package orderless
  :pin gnu
  :init
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
	completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :pin gnu
  :custom
  (marginalia-align 'right)
  :init
  (marginalia-mode))

(use-package savehist
  :init
  (savehist-mode))

;; corfu completion ui
(use-package corfu
  :pin gnu
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 2)
  ;; (corfu-auto-delay 0.0)

  :bind (:map corfu-map
	      ("s-SPC" . corfu-insert-separator)
	      ("M-q" . corfu-quick-complete)
	      ("C-q" . corfu-quick-insert))
  :init
  (global-corfu-mode))

(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
	 ("C-M-/" . dabbrev-expand))
  ;; Other useful Dabbrev configurations.
  :custom
  (dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\)\\'")))


(use-package cape
  :pin gnu
  :custom
  (cape-dabbrev-check-other-buffers t)
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file))

(provide 'init-completion)
;;; init-completion.el ends here
