const mongoose = require("mongoose");

//Schema for user
const userSchema = mongoose.Schema(
  {
    username: String,
    email: {
      type: String,
      unique: true,
    },
    password: String,
},{ timestamps: true });//adds created at and updated at attributes in schema

module.exports = mongoose.model("Users", userSchema);