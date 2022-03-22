;;; init-font.el -- Set proper aligned english and cjk font -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar max-font-set
  '(((:name "Ubuntu Mono" :weight regular :size 16)
     (:name "LXGW WenKai" :size 16)
     0.0)
    ((:name "Iosevka" :weight regular :size 16)
     (:name "LXGW WenKai" :size 16)
     0.0)
    ((:name "Fantasque Sans Mono" :weight regular :size 16)
     (:name "LXGW WenKai" :size 16)
     0.0)
    ((:name "Terminus (TTF)" :weight medium :size 16)
     (:name "LXGW WenKai" :size 16)
     0.0)
    ((:name "M Plus 1 Code" :weight regular :size 15)
     (:name "LXGW WenKai" :weight regular :size 16)
     nil)
    ((:name "monofur for Powerline" :weight regular :size 16)
     (:name "LXGW WenKai" :weight regular :size 16)
     0.0))
  "Compatiable english-chinese font pairs.")

(defun max--set-font-with-ratio (eng-font cjk-font cjk-font-rescale-ratio)
  "Set different font-family for Latin and CJK.

ENG-FONT is the font used for latin charactors.
CJK-FONT is the font family used for CJK charactors.
CJK-FONT-RESCALE-RATIO refer to `face-font-rescale-alist'.

ENG-FONT and CJK-FONT should be a font object not a name string."

  ;; set english font
  (set-face-attribute 'default nil :font eng-font)

  ;; set chinese font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font "fontset-default" charset cjk-font))

  (setq face-font-rescale-alist
	(if (and cjk-font-rescale-ratio (/= cjk-font-rescale-ratio 0.0))
	    `((,(font-get cjk-font :name) . ,cjk-font-rescale-ratio))
	  nil)))

(defun max-set-font (&optional n)
  "Set font to Nth font pairs in `max-font-set'."

  (interactive "N(1:Ubuntu, 2:Iose, 3:Fantasque, 4:Term, 5:M+, 6:Monofur): ")
  (let* ((n (if (and n (> n 0)) (- n 1) 0))
	 (font-pair (nth n max-font-set))
	 (eng-font-cfg (nth 0 font-pair))
	 (cjk-font-cfg (nth 1 font-pair))
	 (cjk-rescale-ratio (nth 2 font-pair))
	 (eng-font (font-spec :name (plist-get eng-font-cfg :name)
			      :weight (plist-get eng-font-cfg :weight)
			      :size (plist-get eng-font-cfg :size)))
	 (cjk-font (font-spec :name (plist-get cjk-font-cfg :name)
			      :weight (plist-get cjk-font-cfg :weight)
			      :size (plist-get cjk-font-cfg :size)
			      )))
    (max--set-font-with-ratio eng-font
			      ;; weight and size of cjk font is ignored
			      ;; in order to make scaling works properly
			      (plist-get cjk-font-cfg :name)
			      cjk-rescale-ratio)

    (message "Set font to %s, CJK font to %s."
	     (font-get eng-font :name)
	     (font-get cjk-font :name))))

(provide 'init-font)
;;; init-font.el ends here
