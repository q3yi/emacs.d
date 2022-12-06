;;; init-scheme.el -- Config scheme language -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'init-package-util)
(require 'max-misc)

(use-package geiser
  :pin melpa-stable
  :hook
  (scheme-mode . geiser-mode)
  (scheme-mode . max-clean-whitespace-befor-save)
    :config
  ;; dirty fixes `tramp-tramp-file-p' is void function
  ;; `run-geiser' depend on `tramp-tramp-file-p' function in `tramp' package,
  ;; which is not loaded automatically.
  (require 'tramp))

(use-package geiser-guile
  :pin melpa-stable
  :after geiser)

(provide 'init-scheme)
;;; init-scheme.el ends here
