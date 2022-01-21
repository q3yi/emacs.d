;;; init-elfeed.el -- setup elfeed -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'init-package-util)

(use-package elfeed
  :commands elfeed
  :init
  (setq elfeed-db-directory "~/.elfeed"
	elfeed-enclosure-default-dir (file-name-concat
				      elfeed-db-directory
				      "encloures"))
  :config
  (setq elfeed-search-filter "@1-week-ago"))

(provide 'init-elfeed)
;;; init-elfeed.el ends here
