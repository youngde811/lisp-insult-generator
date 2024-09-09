;; MIT License

;; Copyright (c) 2024 David Young

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; This file is the entry point to the Lisp implementation of the insult generator.

(in-package "FUCK-JOE-BIDEN")

(defmacro with-custom-keywords ((path) &body body)
  `(let* ((*default-keywords-file* ,path)
          (*insult-keywords* (collect-keywords)))
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
    (values)))

(defun grumble ()
  (insult-me))
