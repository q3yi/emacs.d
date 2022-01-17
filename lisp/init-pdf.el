;;; init-pdf.el -- Install pdf-tools -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(use-package pdf-tools
  :defer t
  :commands (pdf-view-mode pdf-tools-install)
  :mode ("\\.[pP][dD][dF]\\'" . pdf-view-mode)
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install)
  (setq pdf-view-use-scaling t))

(provide 'init-pdf)
;;; init-pdf.el ends here
