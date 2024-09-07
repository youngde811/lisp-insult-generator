
;;; This file is the entry point to my Lisp implementation of the phrase parser.

(in-package "FJB")

(defconstant default-phrases-file "./data/phrases.txt")

(defvar *phrases-path* nil)

(defun collect-phrases ()
  (with-open-file (strm *phrases-path*)
    (loop for line = (read-line strm nil nil)
          while line
          collect (uiop:split-string line))))

(defun generate-insults (&key (phrases-file default-phrases-file) (count 500))
  (let* ((*phrases-path* phrases-file)
         (phrases (collect-phrases))
         (nphrases (length phrases)))
    (loop for i from 0 to (1- count)
          collect (format nil "Thou ~d ~d ~d!"
                          (first (nth (random nphrases) phrases))
                          (second (nth (random nphrases) phrases))
                          (third (nth (random nphrases) phrases))))))

(defun insult-me (&key (count 1))
  (let* ((insults (generate-insults))
         (len (length insults)))
    (loop for i from 0 to (1- count)
          do
             (format t "~d~%" (nth (random len) insults)))
    t))
