var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idUsuario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idUsuario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
});

router.get("/kpi/:idUsuario", function (req, res) {
    medidaController.buscarKPI(req, res);
});

router.get("/total/:idUsuario", function (req, res) {
    medidaController.buscarTotal(req, res);
});

router.get("/ranking", function (req, res) {
    medidaController.buscarRank(req, res);
});

module.exports = router;