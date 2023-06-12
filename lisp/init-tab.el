;;; init-tab.el -- config tab-bar-mode -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:

(require 'tab-bar)

(setq tab-bar-new-tab-choice "*scratch*"
      tab-bar-close-button-show nil
      tab-bar-format '(tab-bar-format-history tab-bar-format-tabs tab-bar-separator))

(provide 'init-tab)
;;; init-tab.el ends here
