
const express=require("express");




const PORT=3000;


const app=express();
const mongoose =require("mongoose");
const adminRouter = require("./routes/admin");


const DB="mongodb+srv://egyptdevs:mrbxQXhPM1xC7P4v@cluster0.5l7nvit.mongodb.net/?retryWrites=true&w=majority";

const authRouter=require("./routes/auth");
const productRouter = require("./routes/products");
const userRouter=require("./routes/user")

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

mongoose.connect(DB).then(()=>{
    console.log("connection successfuly")
    }).catch((e)=>{
    console.log(e);
    });


app.listen(PORT,"0.0.0.0",function (){
    console.log(`connected to port: ${PORT}`);
});