var database = require("../database/config");

function buscarUltimasMedidas(idUsuario, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        // instrucaoSql = `select top ${limite_linhas}
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,  
        //                 momento,
        //                 FORMAT(momento, 'HH:mm:ss') as momento_grafico
        //             from medida
        //             where fk_aquario = ${idAquario}
        //             order by id desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
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
        instrucaoSql = `
        SELECT nome AS nomeMusica, COUNT(*) AS Votos FROM voto JOIN musica ON fkMusica = idMusica WHERE fkUsuario = ${idUsuario} GROUP BY nome LIMIT 5;`;
        console.log(idUsuario);
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idUsuario) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        // instrucaoSql = `select top 1
        // dht11_temperatura as temperatura, 
        // dht11_umidade as umidade,  
        //                 CONVERT(varchar, momento, 108) as momento_grafico, 
        //                 fk_aquario 
        //                 from medida where fk_aquario = ${idAquario} 
        //             order by id desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `SELECT nome AS nomeMusica, COUNT(*) AS Votos FROM voto JOIN musica ON fkMusica = idMusica WHERE fkUsuario = ${idUsuario} GROUP BY nome LIMIT 5;`;
        console.log(idUsuario);
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarKPI(idUsuario){
    var instrucaoSql = '';

    if (process.env.AMBIENTE_PROCESSO == 'desenvolvimento'){
        instrucaoSql = 'SELECT nome'
    }else {
        console.log('erro no ambiente')
        return;
    }
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarKPI
}
