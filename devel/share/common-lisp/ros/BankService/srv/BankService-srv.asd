
(cl:in-package :asdf)

(defsystem "BankService-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ops1" :depends-on ("_package_ops1"))
    (:file "_package_ops1" :depends-on ("_package"))
  ))