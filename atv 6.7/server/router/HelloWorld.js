const express = require('express');
const router = express.Router(); //exportar as rotas deste arquivo.

router.get('/msg', (req, res) => {
    res.json([{
        id: 1,
        msg: 'Hello World',
        date: new Date()
    }]);
});

module.exports = router;