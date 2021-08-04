;;; init-solidity.el --- Configure solidity-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package solidity-mode
  :custom (solidity-solc-path "/usr/local/bin/solc"))

(use-package solidity-flycheck
  :after solidity-mode
  :ensure t
  :custom (solidity-flycheck-solium-checker-active t))

(provide 'init-solidity)
;;; init-solidity.el ends here
