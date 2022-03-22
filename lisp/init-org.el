;;; init-org.el --- Configurate org-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(defvar max-roam-directory "~/Roam" "Roam file home directory.")

(defvar max-latex-preview-process-xdvsvgm
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

(defun max-org-mode-setup ()
    "Setup config when org mode startup."
    (org-indent-mode)
    (auto-fill-mode t)
    (setq truncate-lines nil)
    (add-hook 'before-save-hook #'whitespace-cleanup))

(use-package org
  :ensure nil
  :pin gnu
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture))
  :hook
  ((org-mode . max-org-mode-setup))
  :custom
  ((org-latex-compiler "xelatex")  ;; use xelatex to support CJK when export org file to pdf
   (org-latex-pdf-process '("xelatex %f"))
   (org-directory (file-name-concat max-roam-directory "agenda"))
   (org-default-notes-file (expand-file-name "tasks.org" org-directory))
   (org-agenda-files (directory-files org-directory t "\\.org$"))
   (org-refile-targets '(("archive.org" :maxlevel . 1)))
   (org-agenda-start-with-log-mode t)

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

  ;; use new svg for preview instead of png
  ;; may not be worked on system that do not support display svg
  (add-to-list 'org-preview-latex-process-alist max-latex-preview-process-xdvsvgm)
  (setq org-preview-latex-default-process 'xdvsvgm)

  ;; add ctex package to exported latex file
  (add-to-list 'org-latex-default-packages-alist '("" "ctex" t ("xelatex")))

  ;; auto save all org buffer when refile
  (advice-add 'org-refile :after 'org-save-all-org-buffers)
  (add-to-list 'org-modules 'org-habit))

;; use org-fragtog to toggle org-mode latex preview
(use-package org-fragtog
  :hook
  (org-mode . org-fragtog-mode))

;; export org as hugo compatible markdown
(use-package ox-hugo
  :hook
  (org-mode . (lambda ()
		(with-eval-after-load 'ox
		  (require 'ox-hugo)))))

(use-package org-roam
  :pin melpa
  :init
  (setq org-roam-directory max-roam-directory)
  (setq org-roam-db-location
	(file-name-concat max-roam-directory ".org-roam" "org-roam.db"))
  :commands (org-roam-node-find)
  :custom
  ((org-roam-node-display-template (concat "${title:30}\t"
					   (propertize "${tags}" 'face 'org-tag))))
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
	   (file+head "${slug}.org" "#+title: ${title}\n#+created_time: %<%Y-%m-%dT%H:%M:%S%:z>\n")
	   :unnarrowed t)))
  (org-roam-db-autosync-enable))

(provide 'init-org)
;;; init-org.el ends here
