;;; init-javascript.el --- Support for Javascript, typescrpit -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-package-util)

(when (treesit-available-p)

  (use-package js
    :mode (("\\(\\.js[mx]\\|\\.har\\)\\'" . js-ts-mode)))

  (use-package typescript-ts-mode
    :mode (("\\.tsx\\'" . tsx-ts-mode)
	   ("\\.ts\\'" . typescript-ts-mode))))

(provide 'init-javascript)
;;; init-javascript.el ends here
