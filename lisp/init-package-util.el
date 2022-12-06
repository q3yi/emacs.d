;;; init-package-util.el -- Set epla mirror and install 'use-package package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'package)

;; tsinghua mirror
;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; ustc mirror
(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
			 ("melpa-stable" . "http://mirrors.ustc.edu.cn/elpa/stable-melpa/")
			 ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")))

(unless (bound-and-true-p package--initialized)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

;; install 'use-package package if it is not installed
(unless (package-installed-p 'use-package)
  (add-to-list 'package-pinned-packages '(use-package . "gnu"))
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-verbose nil))

(provide 'init-package-util)
;;; init-package-util.el ends here
