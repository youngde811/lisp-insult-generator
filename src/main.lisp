
;;; This file is the entry point to my Lisp implementation of the phrase parser.

(in-package "FUCK-JOE-BIDEN")

(defmacro with-custom-phrases (path &body body)
  `(let* ((*default-phrases-file* ,path)
          (*insult-keywords* (collect-phrases)))
     (progn
       ,@body)))

(defun generate-insults (&key (count 500))
  (let ((nphrases (length *insult-keywords*)))
    (loop for i from 0 to (1- count)
          collect (format nil "Thou ~d ~d ~d!"
                          (first (nth (random nphrases) *insult-keywords*))
                          (second (nth (random nphrases) *insult-keywords*))
                          (third (nth (random nphrases) *insult-keywords*))))))

(defun insult-me (&key (count 1))
  (let* ((insults (generate-insults))
         (len (length insults)))
    (loop for i from 0 to (1- count)
          do
             (format t "~d~%" (nth (random len) insults)))
    t))
