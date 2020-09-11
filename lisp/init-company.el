;;; init-company.el --- Configurate company

(use-package company
  :hook ((after-init . global-company-mode))
  :config (setq company-minimum-prefix-length 2
		company-dabbrev-code-everywhere t
		company-show-numbers t
		company-dabbrev-ignore-case t))

(provide 'init-company)
