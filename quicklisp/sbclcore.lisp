;;; This Lisp file may be used to create a custom sbcl core file, containing whatever packages
;;; one wishes to have added to base sbcl.

(in-package :cl-user)

(mapc #'require '(:sb-bsd-sockets :sb-posix :sb-introspect :sb-cltl2 :asdf :uiop))

#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(save-lisp-and-die (concatenate 'string (sb-posix:getcwd) "/sbcl/sbcl-bosshog.core"))
