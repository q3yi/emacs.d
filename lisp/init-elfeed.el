;;; init-elfeed.el -- setup elfeed -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'init-package-util)

(use-package elfeed
  :pin melpa-stable
  :commands elfeed
  :init
  (setq elfeed-db-directory "~/.elfeed"
	elfeed-enclosure-default-dir (file-name-concat
				      elfeed-db-directory
				      "encloures"))
  :bind
  (:map elfeed-search-mode-map
	;; The original binding "g" . elfeed-update--force somehow
	;; is not working in my emacs, so I change it to the interactive
	;; function.
	("g" . elfeed-update))
  :config
  (setq elfeed-search-filter "@1-week-ago")
  ;; Set proxy for curl
  (let ((proxy (assoc "http" url-proxy-services)))
    (when proxy
      (setq elfeed-curl-extra-arguments
	    (list "--proxy" (format "http://%s" (cdr proxy)))))))

(provide 'init-elfeed)
;;; init-elfeed.el ends here
