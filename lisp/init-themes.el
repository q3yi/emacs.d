;;; init-themes.el --- Configure emacs color theme -*- lexical-binding: t -*-

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-icon nil))

(use-package doom-themes
  :ensure t
  :hook (after-init . (lambda () (load-theme 'doom-one t)))
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  (doom-themes-org-config))

(provide 'init-themes)
