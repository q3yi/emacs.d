;;; init-window.el -- packages and configs for window management -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:
(require 'init-package-util)
(require 'init-consult)

(require 'project)

(use-package ace-window
  :pin melpa
  :ensure t
  :custom
  ((aw-dispatch-always t)
   (aw-minibuffer-flag t))
  :init

  (defun q3yi-aw-switch-buffer-other-window (window)
    "Switch buffer in WINDOW."
    (aw-switch-to-window window)
    (unwind-protect (consult-buffer) (aw-flip-window)))

  (setq aw-dispatch-alist
	'((?x aw-delete-window "Delete window")
	  (?k (lambda (window) (aw-delete-window window t)) "Delete window and buffer")
	  (?s aw-swap-window "Swap windows")
	  (?m aw-move-window "Move window")
	  (?c aw-copy-window "Copy window")
	  (?b q3yi-aw-switch-buffer-other-window "Switch buffer in selected window")
	  (?= aw-split-window-fair "Split fair window")
	  (?- aw-split-window-vert "Split window horizontally")
	  (?\\ aw-split-window-horz "Split window vertically")
	  (?n delete-other-windows "Keep only one window")
	  (?h aw-show-dispatch-help)))
  :bind (("M-o" . ace-window)))

(use-package popper
  :pin melpa
  :ensure t
  :bind (("M-`" . popper-toggle-latest)
	 ("M--" . popper-cycle)
	 ("C-`" . popper-cycle)
	 ("C-M-`" . popper-toggle-type)
	 ("C-M--" . popper-toggle-type))
  :init
  (setq popper-group-function #'popper-group-by-project)
  (setq popper-reference-buffers
	'("^\\*Warnings\\*"
	  "^\\*Compile-Log\\*"
	  "^\\*Backtrace\\*"
	  "\\*Messages\\*"
	  "^\\*Apropos"
	  "^Calc:"
	  "Output\\*$"
	  "\\*Shell Command Output\\*"
	  "\\*Async Shell Command\\*"
	  "\\*Completions\\*"
	  help-mode
	  compilation-mode
	  "^\\*Embark Collect:.*\\*$" embark-collect-mode
	  "^\\*Embark Export:.*\\*$" grep-mode
	  "^\\*eshell.*\\*$" eshell-mode
	  "^\\*vterm.*\\*$"  vterm-mode))
  (popper-mode +1)
  (popper-echo-mode +1))

(provide 'init-window)
;;; init-window.el ends here
