const express = require('express');
const app = express();
const port = 3005;
const bodyParser = require('body-parser');
const cors = require("cors");
require("./utils/db");
const userRouter = require("./routes/userRoutes");

//Middlewares
app.use(bodyParser.json());
app.use(cors());

//User API
app.use("/api", userRouter);

app.get('/',(req,res) =>{
    res.send("<h1> Welcome Sana Rashid</h1>");
});

app.listen(port,()=>{
    console.log('Server is listening on port', port);
});