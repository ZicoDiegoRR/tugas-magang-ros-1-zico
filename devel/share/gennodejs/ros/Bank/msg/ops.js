// Auto-generated. Do not edit!

// (in-package Bank.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ops {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.selection = null;
      this.money = null;
      this.id = null;
      this.name = null;
      this.get_display = null;
    }
    else {
      if (initObj.hasOwnProperty('selection')) {
        this.selection = initObj.selection
      }
      else {
        this.selection = 0;
      }
      if (initObj.hasOwnProperty('money')) {
        this.money = initObj.money
      }
      else {
        this.money = 0.0;
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('get_display')) {
        this.get_display = initObj.get_display
      }
      else {
        this.get_display = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ops
    // Serialize message field [selection]
    bufferOffset = _serializer.int8(obj.selection, buffer, bufferOffset);
    // Serialize message field [money]
    bufferOffset = _serializer.float32(obj.money, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.int16(obj.id, buffer, bufferOffset);
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [get_display]
    bufferOffset = _serializer.bool(obj.get_display, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ops
    let len;
    let data = new ops(null);
    // Deserialize message field [selection]
    data.selection = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [money]
    data.money = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [get_display]
    data.get_display = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'Bank/ops';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'de131049108731bc3c4ba83f05414a14';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 selection
    float32 money
    int16 id
    string name
    bool get_display
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ops(null);
    if (msg.selection !== undefined) {
      resolved.selection = msg.selection;
    }
    else {
      resolved.selection = 0
    }

    if (msg.money !== undefined) {
      resolved.money = msg.money;
    }
    else {
      resolved.money = 0.0
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.get_display !== undefined) {
      resolved.get_display = msg.get_display;
    }
    else {
      resolved.get_display = false
    }

    return resolved;
    }
};

module.exports = ops;
