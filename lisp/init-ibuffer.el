;;; init-ibuffer.el --- Tweak ibuffer -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ibuffer
  :ensure nil
  :bind (("C-x C-b" . ibuffer)))

(use-package ibuffer-vc
  :hook (ibuffer . ibuffer-vc-set-filter-groups-by-vc-root))

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
