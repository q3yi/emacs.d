;;; init-project.el -- extend features of project.el -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Code:
(require 'project)
(require 'seq)

(defcustom q3yi-project-folders nil
  "List of directory root contains project."
  :type '(list string)
  :group 'project)

(defun q3yi--find-projects-in-directory (dir)
  "Find all projects in DIR(ectory), ignore any projects inside a project."
  (let ((proj (project--find-in-directory dir)))
    (if proj (list (project-root proj))
      (seq-reduce
       (lambda (projects found)
	 (if projects (seq-concatenate 'list projects found) found))
       (seq-map #'q3yi--find-projects-in-directory
		(seq-filter #'file-directory-p
			    (directory-files dir t "\\(^[^\\.]+$\\)")))
       (list)))))

(defun q3yi--remember-projects-under (dir &optional write-file)
  "Find all projects in DIR.
Save projects into `project-list-file' when WRITE-FILE is not nil."
  (project--ensure-read-project-list)
  (let ((found (q3yi--find-projects-in-directory dir))
	(count 0)
	(known (make-hash-table
		:size (* 2 (length project--list))
		:test #'equal )))
    (dolist (project (mapcar #'car project--list))
      (puthash project t known))
    (mapc (lambda (proj)
	    (push (list proj) project--list)
	    (setq count (1+ count)))
	  (seq-remove
	   (lambda (proj) (gethash proj known))
	   found))
    (when write-file
      (project--write-project-list))
    count))

(defun q3yi-project-refresh-projects ()
  "Search project under folder defined in `q3yi-project-folders'."
  (interactive)
  (if (not q3yi-project-folders)
      (message "No project folder set in `q3yi-project-folders'")
    (let* ((count-in-folder (mapcar #'q3yi--remember-projects-under q3yi-project-folders))
	   (count (seq-reduce #'+ count-in-folder 0)))
      (if (zerop count)
	  (message "No projects were found")
	(progn
	  (project--write-project-list)
	  (message "%d project%s were found"
		   count (if (= count 1) "" "s")))))))

(defun q3yi-project-add-projects-under (dir)
  "Add all projects in DIR to known projects.
If the DIR is a project then add it to known projects,
else find all projects under DIR and add them to known projects."
  (interactive "DDirectory: \n")
  (let ((count (q3yi--remember-projects-under dir)))
    (if (zerop count)
	(message "No projects were found")
      (progn
	(project--write-project-list)
	(message "%d project%s were found"
		 count (if (= count 1) "" "s"))))))

(define-key project-prefix-map (kbd "r") #'q3yi-project-refresh-projects)
(define-key project-prefix-map (kbd "a") #'q3yi-project-add-projects-under)

(setq q3yi-project-folders '("~/.emacs.d/" "~/repos/"))

(provide 'init-project)
;;; init-project.el ends here
