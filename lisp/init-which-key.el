;;; init-which-key.el --- Load which-key package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package which-key
  :defer nil
  :delight
  :config (which-key-mode))

(provide 'init-which-key)
;;; init-which-key.el ends here
