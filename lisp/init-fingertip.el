;;; init-fingertip.el -- init fingertip -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(use-package fingertip
  :commands (fingertip-mode)
  :load-path ("site-lisp/fingertip")
  :bind
  (:map fingertip-mode-map
	("(" . fingertip-open-round)
	("[" . fingertip-open-bracket)
	("{" . fingertip-open-curly)
	(")" . fingertip-close-round)
	("]" . fingertip-close-bracket)
	("}" . fingertip-close-curly)
	("=" . fingertip-equal)

	("%" . fingertip-match-paren)
	("\"" . fingertip-double-quote)
	("'" . fingertip-single-quote)

	("SPC" . fingertip-space)
	("RET" . fingertip-newline)

	("M-o" . fingertip-backward-delete)
	("C-d" . fingertip-forward-delete)
	("C-k" . fingertip-kill)

	("M-\"" . fingertip-wrap-double-quote)
	;; ((kbd "M-'") 'fingertip-wrap-single-quote)
	("M-[" . fingertip-wrap-bracket)
	("M-{" . fingertip-wrap-curly)
	("M-(" . fingertip-wrap-round)
	("M-)" . fingertip-unwrap)

	("M-p" . fingertip-jump-right)
	("M-n" . fingertip-jump-left)
	("M-:" . fingertip-jump-out-pair-and-newline)

	("C-j" . fingertip-jump-up))
  )

(provide 'init-fingertip)
;;; init-fingertip.el ends here
