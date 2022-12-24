const express = require('express');
require('dotenv').config();
const app = express();
const PORT = process.env.PORT_SERVER;

app.use(express.json());

//Import routes on dir router
app.use('/', require('./router/awardRoute'));

//Error on Server Side
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.sendStatus(500);
});

app.listen(PORT,() =>{console.log(`\tServidor Ativo!\n\t\tPara cancelar pressione: CTRL+C`)});