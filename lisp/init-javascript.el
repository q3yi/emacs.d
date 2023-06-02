;;; init-javascript.el --- Support for Javascript, typescrpit -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-package-util)

(when (treesit-available-p)
  (add-to-list 'major-mode-remap-alist '(js2-mode . js-ts-mode))
  (add-to-list 'major-mode-remap-alist '(typescript-mode . typescript-ts-mode))
  (add-to-list 'major-mode-remap-alist '(json-mode . json-ts-mode)))

(provide 'init-javascript)
;;; init-javascript.el ends here
