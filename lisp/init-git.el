;;; init-git.el --- Configure magit -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(provide 'init-git)
;;; init-git.el ends here
