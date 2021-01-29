;;; init-coding-system.el -- Set locale explictly -*- lexical-binding: t -*-
;;; Commentary:

;;; Emacs get a invalid LANG(en_CN.UTF8) value when language set as US and timezone set as
;;; Chinese mainland.  It cause the unicode cannot be displayed correctly in term or vterm
;;; mode, so I set it to correct en_US.UTF-8 here explictly.
;;; Only tested work on Emacs-mac on macOS big_sur.
;;; https://emacs-china.org/t/emacs-mac-macos/15854/9

;;; Code:

(setenv "LANG" "en_US.UTF-8")
(set-locale-environment "en_US.UTF-8")

;; coding system
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(provide 'init-coding-system)
;;; init-coding-system.el ends here
