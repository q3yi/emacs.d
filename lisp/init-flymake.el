;;; init-flymake.el -- Config flymake -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'flymake)

(add-hook 'prog-mode-hook #'flymake-mode)

(provide 'init-flymake)
;;; init-flymake.el ends here
