;;; init-company.el --- Configurate company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package company
  :delight
  :demand
  :hook ((after-init . global-company-mode))
  :custom
  ((company-minimum-prefix-length 2)
   (company-dabbrev-code-everywhere t)
   (company-show-numbers t)
   (company-dabbrev-ignore-case t))
  :bind
  (:map company-mode-map
	("M-/" . company-complete)
	([remap completion-at-point] . company-complete)
	([remap indent-for-tab-command] . company-indent-or-complete-common)
   :map company-active-map
	("<return>" . company-abort)
	("RET" . company-abort)
	("M-/" . company-other-backend)
	("C-n" . company-select-next)
	("C-p" . company-select-previous)
	("C-e" . company-complete-selection)))

(use-package company-box
  :if (display-graphic-p)
  :hook (company-mode . company-box-mode)
  :delight
  :custom
  ((company-box-doc-enable nil)))

(provide 'init-company)
;;; init-company.el ends here
