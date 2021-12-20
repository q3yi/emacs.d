;;; init-helper-funcs.el -- provide some useful functions -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun max/set-font (font-name cn-font-name &optional initial-size cn-font-rescale-ratio)
  "Set different font-family for Latin and Chinese charactors.
FONT-NAME is the font used for latin charactors.
CN-FONT-NAME is the font family used for CJK charactors.
INITIAL-SIZE font-size.
CN-FONT-RESCALE-RATIO refer to `face-font-rescale-alist'."

  (let ((main-font (font-spec :name font-name :size (or initial-size 14)))
	(cn-font (font-spec :name cn-font-name)))
    (set-face-attribute 'default nil :font main-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font t charset cn-font))
    (setq face-font-rescale-alist (if cn-font-rescale-ratio
				      `((,cn-font-name . ,cn-font-rescale-ratio))
				    nil))))

;; (max/set-font "Iosevka" "Sarasa Mono SC" 15)

(provide 'init-helper-funcs)
;;; init-helper-funcs.el ends here
