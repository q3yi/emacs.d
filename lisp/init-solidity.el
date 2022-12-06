;;; init-solidity.el --- Configure solidity-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package solidity-mode
  :pin melpa-stable
  :custom (solidity-solc-path "/usr/local/bin/solcjs"))

(provide 'init-solidity)
;;; init-solidity.el ends here
