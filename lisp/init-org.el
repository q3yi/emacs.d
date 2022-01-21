;;; init-org.el --- Configurate org-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)
(require 'org)
(require 'org-tempo)
(require 'org-habit)
(require 'ox-latex)

(defun max-org-mode-setup ()
  "Setup config when org mode startup."
  (org-indent-mode)
  (auto-fill-mode t)
  (setq truncate-lines nil)
  (add-hook 'before-save-hook 'whitespace-cleanup))

(add-hook 'org-mode-hook 'max-org-mode-setup)

;; define a new preview process, use xelatex instead of latex
(add-to-list 'org-preview-latex-process-alist
	     '(xdvsvgm :progams
		       ("xelatex" "dvisvgm")
		       :discription "xdv > svg"
		       :message "you need install the programs: xelatex and dvisvgm."
		       :image-input-type "xdv"
		       :image-output-type "svg"
		       :image-size-adjust (1.7 . 1.5)
		       :latex-compiler ("xelatex -interaction nonstopmode -no-pdf -output-directory %o %f")
		       :image-converter ("dvisvgm %f -n -b min -c %S -o %O")))

;; use new svg for preview instead of png
;; may not be worked on system that do not support display svg
(setq org-preview-latex-default-process 'xdvsvgm)

;; use xelatex to support CJK when export org file to pdf
(setq org-latex-compiler "xelatex")
(setq org-latex-pdf-process '("xelatex %f"))

;; add ctex package to exported latex file
(add-to-list 'org-latex-default-packages-alist '("" "ctex" t ("xelatex")))

(defvar max-roam-directory "~/Roam")

(setq org-directory (file-name-concat max-roam-directory "agenda")
      org-default-notes-file (expand-file-name "tasks.org" org-directory)
      org-agenda-files (directory-files org-directory t "\\.org$")
      org-refile-targets '(("archive.org" :maxlevel . 1))
      org-agenda-start-with-log-mode t

      org-ellipsis " ▾"
      org-return-follows-link t

      org-log-done 'time
      org-log-into-drawer t

      org-export-coding-system 'utf-8
      org-habit-graph-column 60)

;; auto save all org buffer when refile
(advice-add 'org-refile :after 'org-save-all-org-buffers)
(add-to-list 'org-modules 'org-habit)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(define-key org-mode-map (kbd "<s-return>") 'org-insert-heading)

;; use org-fragtog to toggle org-mode latex preview
(use-package org-fragtog
  :after org
  :hook
  (org-mode . org-fragtog-mode))

;; export org as hugo compatible markdown
(use-package ox-hugo
  :after ox
  :hook
  (org-mode . (lambda ()
		(with-eval-after-load 'ox
		  (require 'ox-hugo)))))

(use-package org-roam
  :init
  (setq org-roam-directory max-roam-directory)
  (setq org-roam-db-location
	(file-name-concat max-roam-directory ".org-roam" "org-roam.db"))
  :commands (org-roam-buffer-toggle
	     org-roam-node-find
	     org-roam-node-insert)
  :bind
  (("C-c r l" . org-roam-buffer-toggle)
   ("C-c r f" . org-roam-node-find)
   ("C-c r i" . org-roam-node-insert))
  :config
  (setq org-roam-capture-templates
	'(("d" "default" plain "%?" :target
	   (file+head "${slug}.org" "#+title: ${title}\n#+created_time: %<%Y-%m-%dT%H:%M:%S%:z>\n")
	   :unnarrowed t)))
  (org-roam-db-autosync-enable))

(provide 'init-org)
;;; init-org.el ends here
