const express = require("express");
const router = express.Router();
const userController = require("../controllers/userController");

// create a user
router.post("/user", userController.createUser);
//delete a user by email
router.delete('/user/:email', userController.deleteUser);
// update a user by email
router.put("/user/:email", userController.updateUser);
// login api for the user.
router.post("/user/login", userController.login);

module.exports = router;