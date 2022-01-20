;;; init-ace-window.el -- windows managemnet configs -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;;   `ace-window' package provide powerful way to manage buffer
;;;   windows, especially together with `embark'.
;;;
;;;   See, https://karthinks.com/software/fifteen-ways-to-use-embark/
;;;
;;; Code:

(use-package ace-window
  :ensure t
  :bind (("s-o" . ace-window)
	 ("s-s" . ace-swap-window)
	 ("s-1" . delete-other-windows)
	 ("s-w" . delete-window)
	 ("s--" . split-window-below)
	 ("s-\\" . split-window-right)
	 ([remap other-window] . ace-window)))

(provide 'init-ace-window)
;;; init-ace-window.el ends here
