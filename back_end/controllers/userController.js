const User = require("../models/user");

async function createUser(req, res) {
  try {
    const user = await User.create(req.body);
    res.status(201).json({
      message: "User has been created successfully.",
      user: user,});
  } catch (error) {
    res.status(500).json({error: error.message});
  }
}

async function getUser(req, res) {
  try {
    const { email } = req.params;
    const user = await User.findOne({ email });

    if (!user) {
      return res.status(404).json({ message: "User not found", data: null });
    }

    res.json({ message: "User found", data: user });
  } catch (err) {
    res.status(500).json({ success: false, message: err.message, data: null });
  }
}

async function updateUser(req, res) {
  try {
    const { email } = req.params;
    const updatedUser = await User.findOneAndUpdate({ email }, req.body, {new: true,});

    if (!updatedUser) {
      return res.status(404).json({ error: "User not found" });
    }

    res.json({
      message: "User has been updated successfully", user: updatedUser,});
  } 
  catch (err) {
    res.status(500).json({ error: err.message });
  }
}

async function deleteUser(req, res) {
    try {
        const { email } = req.params;
        await User.findByIdAndRemove(email);
        res.status(200).json({ message: "Deleted" });
    }
    catch (err) {
        res.status(500).json({ error: err.message });
    }
}

const login = async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });

    if (!user) {
      return res.status(401).json({ message: "User not found." });
    }

    if (user.password !== password) {
      return res.status(401).json({ message: "Incorrect password." });
    }

    res.status(200).json({ message: "Logged in successfully.", data: user });
  } 
  catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = {
  createUser,
  getUser,
  updateUser,
  deleteUser,
  login,
};