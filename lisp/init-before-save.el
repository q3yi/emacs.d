;;; init-before-save.el -- custom before save hook base on current mode -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:
(defcustom q3yi-before-save-hooks-by-mode-alist nil
  "Alist of hooks that is run before a buffer is save to its file.
Unlike `before-save-hook' that will run every hook in any buffer in any mode,
only hooks registered to specified major-mode will be run."
  :type 'alist
  :group 'q3yi)

(defun q3yi-add-before-save-hooks-within-mode (mode func)
  "Add before save hooks to specified mode.

MODE: major mode the hook should run,
FUNC: fuction to call."
  (let ((exist-hooks (alist-get mode q3yi-before-save-hooks-by-mode-alist)))
    (if exist-hooks
	(setf (alist-get mode q3yi-before-save-hooks-by-mode-alist) (push func exist-hooks))
      (push (list mode func) q3yi-before-save-hooks-by-mode-alist))))

(defun q3yi-execute-before-save-hooks-within-mode ()
  "Execute before save hook registered to current major mode."
  (let ((hooks (alist-get major-mode q3yi-before-save-hooks-by-mode-alist)))
    (when hooks
      (dolist (f hooks)
	(funcall f)))))

(add-to-list 'before-save-hook 'q3yi-execute-before-save-hooks-within-mode)

(provide 'init-before-save)
;;; init-before-save.el ends here
