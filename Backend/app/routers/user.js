const userController = require("../controllers/userController");
const router = require("express").Router();
const verifyToken = require("../utils/middleware");

router.get("/profile/:id", verifyToken.checkLogin, userController.getUserById);
router.get(
  "/searchByEmail",
  verifyToken.checkLogin,
  userController.searchUserByEmail
);
router.post("/search", verifyToken.checkLogin, userController.getAllUsers);
router.get("/profile", verifyToken.checkLogin, userController.getProfile);
router.put(
  "/updateProfile/:id",
  verifyToken.checkLogin,
  userController.updateProfile
);
router.put(
  "/changePassword/:id",
  verifyToken.checkLogin,
  userController.changePassword
);

router.post("/", verifyToken.checkLogin, userController.createUser);
router.put("/:id", verifyToken.checkLogin, userController.updateUser);
router.delete("/:id", verifyToken.checkLogin, userController.deleteUser);

router.post(
  "/get-all-client",
  verifyToken.checkLogin,
  userController.getAllClient
);

module.exports = router;
