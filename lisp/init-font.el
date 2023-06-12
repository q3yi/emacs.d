;;; init-font.el -- Set proper aligned english and cjk font -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(defcustom q3yi-eng-cjk-font-pairs
  '((:eng (:name "Unifont" :weight regular :size 14)
	  :cjk (:name "Unifont" :weight regular :size 14)
	  :cjk-rescale 0.0)
    (:eng (:name "Ubuntu Mono" :weight regular :size 14)
	  :cjk (:name "LXGW WenKai" :size 14)
	  :cjk-rescale 0.0)
    (:eng (:name "Iosevka" :weight regular :size 14)
	  :cjk (:name "LXGW WenKai" :size 14)
	  :cjk-rescale 0.0)
    (:eng (:name "Fantasque Sans Mono" :weight regular :size 14)
	  :cjk (:name "LXGW WenKai" :size 14)
	  :cjk-rescale 0.0)
    (:eng (:name "Fairfax HD" :weight regular :size 14)
	  :cjk (:name "LXGW WenKai" :weight regular :size 14)
	  :cjk-rescale nil)
    (:eng (:name "monofur for Powerline" :weight regular :size 14)
	  :cjk (:name "LXGW WenKai" :weight regular :size 14)
	  :cjk-rescale 0.0)
    (:eng (:name "Monego" :weight regular :size 12)
	  :cjk (:name "LXGW WenKai" :weight regular :size 12)
	  :cjk-rescale 1.2))
  "Compatiable english-chinese font pairs.
The size and weight of cjk font is not work right now."
  :type '(list)
  :group 'q3yi)

(defun q3yi--set-font-with-ratio (eng-font cjk-font cjk-font-rescale-ratio)
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

  ;; (message (format "cjk-font-rescale-ratio: %f" cjk-font-rescale-ratio))

  (setq face-font-rescale-alist
	(if (and cjk-font-rescale-ratio (/= cjk-font-rescale-ratio 0.0))
	    `((,cjk-font . ,cjk-font-rescale-ratio))
	  nil)))

(defun q3yi-set-font (&optional n)
  "Set font to Nth font pairs in `q3yi-eng-cjk-font-pairs'."

  (interactive "N(1:Unifont, 2:Ubuntu, 3:Iose, 4:Fantasque, 5:Fairfax, 6:Monofur, 7:Monego): ")
  (let* ((n (if (and n (> n 0)) (- n 1) 0))
	 (font-pair (nth n q3yi-eng-cjk-font-pairs))
	 (eng-font-cfg (plist-get font-pair :eng))
	 (cjk-font-cfg (plist-get font-pair :cjk))
	 (cjk-rescale-ratio (plist-get font-pair :cjk-rescale))
	 (eng-font (font-spec :name (plist-get eng-font-cfg :name)
			      :weight (plist-get eng-font-cfg :weight)
			      :size (plist-get eng-font-cfg :size)))
	 (cjk-font (font-spec :name (plist-get cjk-font-cfg :name)
			      :weight (plist-get cjk-font-cfg :weight)
			      :size (plist-get cjk-font-cfg :size)
			      )))
    (q3yi--set-font-with-ratio eng-font
			       ;; weight and size of cjk font is ignored
			       ;; in order to make scaling works properly
			       (plist-get cjk-font-cfg :name)
			       cjk-rescale-ratio)

    (message "Set font to %s, CJK font to %s."
	     (font-get eng-font :name)
	     (font-get cjk-font :name))))

(provide 'init-font)
;;; init-font.el ends here
