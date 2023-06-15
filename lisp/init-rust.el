;;; init-rust.el --- Configure rust-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-package-util)
(require 'init-eglot)
(require 'project)

(defun q3yi-rust-unittest-current ()
  "Run unittest on current python module."
  (interactive)
  (if (not (derived-mode-p 'rust-ts-mode))
      (message "not in python mode")
    (let ((proj (project-current nil)))
      (if (not proj)
	  (message "not in any project")
	(let* ((proj-root (project-root (project-current)))
	       (rs-mod (string-replace
			"src::" ""
			(file-name-base (string-replace
					 "/" "::"
					 (file-relative-name (buffer-file-name) proj-root)))))
	       (cmd (format "CARGO_TERM_COLOR=never cargo test --lib %s -- show-output" rs-mod)))
	  (let ((default-directory proj-root))
	    (async-shell-command cmd)))))))

(use-package rust-ts-mode
  :if (treesit-available-p)
  :mode (("\\.rs\\'" . rust-ts-mode))
  :bind (:map rust-ts-mode-map
	      ("<f10>" . q3yi-rust-unittest-current))
  :hook
  ((rust-ts-mode . eglot-ensure)))

(provide 'init-rust)
;;; init-rust.el ends here
