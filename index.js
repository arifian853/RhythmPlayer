require('dotenv').config();
const express       = require('express');
const app           = express();
const bodyParser    = require('body-parser');
const RouteData     = require('./routes/quotesData.js');
const mongoose      = require('mongoose');
const cors          = require('cors');

app.use(cors());

mongoose.connect(process.env.MONGO_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true
})

.then(res => {
    console.log('Database Connected !')
}).catch(e => {
    console.log('Database NOT CONNECTED !') 
}) 

app.use(bodyParser.json());    
app.use("", RouteData)


app.listen(process.env.PORT, (req,res) => {
    console.log(`Server run at PORT ${process.env.PORT} or localhost:${process.env.PORT}`) 
})