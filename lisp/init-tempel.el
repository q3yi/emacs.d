;;; init-tempel.el --- Load tempel.el package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

;; Configure Tempel
(use-package tempel
  :pin gnu
  :custom
  (tempel-trigger-prefix "<")
  (tempel-path (expand-file-name "[!.]*.eld"
				 (concat user-emacs-directory "/templates")))

  :bind (("M-+" . tempel-complete) ;; Alternative tempel-expand
	 ("M-*" . tempel-insert))

  :init

  ;; Setup completion at point
  (defun tempel-setup-capf ()
    ;; Add the Tempel Capf to `completion-at-point-functions'.
    ;; `tempel-expand' only triggers on exact matches. Alternatively use
    ;; `tempel-complete' if you want to see all matches, but then you
    ;; should also configure `tempel-trigger-prefix', such that Tempel
    ;; does not trigger too often when you don't expect it. NOTE: We add
    ;; `tempel-expand' *before* the main programming mode Capf, such
    ;; that it will be tried first.
    (setq-local completion-at-point-functions
		(cons #'tempel-complete
		      completion-at-point-functions)))

  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf))

;; Optional: Add tempel-collection.
;; The package is young and doesn't have comprehensive coverage.
(use-package tempel-collection
  :after tempel)

(provide 'init-tempel)
;;; init-tempel.el ends here.
