;;; init-rime.el --- Setup rime input method -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package rime
  :pin melpa-stable
  :custom
  (default-input-method "rime")
  (rime-show-candidate 'popup))

(provide 'init-rime)
;;; init-rime.el ends here
