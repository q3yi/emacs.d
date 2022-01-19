;;; init-font.el -- provide some useful functions -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar max-font-set
  '(((:name "Iosevka SS07" :weight regular :size 15)
     (:name "Sarasa Mono SC" :weight regular :size 15)
     0.0)
    ((:name "Iosevka SS08" :weight regular :size 15)
     (:name "Sarasa Mono SC" :weight regular :size 15)
     0.0)
    ((:name "Iosevka" :weight regular :size 15)
     (:name "Sarasa Mono SC" :weight regular :size 15)
     0.0)
    ((:name "Terminus (TTF)" :weight medium :size 16)
     (:name "Sarasa Mono SC" :weight regular :size 16)
     0.0)
    ((:name "Victor Mono" :weight regular :size 15)
     (:name "Sarasa Mono SC" :weight regular :size 15)
     nil)
    ((:name "Monaco" :weight regular :size 14)
     (:name "Sarasa Mono SC" :weight regular :size 15)
     1.0))
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
    (set-fontset-font t charset cjk-font))

  (setq face-font-rescale-alist
	(if (and cjk-font-rescale-ratio (/= cjk-font-rescale-ratio 0.0))
	    `((,(font-get cjk-font :name) . ,cjk-font-rescale-ratio))
	  nil)))

(defun max-set-font (&optional n)
  "Set font to Nth font pairs in `max-font-set'."

  (interactive "N(1:Iose 07, 2:Iose 08, 3:Iose, 4:Term, 5:Vict, 6:Mona): ")
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
    (max--set-font-with-ratio eng-font cjk-font cjk-rescale-ratio)

    (message "Set font to %s, CJK font to %s."
	     (font-get eng-font :name)
	     (font-get cjk-font :name))))

(provide 'init-font)
;;; init-font.el ends here
