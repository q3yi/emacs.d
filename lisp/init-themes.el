;;; init-themes.el --- Configure emacs color theme -*- lexical-binding: t -*-

;; in order for the icons to work, fonts should be installedf
;; run `M-x all-the-icons-install-fonts` command when first installedq
(use-package all-the-icons
  :if (display-graphic-p)
  :commands all-the-icons-install-fonts
  :init
  (unless (find-font (font-spec :name "all-the-icons"))
    (all-the-icons-install-fonts t)))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  ((doom-modeline-height 20)
   (doom-modeline-icon (display-graphic-p))))

(use-package doom-themes
  :ensure t
  :hook (after-init . (lambda () (load-theme 'doom-one t)))
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)

  (doom-themes-org-config))

(provide 'init-themes)

