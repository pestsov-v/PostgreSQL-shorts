const express = require("express");
const userRouter = require("./routes/user.routes");
const postRouter = require("./routes/post.routes");

const PORT = process.env.PORT || 4000;

const app = express();
app.use(express.json());

app.use("/api/v1", userRouter);
app.use("/api/v1", postRouter);

app.get("/", (req, res) => {
  res.send("Hello postgreSQL");
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
