;;; init-markdown.el --- Use markdown mode for markdown files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("REDAME\\.md\\'" . gfm-mode)
	 ("\\.md\\'"       . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(provide 'init-markdown)
;;; init-markdown.el ends here
