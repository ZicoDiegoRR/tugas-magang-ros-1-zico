;; Auto-generated. Do not edit!


(when (boundp 'BankService::ops1)
  (if (not (find-package "BANKSERVICE"))
    (make-package "BANKSERVICE"))
  (shadow 'ops1 (find-package "BANKSERVICE")))
(unless (find-package "BANKSERVICE::OPS1")
  (make-package "BANKSERVICE::OPS1"))
(unless (find-package "BANKSERVICE::OPS1REQUEST")
  (make-package "BANKSERVICE::OPS1REQUEST"))
(unless (find-package "BANKSERVICE::OPS1RESPONSE")
  (make-package "BANKSERVICE::OPS1RESPONSE"))

(in-package "ROS")





(defclass BankService::ops1Request
  :super ros::object
  :slots (_selection _money _id _name _get_display ))

(defmethod BankService::ops1Request
  (:init
   (&key
    ((:selection __selection) 0)
    ((:money __money) 0.0)
    ((:id __id) 0)
    ((:name __name) "")
    ((:get_display __get_display) nil)
    )
   (send-super :init)
   (setq _selection (round __selection))
   (setq _money (float __money))
   (setq _id (round __id))
   (setq _name (string __name))
   (setq _get_display __get_display)
   self)
  (:selection
   (&optional __selection)
   (if __selection (setq _selection __selection)) _selection)
  (:money
   (&optional __money)
   (if __money (setq _money __money)) _money)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:get_display
   (&optional (__get_display :null))
   (if (not (eq __get_display :null)) (setq _get_display __get_display)) _get_display)
  (:serialization-length
   ()
   (+
    ;; int8 _selection
    1
    ;; float32 _money
    4
    ;; int16 _id
    2
    ;; string _name
    4 (length _name)
    ;; bool _get_display
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _selection
       (write-byte _selection s)
     ;; float32 _money
       (sys::poke _money (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int16 _id
       (write-word _id s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; bool _get_display
       (if _get_display (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _selection
     (setq _selection (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _selection 127) (setq _selection (- _selection 256)))
   ;; float32 _money
     (setq _money (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int16 _id
     (setq _id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _get_display
     (setq _get_display (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass BankService::ops1Response
  :super ros::object
  :slots (_result ))

(defmethod BankService::ops1Response
  (:init
   (&key
    ((:result __result) "")
    )
   (send-super :init)
   (setq _result (string __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; string _result
    4 (length _result)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _result
       (write-long (length _result) s) (princ _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _result
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _result (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass BankService::ops1
  :super ros::object
  :slots ())

(setf (get BankService::ops1 :md5sum-) "2c0fa4564a7bae7c28ac5a5f4bafcf82")
(setf (get BankService::ops1 :datatype-) "BankService/ops1")
(setf (get BankService::ops1 :request) BankService::ops1Request)
(setf (get BankService::ops1 :response) BankService::ops1Response)

(defmethod BankService::ops1Request
  (:response () (instance BankService::ops1Response :init)))

(setf (get BankService::ops1Request :md5sum-) "2c0fa4564a7bae7c28ac5a5f4bafcf82")
(setf (get BankService::ops1Request :datatype-) "BankService/ops1Request")
(setf (get BankService::ops1Request :definition-)
      "int8 selection
float32 money
int16 id
string name
bool get_display
---
string result
")

(setf (get BankService::ops1Response :md5sum-) "2c0fa4564a7bae7c28ac5a5f4bafcf82")
(setf (get BankService::ops1Response :datatype-) "BankService/ops1Response")
(setf (get BankService::ops1Response :definition-)
      "int8 selection
float32 money
int16 id
string name
bool get_display
---
string result
")



(provide :BankService/ops1 "2c0fa4564a7bae7c28ac5a5f4bafcf82")


