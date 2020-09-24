;;; init-defaults.el -- Better default configuration for build-in configuration -*- lexical-binding: t -*-

;; suppress backup file
(setq make-backup-files nil)

;; suppress anonying ring bell
(setq ring-bell-function 'ignore)

;; coding system
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; smart tab behavior
(setq tab-always-indent 'complete)

(defalias 'yes-or-no-p 'y-or-n-p)

(eq (get 'downcase-region 'disabled) nil)

;; enable some commands that disabled by default
(let ((commands '(downcase-region
		  upcase-region
		  capitalize-region)))
  (dolist (cmd commands)
    (if (get cmd 'disabled) (put cmd 'disabled nil))))

(global-set-key (kbd "C-x M-c") 'capitalize-region)

(provide 'init-defaults)
