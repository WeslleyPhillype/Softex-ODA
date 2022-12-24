const express = require('express');
const app = express();
const port = 8081;

app.use(express.json());
app.use('/', require('./router/usersRoute'));
app.listen(port, () => console.log('\tServer On'));