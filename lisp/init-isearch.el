;;; init-isearch.el -- isearch settings -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

;; See https://github.com/purcell/emacs.d/blob/master/lisp/init-isearch.el
(with-eval-after-load 'isearch
  ;; DEL during isearch should edit the search string, not jump back to the previous result
  (define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char)

  ;; Activate occur easily inside isearch
  (when (fboundp 'isearch-occur)
    ;; to match ivy conventions
    (define-key isearch-mode-map (kbd "C-c C-o") 'isearch-occur)))

(provide 'init-isearch)
;;; init-isearch.el ends here
