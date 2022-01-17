;;; init-consult.el -- setup consult package -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:
(require 'vc)

(use-package consult
  :demand t
  :bind (("C-c h" . consult-history)
	 ("C-c m" . consult-mode-command)
	 ("C-c k" . consult-kmacro)
	 ;; C-x bindings (ctl-x-map)
	 ("C-x r b" . consult-bookmark)
	 ;; Other custom bindings
	 ("M-y" . consult-yank-pop)
	 ("<help> a" . consult-apropos)
	 ;; M-g bindings (goto-map)
	 ("M-g f" . consult-flycheck)
	 ("M-g g" . consult-goto-line)
	 ("M-g o" . consult-outline)
	 ("M-g m" . consult-mark)
	 ("M-g k" . consult-global-mark)
	 ("M-g i" . consult-imenu)
	 ("M-g I" . consult-imenu-multi)
	 ;; M-s bindings (search-map)
	 ("M-s d" . consult-find)
	 ("M-s D" . consult-locate)
	 ("M-s g" . consult-grep)
	 ("M-s r" . consult-ripgrep)
	 ("M-s G" . consult-git-grep)
	 ("M-s l" . consult-line)
	 ("M-s L" . consult-line-multi)
	 ("M-s m" . consult-multi-occur)
	 ("M-s k" . consult-keep-lines)
	 ("M-s u" . consult-focus-lines)
	 ;; Isearch integration
	 ("M-s e" . consult-isearch-history)
	 :map isearch-mode-map
	 ("M-e" . consult-isearch-history)
	 ("M-s e" . consult-isearch-history)
	 ("M-s l" . consult-line)
	 ("M-s L" . consult-line-multi))
  :config
  (setq consult-narrow-key "<")
  (setq consult-project-root-function #'vc-root-dir))

(provide 'init-consult)
;;; init-consult.el ends here
