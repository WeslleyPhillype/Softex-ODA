const express = require('express');
const router = express.Router();
const awardService = require('../service/awardService');

router
    //trazer todos os vencedores do joystick-awards
    .get('/golden-joystick-awards', async (req, res) => {
        const getGoldenAwards = await awardService.getGoldenAwards();
        res.status(200).json(getGoldenAwards);
    })

    //trazer vencedor no ano selecionado
    .get('/golden-joystick-awards/ano/:id', async (req, res) => {
        const id = req.params.id;
        const getGoldenAwardsYear = await awardService.getGoldenAwardsYear(id);
        if(getGoldenAwardsYear.length <= 0) {
            res.sendStatus(400);
        } else {
            res.status(200).json(getGoldenAwardsYear);
        }        
    })

    //lista de games + genero + desenvolvedora ordenado por nome asc
    .get('/game-list', async (req, res) => {
        const getGames = await awardService.getGames();
        res.status(200).json(getGames);
    })

    //game especifico por id + genero
    .get('/game/:id', async (req, res) => {
        const id = req.params.id;
        const getGameId = await awardService.getGameId(id);
        if(getGameId.length <= 0) {
            res.sendStatus(404);
        } else {
            res.status(200).json(getGameId);
        }     
    })
    
    //inserir novo jogo
    .post('/new-game', async (req, res) => {
        try {
            const { name, genre, devId } = req.body;
            const createGame = await awardService.createGame(name, genre, devId);
            res.status(201).json(createGame);
        } catch (err) {
            res.sendStatus(400);
        }
    })

    //atualizar um jogo
    .put('/up-game/:id', async (req, res) => {
        const id = req.params.id;
        const { name, genre} = req.body;
        const upGame = await awardService.upGame(id, name, genre);

        if (upGame.affectedRows <= 0) {
            res.sendStatus(404);
        } else {
            res.status(200).json(upGame);
        }
    })

    //deletar um jogo
    .delete('/del-game/:id', async (req, res) => {
        const id = req.params.id;
        const delGame = await awardService.delGame(id);

        if(delGame.affectedRows <= 0) {
            res.sendStatus(404);
        } else {
            res.status(200).send('Deletado');
        }
    })

module.exports = router;