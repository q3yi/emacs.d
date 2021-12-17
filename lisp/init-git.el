;;; init-git.el --- Configure magit -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package magit
  :ensure
  :bind (("C-x g" . magit-status)))

(provide 'init-git)
;;; init-git.el ends here
