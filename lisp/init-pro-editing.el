;;; init-pro-editing.el -- add some features to enhence editing -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:
(require 'init-package-util)

(use-package crux
  :pin melpa-stable
  :bind
  (("C-k" . crux-smart-kill-line)
   ("C-o" . crux-smart-open-line)
   ("C-c \\" . crux-cleanup-buffer-or-region)
   ([remap move-beginning-of-line] . crux-move-beginning-of-line)))

;; iedit package to support multiple cursor editing
(use-package iedit
  :pin melpa
  :commands (iedit-mode)
  :bind
  ("C-;" . iedit-mode))

;;; move text up and down
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
	(exchange-point-and-mark))
    (let ((column (current-column))
	  (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
	(forward-line)
	(when (or (< arg 0) (not (eobp)))
	  (transpose-lines arg)
	  (when (and
		 ;; Account for changes to transpose-lines in Emacs 24.3
		 (eval-when-compile
		   (not (version-list-<
			 (version-to-list emacs-version)
			 '(24 3 50 0))))
		 ;; Make `move-text-up' works with Emacs 26.0
		 (eval-when-compile
		   (version-list-<
		    (version-to-list emacs-version)
		    '(26 0 50 1)))
		 (< arg 0))
	    (forward-line -1)))
	(forward-line -1))
      (move-to-column column t)))))

;;;###autoload
(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

;;;###autoload
(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))


(defun open-new-line (arg)
  "Open new line below or upon base on ARG."
  (interactive "P")
  (if arg
      (progn
	(beginning-of-line)
	(open-line 1)
	(indent-according-to-mode))
    (progn
      (end-of-line)
      (open-line 1)
      (forward-line 1)
      (indent-according-to-mode))))


;; global bindings
(global-set-key (kbd "M-H-d") #'duplicate-line)
(global-set-key (kbd "M-j") #'join-line)

(global-set-key (kbd "s-<up>") #'move-text-up)
(global-set-key (kbd "s-<down>") #'move-text-down)

;; Better default delete-char
(global-set-key (kbd "C-d") 'delete-forward-char)

;; remap down/upper/capitalize case to dwim (do what I mean)
(global-set-key [remap downcase-word] 'downcase-dwim)
(global-set-key [remap upcase-word] 'upcase-dwim)
(global-set-key [remap capitalize-word] 'capitalize-dwim)

(global-set-key (kbd "C-x a r") #'align-regexp)

;; Prevent Emacs from bugging me about C-x n n not being
;; user-friendly.
(put 'narrow-to-region 'disabled nil)

(provide 'init-pro-editing)
;;; init-pro-editing.el ends here
