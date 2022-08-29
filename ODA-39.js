let fps = {
    jogo: "First Person Shooter - FPS",
    nome: "Valorant",
    plataforma: "Computador",
    qtPlayers: 4,
};

let players = ["lelo, sleeper, enoki, Dodas"];
let pos = [1, 2, 3, 4];

const propriedade = () => {
    for (let prop in fps) {
        console.log(`${prop}: ${fps[prop]}`);
    }
}

const nomePlayers = () => {
     for (let nomePlayers of players) {
        console.log(`nome dos players: ${nomePlayers}`);
    }
}

propriedade();
nomePlayers();