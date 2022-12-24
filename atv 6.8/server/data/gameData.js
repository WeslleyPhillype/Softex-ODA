const { db } = require('../infra/database');

exports.getGames = async () => {
    const con = await db();
    const [rows] = await con.query(`
    SELECT * , developer.name_dev
    FROM game
    INNER JOIN developer 
        ON game.id_dev = developer.id_dev
    ORDER BY game.name_game ASC;`
    );
    return rows;
}

exports.getGameId = async (id) => {
    const con = await db();
    const [rows] = await con.query(`
    SELECT name_game, genre
    FROM game
    WHERE id_game = ${id}`
    );
    return rows;
}
exports.createGame = async (name, genre, devId) => {
    const con = await db();
    const [rows] = await con.query(`
    INSERT INTO game (name_game, genre, id_dev) VALUES
    ('${name}', '${genre}', ${devId});`
    );
    return rows;
}

exports.upGame = async (id, name, genre) => {
    const con = await db();
    const [rows] = await con.query(`
    UPDATE game
    SET name_game = '${name}', genre = '${genre}'
    WHERE id_game = ${id}`
    );
    return rows;
}

exports.delGame = async (id) => {
    const con = await db();
    const [rows] = await con.query(`
    DELETE FROM game
    WHERE id_game = ${id}`
    );
    return rows;
}