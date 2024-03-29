;;; init.el --- Initialization -*- lexical-binding: t no-byte-compile: t -*-
;;
;; Author:  Qing YI <qingyi.tss@gmail.com>
;; URL:     https://github.com/q3yi/emacs.d
;;
;; These files are not part of GNU Emacs.
;;
;;; License: MIT

;;; Commentary:
;;; Code:

;; add custom lisp filepath
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; change custom-file from 'init.el' to 'custom.el'
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-coding-system)

;; setup a local proxy server
(require 'init-proxy)
(require 'init-package-util)

(require 'init-defaults)
(require 'init-scroll)
(require 'init-tab)
(require 'init-epa)
(require 'init-delight)
(require 'init-themes)

(require 'init-project)
(require 'init-window)

(when (eq system-type 'darwin)
  (require 'init-osx))

;; when emacs started in WSL
(when (getenv "WSL_DISTRO_NAME")
  (require 'init-rime))

(require 'init-consult)
(require 'init-completion)
(require 'init-embark)
(require 'init-pro-editing)

(require 'init-dired)
(require 'init-term)

(require 'init-isearch)
(require 'init-ibuffer)
(require 'init-avy)
(require 'init-undo-tree)

(require 'init-tempel)
(require 'init-git)
(require 'init-paredit)
(require 'init-flymake)

(require 'init-org)
(require 'init-elfeed)

;; programming language without lsp configuration
(require 'init-emacs-lisp)
(require 'init-fish)
;;(require 'init-scheme)
(require 'init-markdown)
(require 'init-lua)
(require 'init-yaml)
(require 'init-toml)

(require 'init-solidity)

;; programming language with lsp enabled
(require 'init-eglot)
(require 'init-golang)
(require 'init-rust)
(require 'init-python)
(require 'init-haskell)
(require 'init-dart)
(require 'init-javascript) ;; TODO configurate when start js development

(require 'init-helpful)

;; load custom.el if file exists
(when (file-exists-p custom-file)
  (load custom-file))

;; start emacs server if no server process is running
(require 'server)
(unless (server-running-p server-name)
  (server-start))

(provide 'init)
;;; init.el ends here
