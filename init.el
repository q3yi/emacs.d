;;; init.el -- Load configuration at start time -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; add custom lisp filepath
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; change custom-file from 'init.el' to 'custom.el'
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; workaround for missing project-root function in project.el
;; (unless (fboundp 'project-root)
;;   (defun project-root (project) (car (project-roots project))))

(require 'init-coding-system)

(require 'init-network)

(require 'init-epla)
(require 'init-defaults)
(require 'init-epa)
(require 'init-delight)
(require 'init-themes)

(when (eq system-type 'darwin)
  (require 'init-osx))

(require 'init-undo-tree)
(require 'init-crux)
(require 'init-ivy)
(require 'init-company)

(require 'init-git)
(require 'init-smartparens)
(require 'init-flycheck)

(require 'init-projectile)
(require 'init-dired)
(require 'init-term)
(require 'init-ibuffer)
(require 'init-windows)

(require 'init-lsp)

(require 'init-golang)
(require 'init-rust)
(require 'init-python)
(require 'init-lua)
(require 'init-fish)
(require 'init-html)
(require 'init-javascript) ;; TODO configurate when start js development

(require 'init-solidity)

(require 'init-markdown)

(require 'init-org)
(require 'init-which-key)

(require 'init-helper-funcs)

;; load custom.el if file exists
(when (and (file-exists-p custom-file) (display-graphic-p))
  (load custom-file))

;; start emacs server if no server process is running
(require 'server)
(unless (server-running-p server-name)
  (server-start))

(provide 'init)
;;; init.el ends here
