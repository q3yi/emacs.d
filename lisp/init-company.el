;;; init-company.el --- Configurate company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun company-mode/backend-with-yas (backend)
  "Add company-yasnippet to company backend."
  (if (and (listp backend) (member 'company-yasnippet backend))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(use-package company
  :demand
  :hook ((after-init . global-company-mode))
  :custom
  ((company-minimum-prefix-length 2)
   (company-dabbrev-code-everywhere t)
   (company-show-numbers t)
   (company-dabbrev-ignore-case t)
   (company-global-modes '(not eshell-mode vterm-mode term-mode)))
  :bind
  (:map company-mode-map
	("M-/" . company-complete)
	([remap completion-at-point] . company-complete)
   :map company-active-map
   ("M-/" . company-other-backend))
  :config
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))

(use-package company-box
  :if (display-graphic-p)
  :hook (company-mode . company-box-mode)
  :delight
  :custom
  ((company-box-doc-enable nil)))

(provide 'init-company)
;;; init-company.el ends here
