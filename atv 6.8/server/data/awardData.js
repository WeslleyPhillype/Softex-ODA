const { db } = require('../infra/database');

exports.getGoldenAwards = async () => {
    const con = await db();
    const [rows] = await con.query(`
    SELECT award.year_award AS 'Golden Joystick Awards',
    game.id_game AS 'ID Game',
    game.name_game AS 'Game',
    game.genre AS 'Gênero',
    developer.name_dev AS 'Desenvolvedora'
    FROM game
    INNER JOIN developer ON developer.id_dev = game.id_dev
    INNER JOIN award ON award.id_game = game.id_game
    WHERE award.name_award = 'Golden Joystick Awards'
    ORDER BY award.year_award ASC;`);
    return rows;
}

exports.getGoldenAwardsYear = async (year) => {
    const con = await db();
    const [rows] = await con.query(`
    SELECT award.year_award AS 'Golden Joystick Awards',
    game.name_game AS 'Game',
    game.genre AS 'Gênero',
    developer.name_dev AS 'Desenvolvedora'
    FROM game
    INNER JOIN developer
        ON developer.id_dev = game.id_dev
    INNER JOIN award
        ON award.id_game = game.id_game
    WHERE award.name_award = 'Golden Joystick Awards' AND award.year_award = '${year}'
    ORDER BY award.year_award ASC;`
    );
    return rows;
}

/*Camada de querys comunicadas a infra (database connection)*/