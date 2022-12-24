const express = require('express');
const app = express();
require('dotenv').config();
const portServer = process.env.PORT;

app.use('/', require('./router/helloWorld')); //importando rota get(/msg) do hello world.

app.listen(portServer, () => console.log("\n\tServer On!"));