;;; init-window.el -- windows managemnet configs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ace-window
  :ensure t
  :bind (("s-o" . ace-window)
	 ("s-s" . ace-swap-window)
	 ("s--" . split-window-below)
	 ("s-\\" . split-window-right)
	 ("s-1" . delete-other-windows)
	 ("s-w" . delete-window)
	 ([remap other-window] . ace-window)))

(provide 'init-windows)
;;; init-windows.el ends here
