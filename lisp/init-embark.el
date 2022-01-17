;;; init-embark.el -- Setup embark package -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(use-package embark
  :demand t
  :ensure t
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
	       '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
		 nil
		 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :demand t
  :ensure t
  :after (consult embark))

(provide 'init-embark)
;;; init-embark.el ends here
