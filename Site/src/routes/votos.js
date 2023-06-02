var express = require("express");
var router = express.Router();

var votosController = require("../controllers/votosController");

// router.get("/", function (req, res) {
//     usuarioController.testar(req, res);
// });

router.post("/votar/:idUsuario", function (req, res) {
    votosController.votar(req, res);
});

router.get("/buscarMusicas", function (req, res) {
    votosController.buscarMusicas(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
// router.post("/cadastrar", function (req, res) {
//     usuarioController.verificarCadastrar(req, res);
// })

// router.post("/autenticar", function (req, res) {
//     usuarioController.entrar(req, res);
// });

module.exports = router;