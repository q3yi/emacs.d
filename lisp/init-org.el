;;; init-org.el --- Configurate org-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun max/org-mode-setup ()
  "Setup config when org mode startup."
  (org-indent-mode)
  (auto-fill-mode t)
  (setq truncate-lines nil))

(defun max/org-use-xelatex ()
  "Use xelatex instead of pdflatex to support export org file to pdf and preview latex in org file."
  (require 'ox-latex)
  ;; define a new preview process, use xelatex instead of latex
  (add-to-list 'org-preview-latex-process-alist '(xdvsvgm :progams
							  ("xelatex" "dvisvgm")
							  :discription "xdv > svg"
							  :message "you need install the programs: xelatex and dvisvgm."
							  :image-input-type "xdv"
							  :image-output-type "svg"
							  :image-size-adjust (1.7 . 1.5)
							  :latex-compiler ("xelatex -interaction nonstopmode -no-pdf -output-directory %o %f")
							  :image-converter ("dvisvgm %f -n -b min -c %S -o %O")))
  ;; use svg for preview instead of png
  ;; may not be worked on system that do not support display svg
  (setq org-preview-latex-default-process 'xdvsvgm)
  ;; use xelatex to support CJK when export org file to pdf
  (setq org-latex-compiler "xelatex")
  (setq org-latex-pdf-process '("xelatex %f"))
  (add-to-list 'org-latex-default-packages-alist '("" "ctex" t ("xelatex"))))

(defun max/org-setup-task-system ()
  "Setup my task management system."
  (setq org-directory "~/OrgFiles"
	org-default-notes-file (expand-file-name "Tasks.org" org-directory)
	org-agenda-files (directory-files org-directory t "\\.org$")

	org-refile-targets '(("Archive.org" :maxlevel . 1))

	org-agenda-start-with-log-mode t
	org-log-done 'time
	org-log-into-drawer t
	org-export-coding-system 'utf-8)

  (setq org-todo-keywords
	'((sequence "TODO(t)" "|" "DONE(d!/!)")
	  (sequence "READING(r!)" "WAIT(w)" "|" "BREAK(b)" "FIN(f!/!)")))

  ;; auto save all org buffer when refile
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60))

(use-package org
  :demand
  :ensure
  :hook (org-mode . max/org-mode-setup)
  :custom
  ((org-ellipsis " ▾")
   (org-return-follows-link t))

  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   :map org-mode-map
   ("C-c C-q" . counsel-org-tag)
   ("<s-return>" . org-insert-heading))

  :config
  (max/org-setup-task-system)
  (max/org-use-xelatex)
  (require 'org-tempo))

;; use org-fragtog to toggle org-mode latex preview
(use-package org-fragtog
  :after org
  :hook
  (org-mode . org-fragtog-mode))

;; export org as hugo compatible markdown
(use-package ox-hugo
  :ensure t
  :after ox)

;; beautify headline bullets
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t
	org-roam-directory (file-truename "~/box")
	org-roam-db-location (file-truename "~/box/roam/org-roam.db"))
  :bind
  (("C-c o l" . org-roam-buffer-toggle)
   ("C-c o f" . org-roam-node-find)
   ("C-c o i" . org-roam-node-insert))
  :config (org-roam-db-autosync-enable))

(provide 'init-org)
;;; init-org.el ends here
