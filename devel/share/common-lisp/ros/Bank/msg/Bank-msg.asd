
(cl:in-package :asdf)

(defsystem "Bank-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ops" :depends-on ("_package_ops"))
    (:file "_package_ops" :depends-on ("_package"))
  ))