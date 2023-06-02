;;; init-toml.el --- Support TOML files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package toml-ts-mode
  :if (treesit-available-p)
  :mode (("\\.toml\\'" . toml-ts-mode)))

(provide 'init-toml)
;;; init-toml.el ends here
