
;;; This file is the entry point to my Lisp implementation of the phrase parser.

(in-package "FJB")

(defconstant default-phrases-file "./data/phrases.txt")

(defvar *phrases-path* nil)

(defun collect-phrases ()
  (with-open-file (strm *phrases-path*)
    (loop for line = (read-line strm nil nil)
          while line
          collect (uiop:split-string line))))

(defun generate-insults (&key (phrases-file default-phrases-file))
  (let ((*phrases-path* phrases-file))
    (collect-phrases)))

(defun insult-me ()
  (let ((phrase (first (generate-insults))))
    (format t "Thou ~d ~d ~d!" (first phrase) (second phrase) (third phrase))
    t))
