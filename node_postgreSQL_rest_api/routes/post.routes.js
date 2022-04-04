const Router = require("express");
const router = new Router();
const postController = require("../controllers/post.controller");

router.post("/posts", postController.createPost);
router.get("/posts", postController.gePostsByUser);

module.exports = router;
