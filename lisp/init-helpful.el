;;; init-helpful.el -- better help info buffer -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'init-package-util)

(use-package helpful
  :bind (([remap describe-function] . helpful-callable)
	 ([remap describe-command] . helpful-command)
	 ([remap describe-variable] . helpful-variable)
	 ([remap describe-key] . helpful-key)))

(provide 'init-helpful)
;;; init-helpful.el ends here
