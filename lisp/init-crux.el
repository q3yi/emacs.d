;;; init-crux.el --- Configure crux package -*- lexical-binding: t -*-

(use-package crux
  :bind (("C-k" . crux-smart-kill-line)
	 ("C-o" . crux-smart-open-line)
	 ("M-o" . crux-smart-open-line-above)
	 ("C-c n" . crux-cleanup-buffer-or-region)
	 ("C-c d" . crux-duplicate-current-line-or-region)
	 ("C-c j" . crux-top-join-line)
	 ("C-c ," . crux-find-user-init-file)))

(provide 'init-crux)
