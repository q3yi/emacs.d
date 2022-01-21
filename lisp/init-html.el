;;; init-html.el --- Support html files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-package-util)

(use-package web-mode
  :mode (("\\.phtml\\'"     . web-mode)
	 ("\\.tpl\\.php\\'" . web-mode)
	 ("\\.[agj]sp\\'"   . web-mode)
	 ("\\.as[cp]x\\'"   . web-mode)
	 ("\\.erb\\'"       . web-mode)
	 ("\\.mustache\\'"  . web-mode)
	 ("\\.djhtml\\'"    . web-mode)
	 ("\\.html?\\'"     . web-mode)))

(provide 'init-html)
;;; init-html.el ends here
