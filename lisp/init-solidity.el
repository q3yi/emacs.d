;;; init-solidity.el --- Configure solidity-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(defun solidity-save-and-format-buffer ()
  "Format current with forge fmt."
  (interactive)
  (save-buffer)
  (shell-command (format "forge fmt %s" (buffer-file-name)))
  (revert-buffer nil t)
  (message "Save and format %s" (buffer-file-name)))

(use-package solidity-mode
  :pin melpa-stable
  :custom (solidity-solc-path "/usr/local/bin/solc")
  :bind (:map solidity-mode-map
	      ("C-c \\" . solidity-save-and-format-buffer))
  :hook ((solidity-mode . (lambda () (setq-local c-basic-offset 4)))))

(provide 'init-solidity)
;;; init-solidity.el ends here
