require('dotenv').config();

const db = async () => {
    if (global.connection && global.connection.state != 'disconnected')
        return global.connection;

    const mysql = require('mysql2/promise')
    const con = mysql.createConnection({
        host:     process.env.MYSQL_HOST,
        user:     process.env.MYSQL_USER,
        password: process.env.MYSQL_PASS,
        database: process.env.MYSQL_DATABASE
    });
    console.log(`\tBanco Conectado!\n`);
    global.connection = con;
    return con;
}

module.exports = {
    db
}