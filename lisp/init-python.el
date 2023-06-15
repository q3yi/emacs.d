;;; init-python.el --- setup python development -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)
(require 'init-before-save)
(require 'project)

(defun q3yi-python-unittest-current ()
  "Run unittest on current python module."
  (interactive)
  (if (not (derived-mode-p 'python-mode 'python-ts-mode))
      (message "not in python mode")
    (let ((proj (project-current nil)))
      (if (not proj)
	  (message "not in any project")
	(let* ((proj-root (project-root proj))
	       (py-mod (file-name-base
			(string-replace "/" "." (file-relative-name (buffer-file-name) proj-root))))
	       (cmd (format "python3 -m unittest %s" py-mod)))
	  (let ((default-directory proj-root))
	    (async-shell-command cmd)))))))

;;; In order to start eglot, make sure pylsp or pyright was installed
(use-package python
  :if (treesit-available-p)
  :custom
  (python-shell-interpreter "python3")
  :hook
  (python-ts-mode . eglot-ensure)
  :bind (:map python-ts-mode-map
	      ("<f10>" . q3yi-python-unittest-current))
  :init
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
  :config
  (q3yi-add-before-save-hooks-within-mode 'python-ts-mode 'whitespace-cleanup))


(provide 'init-python)
;;; init-python.el ends here
