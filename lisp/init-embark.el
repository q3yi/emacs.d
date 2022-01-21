;;; init-embark.el -- Setup embark package -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'init-package-util)
(require 'init-ace-window)

(use-package embark
  :demand t
  :ensure t
  :bind (("C-." . embark-act)
	 ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  (add-to-list 'display-buffer-alist
	       '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
		 nil
		 (window-parameters (mode-line-format . none)))))

;; See. https://karthinks.com/software/fifteen-ways-to-use-embark/
(eval-when-compile
  (defmacro max-embark-open-with-ace (fn)
    `(defun ,(intern (concat "max-embark-ace-" (symbol-name fn))) ()
       (interactive)
       (with-demoted-errors "%s"
	 (require 'ace-window)
	 (let ((aw-dispatch-always t))
	   (aw-switch-to-window (aw-select nil))
	   (call-interactively (symbol-function ',fn)))))))

(define-key embark-file-map     (kbd "o") (max-embark-open-with-ace find-file))
(define-key embark-buffer-map   (kbd "o") (max-embark-open-with-ace switch-to-buffer))
(define-key embark-bookmark-map (kbd "o") (max-embark-open-with-ace bookmark-jump))
(define-key embark-symbol-map (kbd "h") 'helpful-symbol)
(define-key embark-region-map (kbd "d") 'dictionary-search)

(use-package embark-consult
  :demand t
  :ensure t
  :after (consult embark))

(provide 'init-embark)
;;; init-embark.el ends here
