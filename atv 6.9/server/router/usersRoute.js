const express = require('express');
const faker = require('faker');
const { body, validationResult } = require('express-validator');
const route = express.Router();

route
    .get('/', (req, res) => {
        res.status(200).json({
            msg: 'Bem Vindo!'
        });
    })

    .get('/usuario', (req, res) => {
        const dados_usuario = ({
            primeiroNome: faker.name.firstName(),
            ultimoNome: faker.name.lastName(),
            userName: faker.internet.userName(),
            email: faker.internet.email()
        });
        res.status(200).json(dados_usuario);
    })

    .get('/usuarios/:num', (req, res) => {
        const usuarios = [];
        const num = req.params.num;

        if (isFinite(num) && num > 0) {
            for (let i = 0; i < num; i++) {
                usuarios.push({
                    primeiroNome: faker.name.firstName(),
                    ultimoNome: faker.name.lastName(),
                    userName: faker.internet.userName(),
                    email: faker.internet.email()
                });
            }

            res.status(200).json(usuarios);
            
        } else {
            res.status(400).send({msg: 'Número de usuários inválido!'});
        }
    })

    .post('/usuario', [
        body('primeiroNome', 'insira um nome válido!').isLength({min: 3, max: 10}),
        body('ultimoNome', 'insira um nome válido!').isLength({min: 3, max: 10}),
        body('userName', 'insira um usuário válido!').isLength({min: 4, max: 8}),
        body('email', 'insira um e-mail válido!').isEmail()
        ], (req, res) => {
        const usuario = req.body;
        const errors = validationResult(req); //retorno dos erros

        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
            
        } else {
            res.status(201).json({msg: 'Usuário criado com sucesso!', userData: usuario});
        }
    })

module.exports = route;