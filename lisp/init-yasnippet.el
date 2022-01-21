;;; init-yasnippet.el -- Add yasnippet -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package yasnippet
  :delight (yas-minor-mode)
  :hook (company-mode . yas-minor-mode-on)
  :config
  (dolist (dir yas-snippet-dirs)
    (when (stringp dir)
      (yas-load-directory dir t))))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here.
