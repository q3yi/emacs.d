;;; init-git.el --- Configure magit -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package magit
  :pin melpa-stable
  :ensure t
  :bind (("C-x g" . magit-status)))

(provide 'init-git)
;;; init-git.el ends here
