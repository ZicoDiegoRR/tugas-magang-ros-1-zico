; Auto-generated. Do not edit!


(cl:in-package BankService-srv)


;//! \htmlinclude ops1-request.msg.html

(cl:defclass <ops1-request> (roslisp-msg-protocol:ros-message)
  ((selection
    :reader selection
    :initarg :selection
    :type cl:fixnum
    :initform 0)
   (money
    :reader money
    :initarg :money
    :type cl:float
    :initform 0.0)
   (id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (get_display
    :reader get_display
    :initarg :get_display
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ops1-request (<ops1-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ops1-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ops1-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name BankService-srv:<ops1-request> is deprecated: use BankService-srv:ops1-request instead.")))

(cl:ensure-generic-function 'selection-val :lambda-list '(m))
(cl:defmethod selection-val ((m <ops1-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader BankService-srv:selection-val is deprecated.  Use BankService-srv:selection instead.")
  (selection m))

(cl:ensure-generic-function 'money-val :lambda-list '(m))
(cl:defmethod money-val ((m <ops1-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader BankService-srv:money-val is deprecated.  Use BankService-srv:money instead.")
  (money m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <ops1-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader BankService-srv:id-val is deprecated.  Use BankService-srv:id instead.")
  (id m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <ops1-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader BankService-srv:name-val is deprecated.  Use BankService-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'get_display-val :lambda-list '(m))
(cl:defmethod get_display-val ((m <ops1-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader BankService-srv:get_display-val is deprecated.  Use BankService-srv:get_display instead.")
  (get_display m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ops1-request>) ostream)
  "Serializes a message object of type '<ops1-request>"
  (cl:let* ((signed (cl:slot-value msg 'selection)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'money))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'get_display) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ops1-request>) istream)
  "Deserializes a message object of type '<ops1-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'selection) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'money) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'get_display) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ops1-request>)))
  "Returns string type for a service object of type '<ops1-request>"
  "BankService/ops1Request")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ops1-request)))
  "Returns string type for a service object of type 'ops1-request"
  "BankService/ops1Request")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ops1-request>)))
  "Returns md5sum for a message object of type '<ops1-request>"
  "2c0fa4564a7bae7c28ac5a5f4bafcf82")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ops1-request)))
  "Returns md5sum for a message object of type 'ops1-request"
  "2c0fa4564a7bae7c28ac5a5f4bafcf82")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ops1-request>)))
  "Returns full string definition for message of type '<ops1-request>"
  (cl:format cl:nil "int8 selection~%float32 money~%int16 id~%string name~%bool get_display~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ops1-request)))
  "Returns full string definition for message of type 'ops1-request"
  (cl:format cl:nil "int8 selection~%float32 money~%int16 id~%string name~%bool get_display~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ops1-request>))
  (cl:+ 0
     1
     4
     2
     4 (cl:length (cl:slot-value msg 'name))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ops1-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ops1-request
    (cl:cons ':selection (selection msg))
    (cl:cons ':money (money msg))
    (cl:cons ':id (id msg))
    (cl:cons ':name (name msg))
    (cl:cons ':get_display (get_display msg))
))
;//! \htmlinclude ops1-response.msg.html

(cl:defclass <ops1-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass ops1-response (<ops1-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ops1-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ops1-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name BankService-srv:<ops1-response> is deprecated: use BankService-srv:ops1-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <ops1-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader BankService-srv:result-val is deprecated.  Use BankService-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ops1-response>) ostream)
  "Serializes a message object of type '<ops1-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ops1-response>) istream)
  "Deserializes a message object of type '<ops1-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ops1-response>)))
  "Returns string type for a service object of type '<ops1-response>"
  "BankService/ops1Response")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ops1-response)))
  "Returns string type for a service object of type 'ops1-response"
  "BankService/ops1Response")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ops1-response>)))
  "Returns md5sum for a message object of type '<ops1-response>"
  "2c0fa4564a7bae7c28ac5a5f4bafcf82")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ops1-response)))
  "Returns md5sum for a message object of type 'ops1-response"
  "2c0fa4564a7bae7c28ac5a5f4bafcf82")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ops1-response>)))
  "Returns full string definition for message of type '<ops1-response>"
  (cl:format cl:nil "string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ops1-response)))
  "Returns full string definition for message of type 'ops1-response"
  (cl:format cl:nil "string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ops1-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ops1-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ops1-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ops1)))
  'ops1-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ops1)))
  'ops1-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ops1)))
  "Returns string type for a service object of type '<ops1>"
  "BankService/ops1")