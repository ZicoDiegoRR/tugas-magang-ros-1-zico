;; Auto-generated. Do not edit!


(when (boundp 'BankService::ops)
  (if (not (find-package "BANKSERVICE"))
    (make-package "BANKSERVICE"))
  (shadow 'ops (find-package "BANKSERVICE")))
(unless (find-package "BANKSERVICE::OPS")
  (make-package "BANKSERVICE::OPS"))

(in-package "ROS")
;;//! \htmlinclude ops.msg.html


(defclass BankService::ops
  :super ros::object
  :slots (_selection _money _id _name _get_display ))

(defmethod BankService::ops
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

(setf (get BankService::ops :md5sum-) "de131049108731bc3c4ba83f05414a14")
(setf (get BankService::ops :datatype-) "BankService/ops")
(setf (get BankService::ops :definition-)
      "int8 selection
float32 money
int16 id
string name
bool get_display
")



(provide :BankService/ops "de131049108731bc3c4ba83f05414a14")


