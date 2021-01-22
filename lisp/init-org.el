;;; init-org.el --- Configurate org-mode -*- lexical-binding: t -*-

(require 'f)

(defun qy/org-mode-setup ()
  (org-indent-mode)
  (auto-fill-mode 1)
  (setq truncate-lines nil))

(defun qy/org-setup-chinese-latex ()
  "Use xelatex instead of pdflatex to support export org file to pdf"
  (require 'ox-latex)
  ;; use xelatex to support CJK
  (setq org-latex-compiler "xelatex")
  (setq org-latex-pdf-process '("xelatex %f"))
  (add-to-list 'org-latex-default-packages-alist '("" "ctex" t ("xelatex"))))

(defun qy/org-setup-task-system ()
  "Setup my task management system"

  (setq org-directory "~/OrgFiles"
	org-default-notes-file "Tasks.org"
	org-agenda-files (mapcar
			  (lambda (x) (f-join org-directory x))
			  '("Tasks.org" "Habits.org"))
	
	org-refile-targets '(("Archive.org" :maxlevel . 1))

	org-agenda-start-with-log-mode t
	org-log-done 'time
	org-log-into-drawer t)

  (advice-add 'org-refile :after 'org-save-all-org-buffers)
  
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60))

(use-package org
  :demand
  :ensure
  :hook (org-mode . qy/org-mode-setup)
  :custom ((org-ellipsis " ▾"))

  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   :map org-mode-map
   ("C-c C-q". counsel-org-tag))

  :config
  (qy/org-setup-task-system)
  (qy/org-setup-chinese-latex))

;; use org-fragtog to toggle org-mode latex preview
(use-package org-fragtog
  :after org
  :hook
  (org-mode . org-fragtog-mode))

;;export org as hugo compatible markdown
(use-package ox-hugo
  :ensure t
  :after org)

;; beautify headline bullets
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(provide 'init-org)
