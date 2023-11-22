DROP SCHEMA IF EXISTS nagem ;
CREATE SCHEMA IF NOT EXISTS nagem;
USE nagem ;

CREATE TABLE IF NOT EXISTS categoria (
  idCategoria INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCategoria));
  
INSERT INTO categoria (descricao) VALUES ("Animes");
INSERT INTO categoria (descricao) VALUES ("Séries");
INSERT INTO categoria (descricao) VALUES ("Filmes");
INSERT INTO categoria (descricao) VALUES ("Games");
INSERT INTO categoria (descricao) VALUES ("Mangás");

CREATE TABLE IF NOT EXISTS genero (
  idGenero INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idGenero));
  
INSERT INTO genero (descricao) VALUES ("Ação");
INSERT INTO genero (descricao) VALUES ("Aventura");
INSERT INTO genero (descricao) VALUES ("Comédia");
INSERT INTO genero (descricao) VALUES ("Documentário");
INSERT INTO genero (descricao) VALUES ("Fantasia");
INSERT INTO genero (descricao) VALUES ("Faroeste");
INSERT INTO genero (descricao) VALUES ("Ficção Científica");
INSERT INTO genero (descricao) VALUES ("Filme de Guerra");
INSERT INTO genero (descricao) VALUES ("Filme Policial");
INSERT INTO genero (descricao) VALUES ("Filme de Herói");
INSERT INTO genero (descricao) VALUES ("Mistério");
INSERT INTO genero (descricao) VALUES ("Musical");
INSERT INTO genero (descricao) VALUES ("Romance");
INSERT INTO genero (descricao) VALUES ("Terror");
INSERT INTO genero (descricao) VALUES ("Thriller");

CREATE TABLE IF NOT EXISTS obra (
  idObra INT NOT NULL AUTO_INCREMENT,
  idade VARCHAR(10) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  idGenero INT NOT NULL,
   CONSTRAINT FK_idGenero FOREIGN KEY (idGenero) REFERENCES genero(idGenero),
  PRIMARY KEY (idObra));

CREATE TABLE IF NOT EXISTS usuario (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(45) NOT NULL,
  senha VARCHAR (45) NOT NULL,
  nick_name VARCHAR(45) NOT NULL,
  dt_nasc VARCHAR(10) NOT NULL,
  PRIMARY KEY (idUsuario));
  
  INSERT INTO usuario (email, senha, nick_name, dt_nasc) VALUES ("victorgermano2005@gmail.com", "bivic2021", "Germas", "2005-11-09");

CREATE TABLE IF NOT EXISTS forum (
	idForum INT NOT NULL AUTO_INCREMENT,
	obra VARCHAR(45) NOT NULL,
	data_forum VARCHAR(10) NOT NULL,
	descricao VARCHAR(45) NOT NULL,
	idGenero INT NOT NULL,
	idCategoria INT NOT NULL,
	idObra INT NULL,
	idUsuario INT NOT NULL,

	CONSTRAINT FK_idObra FOREIGN KEY (idObra) REFERENCES obra(idObra),
    CONSTRAINT FK_idUsuario FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
PRIMARY KEY (idForum));

CREATE TABLE mensagem (
	idMensagem INT(11) NOT NULL AUTO_INCREMENT,
	textousuario VARCHAR(1000) NOT NULL,
    idUsuario INT(11) NOT NULL,
    idForum INT(11) NOT NULL,
    hora DATETIME NOT NULL,
	PRIMARY KEY(idMensagem)
);

ALTER TABLE mensagem ADD CONSTRAINT FK_Usuario_Mensagem FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario);
ALTER TABLE mensagem ADD CONSTRAINT FK_Forum_Mensagem FOREIGN KEY (idForum) REFERENCES forum(idForum); 