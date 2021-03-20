;;; init-org.el --- Configurate org-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun qy/org-mode-setup ()
  "Setup config when org mode startup."
  (org-indent-mode)
  (auto-fill-mode t)
  (setq truncate-lines nil))

(defun qy/org-setup-chinese-latex ()
  "Use xelatex instead of pdflatex to support export org file to pdf."
  (require 'ox-latex)
  ;; use xelatex to support CJK
  (setq org-latex-compiler "xelatex")
  (setq org-latex-pdf-process '("xelatex %f"))
  (add-to-list 'org-latex-default-packages-alist '("" "ctex" t ("xelatex"))))

(defun qy/org-setup-task-system ()
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
	  (sequence "READING(r!)" "WAIT(w)" "|" "BREAK(b)" "FIN(f@/!)")))

  ;; auto save all org buffer when refile
  (advice-add 'org-refile :after 'org-save-all-org-buffers)
  
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60))

(use-package org
  :demand
  :ensure
  :hook (org-mode . qy/org-mode-setup)
  :custom
  ((org-ellipsis " ▾")
   ;; use svg for preview instead of png
   ;; may not be worked on system that do not support display svg
   (org-latex-create-formula-image-program 'dvisvgm))

  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   :map org-mode-map
   ("C-c C-q". counsel-org-tag))

  :config
  (qy/org-setup-task-system)
  (qy/org-setup-chinese-latex)
  (require 'org-tempo))

;; use org-fragtog to toggle org-mode latex preview
(use-package org-fragtog
  :after org
  :hook
  (org-mode . org-fragtog-mode))

;; export org as hugo compatible markdown
(use-package ox-hugo
  :ensure t
  :after org)

;; beautify headline bullets
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(provide 'init-org)
;;; init-org.el ends here
