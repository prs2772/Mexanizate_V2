import express from "express";
import path from "path";
import { assetsRouterImage, assetsRouterVideo } from "./server/assets-router.js";

const app = express();
const __dirname = path.dirname(new URL(import.meta.url).pathname);

app.use("/", express.static(path.join(__dirname, "public")));
app.use("/src", assetsRouterImage);
app.use("/src", assetsRouterVideo);
app.get("/api/v1", (req, res) => {
  res.json({
    project: "React JS with NodeJs",
    version: "1.0.1",
  });
});
app.get("/*", (_req, res) => {
  console.log("__dirname:", __dirname.substring(1));
  res.sendFile("/index.html", { root: __dirname.substring(1) });
})
const { PORT = 5000 } = process.env;
app.listen(PORT, () => {
  console.log();
  console.log(`  App running in port ${PORT}`);
  console.log();
  console.log(`  > Local: \x1b[36mhttp://localhost:\x1b[1m${PORT}/\x1b[0m`);
});
