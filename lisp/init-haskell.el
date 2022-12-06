;;; init-haskell.el -- config haskell development -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'init-package-util)
(require 'init-eglot)

(defun max-haskell-interactive-bring ()
  "Bring haskell interactive buffer.

Try to open a haskell interactive buffer, if minor mode
`interactive-haskell-mode' is not activated in current buffer,
then turn on the minor mode and open the REPL."

  (interactive)
  (unless (memq 'interactive-haskell-mode local-minor-modes)
    (interactive-haskell-mode 1))
  (haskell-interactive-bring))

(use-package haskell-mode
  :init
  (add-to-list 'completion-ignored-extensions ".hi")
  :custom
  ((haskell-process-suggest-remove-import-lines t)
   (haskell-process-auto-import-loaded-modules t)
   (haskell-process-show-overlays nil))
  :bind
  (:map haskell-mode-map
	("C-c C-c" . haskell-compile)
	("C-`" . max-haskell-interactive-bring))
  :hook
  ((haskell-mode . turn-on-haskell-decl-scan)
   (haskell-mode . eglot-ensure)
   (haskell-mode . subword-mode)
   (haskell-cabal-mode . subword-mode)))

(provide 'init-haskell)
;;; init-haskell.el ends here
