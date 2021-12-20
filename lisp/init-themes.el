;;; init-themes.el --- Configure emacs color theme -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; in order for the icons to work, fonts should be installedf
;; run `M-x all-the-icons-install-fonts` command when first installedq
(use-package all-the-icons
  :if (display-graphic-p)
  :commands all-the-icons-install-fonts
  :init
  (unless (find-font (font-spec :name "all-the-icons"))
    (all-the-icons-install-fonts t)))

(use-package modus-themes
  :ensure
  :init
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
	modus-themes-prompts '(bold intense)
	modus-themes-mode-line '(accented)
	modus-themes-paren-match nil
        modus-themes-region '(bg-only no-extend))
  ;; Load the theme files before enabling a theme
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  (modus-themes-load-vivendi))

(provide 'init-themes)
;;; init-themes.el ends here
