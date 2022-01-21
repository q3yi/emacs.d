;;; init-solidity.el --- Configure solidity-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package solidity-mode
  :custom (solidity-solc-path "/usr/local/bin/solc"))

(provide 'init-solidity)
;;; init-solidity.el ends here
