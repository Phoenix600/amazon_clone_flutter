
const express = require("express");
const mongoose = require("mongoose");

const authRouter = require("./routes/auth");

const PORT = 3000;

const app = express();
const DB = "mongodb+srv://pranay:root@cluster0.oz7eirb.mongodb.net/?retryWrites=true&w=majority";

app.use(express.json());
app.use(authRouter); // This enables the index file to get aware of the authRouter middleware 

// Making connection with the database 
mongoose.connect(DB).then(
  () => { console.log("Connection with mongodb was successful"); }
).catch((e) => { console.log(e); });

// Listening the server at PORT 3000
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Running Server at port ${PORT}`);
}) 
