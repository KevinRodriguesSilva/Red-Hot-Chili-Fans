var database = require("../database/config")

function buscarMusicas (){
    var instrucao = '';

    var instrucao = 'SELECT nome, idMusica, fkAlbum FROM musica ORDER BY nome;'

    return database.executar(instrucao);
}


function votar(idMusica, idUsuario, idAlbum) {

    var instrucao = ''
    
    if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {

        var instrucao = `INSERT INTO voto (fkUsuario, fkMusica, fkAlbum) 
            VALUES  (${idUsuario}, ${idMusica}, ${idAlbum});`
        
        
        return database.executar(instrucao); 

        // instrucaoSql = `
        // select 
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,
        //                 momento,
        //                 DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
        //             from medida
        //             where fk_aquario = ${idAquario}
        //             order by id desc limit ${limite_linhas}
        //             `;
    }
}


module.exports = {
    votar,
    buscarMusicas
};