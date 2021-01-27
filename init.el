;;; init.el -- Load configuration at start time -*- lexical-binding: t -*-

;; add custom lisp filepath
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; change custom-file from 'init.el' to 'custom.el'
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; workaround for missing project-root function in project.el
;; (unless (fboundp 'project-root)
;;   (defun project-root (project) (car (project-roots project))))

(require 'init-network)

(require 'init-epla)
(require 'init-defaults)
(require 'init-gui)
(require 'init-themes)

(when (eq system-type 'darwin)
  (require 'init-osx))

(require 'init-crux)
(require 'init-ivy)
(require 'init-company)

(require 'init-projectile)
(require 'init-dired)
(require 'init-term)
(require 'init-ibuffer)

(require 'init-git)
(require 'init-smartparens)

(require 'init-golang)
(require 'init-rust)
;; (require 'init-lsp)

(require 'init-markdown)

(require 'init-org)
(require 'init-which-key)

;; drag-stuff
;; ace-window
;; flycheck or flymake

;; load custom.el if file exists
(when (and (file-exists-p custom-file) (display-graphic-p))
  (load custom-file))

;; start emacs server if no server process is running
(require 'server)
(unless server-process
  (server-start))

(provide 'init)
