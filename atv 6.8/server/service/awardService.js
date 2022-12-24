const awardData = require('../data/awardData');
const gameData = require('../data/gameData');

exports.getGoldenAwards = () => {
    return awardData.getGoldenAwards();
}

exports.getGoldenAwardsYear = (year) => {
    return awardData.getGoldenAwardsYear(year);
}

exports.getGames = () => {
    return gameData.getGames();
}

exports.getGameId = (id) => {
    return gameData.getGameId(id);
}

exports.createGame = (name, genre, devId) => {
    return gameData.createGame(name, genre, devId);
}

exports.upGame = (id, name, genre) => {
    return gameData.upGame(id, name, genre);
}

exports.delGame = (id) => {
    return gameData.delGame(id);
}
/*Camada final de comunicação com o db para importa-la no awardRoute*/