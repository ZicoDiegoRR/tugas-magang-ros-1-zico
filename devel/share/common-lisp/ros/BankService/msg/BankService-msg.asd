
(cl:in-package :asdf)

(defsystem "BankService-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ops" :depends-on ("_package_ops"))
    (:file "_package_ops" :depends-on ("_package"))
  ))