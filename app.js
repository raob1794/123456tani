const express = require("express");
const app = express();
app.get("/", function (req,res) {
res.send("Response from the GET request")
});app.listen(3001);

console.debug("Test NodeJS !");