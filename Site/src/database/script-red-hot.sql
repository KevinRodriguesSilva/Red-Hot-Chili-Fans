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
	(NULL, 'The Red Hot Chili Peppers', '1984-08-10'),
	(NULL, 'Freaky Styley', '1985-08-16'),
	(NULL, 'The Uplift Morfo Party Plan', '1987-09-29'),
	(NULL, 'Mothers Milk', '1989-08-16'),
	(NULL, 'Blood Sugar sex Magik', '1991-09-24'),
	(NULL, 'One Hot Minute', '1995-09-12'),
	(NULL, 'Californication', '1999-06-08'),
	(NULL, 'By the way', '2002-07-09'),
	(NULL, 'Stadium Arcadium', '2006-05-09'),
	(NULL, 'Im With You', '2011-08-26'),
	(NULL, 'The Getaway', '2016-06-17'),
	(NULL, 'Unlimited Love', '2022-04-01'),
	(NULL, 'Return Of The Dream Canteen ', '2022-10-14');

CREATE TABLE musica(
	idMusica INT AUTO_INCREMENT,
    nome VARCHAR(30),
    fkAlbum INT, CONSTRAINT fkAlbumMusica FOREIGN KEY(fkAlbum) REFERENCES album(idAlbum),
    CONSTRAINT pkCompostaMusicaAlbum PRIMARY KEY (idMusica, fkAlbum)
);

INSERT INTO musica VALUES
	(NULL, 'Higher Ground', 4),
	(NULL, 'Scar Tissue', 7),
	(NULL, 'Black Summer', 12),
	(NULL, 'Its Only Natural', 12),
	(NULL, 'The Heavy Wing', 12),
	(NULL, 'Monarchy Of Roses', 10),
	(NULL, 'Eddie', 13),
	(NULL, 'Fake as Fu@k', 13),
	(NULL, 'Me And My Friends', 3),
	(NULL, 'Universally Speaking', 8),
	(NULL, 'Goodbye Angels', 11),
	(NULL, 'The Longest Wave', 11),
	(NULL, 'If You Have To Ask', 5);
    
    DROP DATABASE redhot;


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
	(NULL, 3, 3, 1, NOW());
    
    
-- SELECT DE QUANTIDADE DE VOTOS
SELECT nome AS nomeMusica, COUNT(*) AS Votos FROM voto JOIN musica ON fkMusica = idMusica WHERE fkUsuario = 1 GROUP BY nome;

-- SELECT QUANTIDADE TOTAL DE VOTOS POR USUÁRIO

SELECT COUNT(*) FROM voto WHERE fkUsuario = 1;

SELECT nome as nomeMusica, COUNT(*) AS votos FROM voto JOIN musica ON fkMusica = idMusica GROUP BY nomeMusica ORDER BY votos DESC LIMIT 5; 

-- SELECT DA MUSICA COM MAIS VOTOS
SELECT nome AS nomeMusica, MAX(COUNT(nome)) AS Votos FROM voto JOIN musica ON fkMusica = idMusica WHERE fkUsuario = 1;

SELECT nome as nomeMusica, count(*) AS votos FROM voto JOIN musica ON fkMusica = idMusica  WHERE fkUsuario = 2 
	GROUP BY nomeMusica ORDER BY votos DESC LIMIT 1;

SELECT count(*) AS votos, max(votos) FROM voto;

-- VIEW
CREATE VIEW votosUsuario AS
SELECT idVoto, fkUsuario, fkMusica, dataVoto FROM voto;

-- CHAMANDO A VIEW
SELECT * FROM votosUsuario;

SELECT * FROM usuario;

