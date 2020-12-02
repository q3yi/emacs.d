;;; init-git --- Configure magit -*- lexical-binding: t -*-

(use-package magit
  :ensure
  :bind (("C-x g" . magit-status)))

(provide 'init-git)
