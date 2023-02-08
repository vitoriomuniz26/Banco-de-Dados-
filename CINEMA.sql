CREATE TABLE ator(
	codAtor INTEGER PRIMARY KEY,
	nomeAtor VARCHAR(30) NOT NULL,
	sexo CHAR (1) CHECK( sexo in ('M','F')),
	dataNascimento DATE,
	pais VARCHAR(30)
);

CREATE TABLE filme(
	codFilme INTEGER PRIMARY KEY,
	nomeOriginal VARCHAR(30) NOT NULL,
	nomePortugues VARCHAR(30) NOT NULL,
	ano DATE,
	paisProducao VARCHAR(30) NOT NULL
);

CREATE TABLE atuacao(
	codator INT,
	codfilme INT,
	FOREIGN KEY(codator) REFERENCES ator(codator),
	FOREIGN KEY(codfilme) REFERENCES filme(codfilme)
);

INSERT INTO ator(codAtor, nomeAtor, sexo, dataNascimento, pais)VALUES
(1, 'Jonas', 'M', '2003-12-26', 'Brasil'),
(2, 'João', 'M', '2003-12-27', 'Brasil'),
(3, 'Vitor', 'M', '2003-12-6', 'Brasil'),
(4, 'Vinicius', 'M', '2003-12-2', 'Brasil'),
(5, 'Roberto', 'M', '2003-12-24', 'Brasil'),
(6, 'Junior', 'M', '2003-12-10', 'Brasil'),
(7, 'Alan', 'M', '2003-12-21', 'Brasil'),
(8, 'Sarah', 'F', '2003-12-2', 'Brasil'),
(9, 'Agnes', 'F', '2003-12-4', 'Brasil'),
(10, 'Danilo', 'F', '2003-12-5', 'Brasil');

INSERT INTO filme(codfilme, nomeoriginal, nomeportugues, ano, paisproducao)VALUES
(1,'Naruto','Narutobr', '1990-10-11', 'Japão'),
(2,'Velozes e Furiosos','Velozes e Curiosos', '2022-10-11', 'EUA'),
(3,'Invasão a House White','Casa Branca', '2003-10-11', 'EUA'),
(4,'School House','Casa Escola', '2004-10-11', 'EUA'),
(5,'Invasão a House Green','Casa Verde', '2005-10-11', 'EUA'),
(6,'Invasão a House Blue','Casa Azul', '2006-10-11', 'EUA'),
(7,'Invasão a House Yellow','Casa Amarela', '2007-10-11', 'EU'),
(8,'Invasão a House Red','Casa Vermelha', '2008-10-11', 'EUA'),
(9,'Invasão','Invasão', '2009-10-11', 'EU'),
(10,'White car','Carro Branco', '2021-10-11', 'EUA');

INSERT INTO atuacao(codator, codfilme) VALUES
(1,10),
(2,9),
(3,8),
(4,7),
(5,6),
(6,5),
(7,4),
(8,3),
(9,2),
(10,1);

---A
SELECT * FROM ator WHERE pais = 'Brasil';
---B
SELECT nomeator, sexo FROM ator WHERE pais = 'EUA';
---C
SELECT paisproducao, COUNT(paisproducao) FROM filme AS total WHERE paisproducao != 'Brasil' GROUP BY paisproducao;  
---D
SELECT a.nomeator, f.nomeoriginal, f.ano 
	FROM ator AS a
	JOIN atuacao AS at
		ON a.codator = at.codator
			JOIN filme AS f
				ON at.codfilme = f.codfilme
---E
SELECT nomeportugues, ano FROM filme WHERE ano = '1997-10-10';
---F
SELECT a.nomeator, sexo, pais
	FROM ator AS a
	JOIN atuacao AS at
		ON a.codator = at.codator
			JOIN filme AS f
				ON at.codfilme = f.codfilme
					WHERE f.paisproducao != 'Brasil' AND sexo = 'F' AND a.pais = 'Brasil';
					
UPDATE ator SET sexo = 'M' WHERE nomeator = 'Danilo';













