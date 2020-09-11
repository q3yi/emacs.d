;;; init.el -- Load configuration at start time

;; add custom lisp filepath
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; change custom-file from 'init.el' to 'custom.el'
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))

;; workaround for missing project-root function in project.el
(unless (fboundp 'project-root)
  (defun project-root (project) (car (project-roots project))))

(require 'init-epla)
(require 'init-defaults)
(require 'init-gui)

(when *is-a-mac*
  (require 'init-osx))

(require 'init-crux)
(require 'init-ivy)
(require 'init-company)
(require 'init-golang)
(require 'init-rust)
(require 'init-lsp)
(require 'init-which-key)

;; drag-stuff
;; ace-window
;; flycheck or flymake

;; load custom.el if file exists
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)

