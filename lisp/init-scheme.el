;;; init-scheme.el -- Config scheme language -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'init-package-util)
(require 'init-before-save)

(use-package geiser
  :pin melpa-stable
  :hook
  (scheme-mode . geiser-mode)
  :config
  ;; dirty fixes `tramp-tramp-file-p' is void function
  ;; `run-geiser' depend on `tramp-tramp-file-p' function in `tramp' package,
  ;; which is not loaded automatically.
  (require 'tramp)
  (require 'whitespace)
  (q3yi-add-before-save-hooks-within-mode 'scheme-mode 'whitespace-cleanup))

(use-package geiser-guile
  :pin melpa-stable
  :after geiser)

(provide 'init-scheme)
;;; init-scheme.el ends here
