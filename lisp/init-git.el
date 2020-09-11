;;; init-git --- Configure magit

(use-package magit
  :ensure
  :bind (("C-x g" . magit-status)))

(provide 'init-magit)
