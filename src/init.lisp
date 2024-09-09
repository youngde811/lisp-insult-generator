
;;; This file contains initialization code that must be loaded before
;;; anything else.

(in-package "FUCK-JOE-BIDEN")

(defvar *default-keywords-file* "data/keywords.txt")

(defun collect-keywords ()
  (with-open-file (strm *default-keywords-file*)
    (loop for line = (read-line strm nil nil)
          while line
          collect (uiop:split-string line))))

(defun use-keywords-file (path)
  (let ((*default-keywords-file* path))
    (setf *insult-keywords* (collect-keywords))))

(defparameter *insult-keywords* (collect-keywords))
