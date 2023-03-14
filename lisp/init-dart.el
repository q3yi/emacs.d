;;; init-dart.el -- config for dart and flutter -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:
(require 'init-package-util)

(use-package dart-mode
  :hook (dart-mode . eglot-ensure))

(provide 'init-dart)
;;; init-dart.el ends here
