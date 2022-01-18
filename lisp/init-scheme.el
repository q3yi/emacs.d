;;; init-scheme.el -- Config scheme language -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:
(require 'max-misc)

(use-package geiser
  :hook
  (scheme-mode . geiser-mode)
  :config
  ;; dirty fixes `tramp-tramp-file-p' is void function
  ;; `run-geiser' depend on `tramp-tramp-file-p' function in `tramp' package,
  ;; which is not loaded automatically.
  (require 'tramp))

(use-package geiser-guile
  :after geiser)

(defun max-load-flycheck-guile-checker ()
  "Load flycheck guile checker."
  (require  'flycheck-guile))

(use-package flycheck-guile
  :hook
  (scheme-mode . max-load-flycheck-guile-checker))

(add-hook 'scheme-mode-hook 'max-clean-whitespace-before-save)

(provide 'init-scheme)
;;; init-scheme.el ends here
