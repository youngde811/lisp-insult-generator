
;;; This file contains initialization code that must be loaded before
;;; anything else.

(in-package "FUCK-JOE-BIDEN")

(defvar *default-phrases-file* "./data/phrases.txt")

(defun collect-phrases ()
  (with-open-file (strm *default-phrases-file*)
    (loop for line = (read-line strm nil nil)
          while line
          collect (uiop:split-string line))))

(defparameter *insult-keywords* (collect-phrases))

