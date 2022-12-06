emacs-lisp-mode

(dotel ";;; " (file-name-nondirectory (or (buffer-file-name) (buffer-name))) " -- " p " -*- lexical-binding: t -*-" n
       ";;; Commentary:" n
       ";;;" p n
       ";;; Code:" n
       q n
       "(provide '" (file-name-base (or (buffer-file-name) (buffer-name))) ")" n
       ";;; " (file-name-nondirectory (or (buffer-file-name) (buffer-name))) " ends here" n)

(addh "(add-hook " p "-hook " p ")" q)

(defk "(define-key " (p "some") "-map " (p "(kbd \"\") ") (p "func") ")" q)
