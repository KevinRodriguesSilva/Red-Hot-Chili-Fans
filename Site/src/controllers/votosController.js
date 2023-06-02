var votosModel = require("../models/votosModel");

function buscarMusicas (req, res) {
    
    votosModel.buscarMusicas().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
            console.log(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
            console.log(resultado);
        }
    }).catch(
        function (erro) {
            console.log(erro);
            console.log("Houve um erro ao realizar a consulta! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );
}


function votar(req, res){
    
    var idMusica = req.body.idMusicaServer;
    var idAlbum = req.body.idAlbumServer;
    var idUsuario = req.body.idUsuarioServer;
        // nomeMusica = req.body.nomeMusicaServer;

        console.log(idUsuario, idAlbum, idMusica);

        votosModel.votar(idMusica, idUsuario, idAlbum).then(function (resultado){
            res.status(200).json(resultado);
            // console.log(json(resultado));
            console.log('entrou no then da votar');
    });
}

module.exports = {
    votar,
    buscarMusicas
}