;;; init-combobulate.el -- combobulate on treesit -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(use-package combobulate
  :commands (combobulate-mode)
  :preface
  (setq combobulate-key-prefix "C-c o")
  :load-path ("plugins/combobulate"))

(provide 'init-combobulate)
;;; init-combobulate.el ends here
