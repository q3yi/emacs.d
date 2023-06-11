;;; init-org.el --- Configurate org-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)
(require 'init-before-save)

(defvar q3yi-roam-directory "~/Roam" "Roam file home directory.")

(defvar q3yi-latex-preview-process-xdvsvgm
  '(xdvsvgm :progams
	    ("xelatex" "dvisvgm")
	    :discription "xdv > svg"
	    :message "you need install the programs: xelatex and dvisvgm."
	    :image-input-type "xdv"
	    :image-output-type "svg"
	    :image-size-adjust (1.7 . 1.5)
	    :latex-compiler ("xelatex -interaction nonstopmode -no-pdf -output-directory %o %f")
	    :image-converter ("dvisvgm %f -n -b min -c %S -o %O"))
  "Customed `org-latex-preview-process' use xelatex instead of latex.")

(use-package org
  :ensure nil
  :pin gnu
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture))
  :hook
  ((org-mode . (lambda ()
		 (org-indent-mode)
		 (auto-fill-mode t)
		 (setq truncate-lines nil))))
  :custom
  ((org-latex-compiler "xelatex")  ;; use xelatex to support CJK when export org file to pdf
   (org-latex-pdf-process '("xelatex %f"))
   (org-directory (file-name-concat q3yi-roam-directory "agenda"))
   (org-default-notes-file (expand-file-name "tasks.org" org-directory))
   (org-agenda-files (directory-files org-directory t "\\.org$"))
   (org-refile-targets '(("archive.org" :maxlevel . 1)))
   (org-agenda-start-with-log-mode t)

   (org-todo-keywords '((sequence "TODO" "DOING" "|" "DONE" "CANCEL")))

   (org-ellipsis " ▾")
   (org-return-follows-link t)

   (org-log-done 'time)
   (org-log-into-drawer t)

   (org-export-coding-system 'utf-8)
   (org-habit-graph-column 60))
  :config
  (require 'org-tempo)
  (require 'org-habit)
  (require 'ox-latex)
  (require 'whitespace)

  ;; use new svg for preview instead of png
  ;; may not be worked on system that do not support display svg
  (add-to-list 'org-preview-latex-process-alist q3yi-latex-preview-process-xdvsvgm)
  (setq org-preview-latex-default-process 'xdvsvgm)

  ;; add ctex package to exported latex file
  (add-to-list 'org-latex-default-packages-alist '("" "ctex" t ("xelatex")))

  ;; auto save all org buffer when refile
  (advice-add 'org-refile :after 'org-save-all-org-buffers)
  (add-to-list 'org-modules 'org-habit)
  (q3yi-add-before-save-hooks-within-mode 'org-mode 'whitespace-cleanup))

;; use org-fragtog to toggle org-mode latex preview
(use-package org-fragtog
  :pin melpa-stable
  :hook
  (org-mode . org-fragtog-mode))

;; export org as hugo compatible markdown
(use-package ox-hugo
  :pin melpa-stable
  :hook
  (org-mode . (lambda ()
		(with-eval-after-load 'ox
		  (require 'ox-hugo)))))

(use-package org-roam
  :pin melpa
  :init
  (setq org-roam-directory q3yi-roam-directory)
  (setq org-roam-db-location
	(file-name-concat q3yi-roam-directory ".org-roam" "org-roam.db"))
  :commands (org-roam-node-find)
  :custom
  ((org-roam-node-display-template (concat "${title:30}\t"
					   (propertize "${tags}" 'face 'org-tag)))
   (org-roam-complete-everywhere t))
  :bind
  (("C-c r l" . org-roam-buffer-toggle)
   ("C-c r i" . org-roam-node-insert)
   ("C-c r f" . org-roam-node-find)
   ("C-c r a" . org-roam-alias-add)
   ("C-c r t" . org-roam-tag-add)
   ("C-c r r" . org-roam-tag-remove))
  :config
  (setq org-roam-capture-templates
	'(("d" "default" plain "%?" :target
	   (file+head "%<%Y>/%<%m>/%<%s>-${slug}.org" "#+title: ${title}\n#+created_time: %<%Y-%m-%dT%H:%M:%S%:z>\n")
	   :unnarrowed t)))
  (org-roam-db-autosync-enable))

(provide 'init-org)
;;; init-org.el ends here
