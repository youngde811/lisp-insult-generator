
;;; This is the ASDF system definition code for gen-phrases.

(in-package "ASDF-USER")

(defsystem :fjb
  :components
  ((:file "src/package")
   (:file "src/main" :depends-on ("src/package"))))
