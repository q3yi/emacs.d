;;; init-lua.el --- Support lua programming -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package lua-mode
  :custom
  ((lua-indent-nested-block-content-align nil)
   (lua-indent-close-paren-align nil)))

(provide 'init-lua)
;;; init-lua.el ends here
