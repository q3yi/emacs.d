;;; init-ibuffer.el --- Tweak ibuffer -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package ibuffer
  :ensure nil
  :bind (("C-x C-b" . ibuffer)))

(use-package ibuffer-vc
  :pin melpa-stable
  :hook (ibuffer . ibuffer-vc-set-filter-groups-by-vc-root))

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
