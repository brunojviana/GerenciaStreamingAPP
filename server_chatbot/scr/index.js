const express = require('express')
const cors = require('cors') 
const bodyParser = require('body-parser')
const port = process.env.PORT || 3000;
var app = express()

app.use(bodyParser.urlencoded({extended : false}))
app.use(bodyParser.json())

require('./routes/dialogflow.route')(app);

app.listen(port, () => {
    console.log(`Servidor na porta ${port}.`);
});
