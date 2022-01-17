;;; init.el --- Initialization -*- lexical-binding: t no-byte-compile: t -*-
;;
;; Author:  Qing YI <qingyi.tss@gmail.com>
;; URL:     https://github.com/tsingyi/emacs.d
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

(require 'init-epla)
(require 'init-defaults)
(require 'init-epa)
(require 'init-delight)
(require 'init-themes)

(when (eq system-type 'darwin)
  (require 'init-osx))

;; when emacs started in WSL
(when (getenv "WSL_DISTRO_NAME")
  (require 'init-rime))

(require 'init-undo-tree)
(require 'init-crux)
(require 'init-company)
(require 'init-yasnippet)

(require 'init-vertico)
(require 'init-consult)
(require 'init-embark)

(require 'init-git)
(require 'init-paredit)
(require 'init-flycheck)

(require 'init-dired)
(require 'init-term)
(require 'init-ibuffer)
(require 'init-windows)

(require 'init-pdf)

(require 'init-lsp)

(require 'init-golang)
(require 'init-rust)
(require 'init-python)
(require 'init-lua)
(require 'init-fish)
(require 'init-html)
(require 'init-javascript) ;; TODO configurate when start js development
(require 'init-scheme)

(require 'init-solidity)

(require 'init-markdown)

(require 'init-org)

(require 'init-helpful)
(require 'init-which-key)

(require 'init-helper-funcs)

;; enable pixel-scroll-precision-mode after emacs 29
(when (version< "29.0" emacs-version)
  (pixel-scroll-precision-mode))

;; load custom.el if file exists
(when (and (file-exists-p custom-file) (display-graphic-p))
  (load custom-file))

;; start emacs server if no server process is running
(require 'server)
(unless (server-running-p server-name)
  (server-start))

(provide 'init)
;;; init.el ends here
