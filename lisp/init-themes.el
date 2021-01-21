;;; init-themes.el --- Configure emacs color theme -*- lexical-binding: t -*-

;; in order for the icons to work, fonts should be installed
;; run `M-x all-the-icons-install-fonts` command when first installed
(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-icon (display-graphic-p)))

(use-package doom-themes
  :ensure t
  :hook (after-init . (lambda () (load-theme 'doom-one t)))
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)

  (doom-themes-org-config))

(provide 'init-themes)
