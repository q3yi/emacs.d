;;; init-themes.el --- Configure emacs color theme -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(defun max-auto-change-theme (&optional appearance)
  "Change theme, taking current system APPEARANCE into consideration."
  (let ((appearance (or appearance
			(let ((hour (nth 2 (decode-time (current-time)))))
			  (if (< 8 hour 20) 'light 'dark)))))
       (pcase appearance
	 ('light (modus-themes-load-operandi))
	 ('dark (modus-themes-load-vivendi)))))

(use-package modus-themes
  :ensure
  :pin gnu
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
  (max-auto-change-theme))

;; Change light or dark theme automatically on mac emacs-plus
(when (boundp 'ns-system-appearance-change-functions)
  (add-hook 'ns-system-appearance-change-functions #'max-auto-change-theme))

(provide 'init-themes)
;;; init-themes.el ends here
