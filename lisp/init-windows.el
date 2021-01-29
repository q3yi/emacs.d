;;; init-window.el -- windows managemnet configs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ace-window
  :ensure t
  :bind (("S-o" . ace-window)
	 ([remap other-window] . ace-window)))

(provide 'init-windows)
;;; init-windows.el ends here
