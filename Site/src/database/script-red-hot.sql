CREATE DATABASE redhot;

USE redhot;

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    sobrenome VARCHAR(45),
    email VARCHAR(50), CONSTRAINT chkArroba CHECK(email LIKE '%@%.com'),
    senha CHAR(8)
);

CREATE TABLE album(
	idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dataLancamento DATE
);

INSERT INTO album VALUES
	(NULL, 'The Red Hot Chili Peppers', '1984-08-10');

CREATE TABLE musica(
	idMusica INT AUTO_INCREMENT,
    nome VARCHAR(30),
    fkAlbum INT, CONSTRAINT fkAlbumMusica FOREIGN KEY(fkAlbum) REFERENCES album(idAlbum),
    CONSTRAINT pkCompostaMusicaAlbum PRIMARY KEY (idMusica, fkAlbum)
);

INSERT INTO musica VALUES
	(NULL, 'Mommy Wheres Daddy?', 1);

CREATE TABLE voto (
	idVoto INT AUTO_INCREMENT,
	fkUsuario INT,
    fkMusica INT,
    fkAlbum INT,
    dataVoto DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fkUsuarioVoto FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    CONSTRAINT fkMusicaVoto FOREIGN KEY (fkMusica, fkAlbum) REFERENCES musica(idMusica, fkAlbum),
    CONSTRAINT pkComposta PRIMARY KEY (idVoto, fkUsuario, fkMusica, fkAlbum)
);

INSERT INTO voto VALUES
	(NULL, 2, 3, 1, NOW());
    
    
-- SELECT DE QUANTIDADE DE VOTOS
SELECT nome AS nomeMusica, COUNT(*) AS Votos FROM voto JOIN musica ON fkMusica = idMusica WHERE fkUsuario = 1 GROUP BY nome;

-- SELECT DA MUSICA COM MAIS VOTOS
SELECT nome AS nomeMusica, MAX(COUNT(nome)) AS Votos FROM voto JOIN musica ON fkMusica = idMusica WHERE fkUsuario = 1;

SELECT fkMusica, count(*) AS votos FROM voto WHERE fkUsuario = 2 GROUP BY fkMusica ORDER BY votos DESC LIMIT 1;

SELECT count(*) AS votos, max(votos) FROM voto;

-- VIEW
CREATE VIEW votosUsuario AS
SELECT idVoto, fkUsuario, fkMusica, dataVoto FROM voto;

-- CHAMANDO A VIEW
SELECT * FROM votosUsuario;

SELECT * FROM usuario;

