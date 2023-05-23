–1)
CREATE TABLE arma(

	id_arma SERIAL PRIMARY KEY,

	nome VARCHAR(255),

	tipo VARCHAR(255),

	magica BOOLEAN,

	lendaria BOOLEAN

);



CREATE TABLE classe (

	id_classe SERIAL PRIMARY KEY,

	nome VARCHAR(255),

	proficiencia VARCHAR(255)

);

CREATE TABLE raca(

	id_raca SERIAL PRIMARY KEY,

	nome VARCHAR(255),

	altura_media DECIMAL(5, 2)

);

CREATE TABLE lugar(

	id_lugar SERIAL PRIMARY KEY, --Nome alterado de local para lugar

	nome VARCHAR(255),

	regiao VARCHAR(255),

	raca_id INTEGER,

	FOREIGN KEY (raca_id) REFERENCES raca(id_raca)

);

CREATE TABLE ser (

	id_ser SERIAL PRIMARY KEY,

	nome VARCHAR(255),

	titulo VARCHAR(255),

	familia VARCHAR(255),

	nascimento DATE,

	raca_id INTEGER,

	lugar_id INTEGER,

	classe_id INTEGER,

	arma_id INTEGER,

	FOREIGN KEY (raca_id) REFERENCES raca(id_raca),

	FOREIGN KEY (lugar_id) REFERENCES lugar(id_lugar),

	FOREIGN KEY (classe_id) REFERENCES classe(id_classe),

	FOREIGN KEY (arma_id) REFERENCES arma(id_arma)

);


INSERT INTO arma (nome, tipo, magica, lendaria) 
VALUES ('Sword of Fire', 'Sword', false, true);

INSERT INTO arma (nome, tipo, magica, lendaria) 
VALUES ('Bow of the Stars', 'Bow', true, true);

INSERT INTO arma (nome, tipo, magica, lendaria) 
VALUES ('Staff of Healing', 'Staff', true, false);

INSERT INTO classe (nome, proficiencia) 
VALUES ('Warrior', 'Sword');

INSERT INTO classe (nome, proficiencia) 
VALUES ('Archer', 'Bow');

INSERT INTO classe (nome, proficiencia) 
VALUES ('Mage', 'Magic');

INSERT INTO raca (nome, altura_media) 
VALUES ('Human', 1.8);

INSERT INTO raca (nome, altura_media) 
VALUES ('Elf', 1.7);

INSERT INTO raca (nome, altura_media) 
VALUES ('Dwarf', 1.5);

INSERT INTO lugar (nome, regiao, raca_id) 
VALUES ('Castle of Kings', 'North Kingdom', 1);

INSERT INTO lugar (nome, regiao, raca_id) 
VALUES ('Elven Forest', 'Enchanted Realm', 2);

INSERT INTO lugar (nome, regiao, raca_id) 
VALUES ('Dwarven Mines', 'Mountain Range', 3);

INSERT INTO ser (nome, titulo, familia, nascimento, raca_id, lugar_id, classe_id, arma_id) 
VALUES ('Arthur', 'Knight', 'Pendragon', '1990-05-10', 1, 1, 1, 1);

INSERT INTO ser (nome, titulo, familia, nascimento, raca_id, lugar_id, classe_id, arma_id) 
VALUES ('Lorelei', 'Ranger', 'Starfall', '1995-08-15', 2, 2, 2, 2);

INSERT INTO ser (nome, titulo, familia, nascimento, raca_id, lugar_id, classe_id, arma_id) 
VALUES ('Gimli', 'Mage', 'Stonehammer', '1988-12-01', 3, 3, 3, 3);

–A )
 SELECT arma.nome AS nome_arma, lugar.nome AS nome_lugar
FROM ser
INNER JOIN arma ON ser.arma_id = arma.id_arma
INNER JOIN lugar ON ser.lugar_id = lugar.id_lugar;

SELECT arma.nome AS nome_arma, lugar.nome AS nome_lugar
FROM ser
RIGHT JOIN arma ON ser.arma_id = arma.id_arma
LEFT JOIN lugar ON ser.lugar_id = lugar.id_lugar;

–B) 
SELECT classe.nome AS nome_classe, lugar.nome AS nome_lugar
FROM ser
INNER JOIN classe ON ser.classe_id = classe.id_classe
INNER JOIN lugar ON ser.lugar_id = lugar.id_lugar;


–C)
SELECT arma.tipo AS tipo_arma, raca.nome AS nome_raca
FROM ser
INNER JOIN arma ON ser.arma_id = arma.id_arma
INNER JOIN raca ON ser.raca_id = raca.id_raca;



–2)
CREATE TABLE casas(
	id_casa SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	fundador VARCHAR(255),
	cores VARCHAR(50),
	caracteristicas VARCHAR(500),
	diretor VARCHAR(255)
);

CREATE TABLE alunos(
	id_aluno SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	idade INTEGER,
	patrono VARCHAR(100),
	casas_id_casa INTEGER,
	FOREIGN KEY (casas_id_casa) REFERENCES casas(id_casa)
);

CREATE TABLE alimentos(
	id_alimento SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	quantidade INTEGER,
	categoria VARCHAR(100),
	validade DATE,
	alucinogeno INTEGER
);

CREATE TABLE itens_magicos(
	id_itens_magicos SERIAL PRIMARY KEY,
	nome VARCHAR(45),
	descricao VARCHAR(45),
	efeito VARCHAR(100),
	contra_efeito VARCHAR(100),
	tipo VARCHAR(45),
	alunos_id_aluno INTEGER,
	FOREIGN KEY(alunos_id_aluno) REFERENCES alunos(id_aluno)
);

CREATE TABLE inventario(
	id_inventario SERIAL PRIMARY KEY,
	casas_id_casa INTEGER,
	alimentos_id_alimento INTEGER,
	alunos_id_alunos INTEGER,
	itens_magicos_id_itens_magicos INTEGER,
	data_festa DATE,
	FOREIGN KEY(casas_id_casa) REFERENCES casas(id_casa),
	FOREIGN KEY(alimentos_id_alimento) REFERENCES alimentos(id_alimento),
	FOREIGN KEY(alunos_id_alunos) REFERENCES alunos(id_aluno),
	FOREIGN KEY(itens_magicos_id_itens_magicos) REFERENCES itens_magicos(id_itens_magicos)

);

INSERT INTO casas (nome, fundador, cores, caracteristicas, diretor)
VALUES ('Gryffindor', 'Godric Gryffindor', 'Red and Gold', 'Bravery, daring, chivalry', 'Minerva McGonagall');

INSERT INTO casas (nome, fundador, cores, caracteristicas, diretor)
VALUES ('Hufflepuff', 'Helga Hufflepuff', 'Yellow and Black', 'Hard work, dedication, patience', 'Pomona Sprout');

INSERT INTO casas (nome, fundador, cores, caracteristicas, diretor)
VALUES ('Ravenclaw', 'Rowena Ravenclaw', 'Blue and Bronze', 'Intelligence, wisdom, creativity', 'Filius Flitwick');

INSERT INTO casas (nome, fundador, cores, caracteristicas, diretor)
VALUES ('Slytherin', 'Salazar Slytherin', 'Green and Silver', 'Ambition, cunning, resourcefulness', 'Severus Snape');


INSERT INTO alunos (nome, idade, patrono, casas_id_casa)
VALUES ('Harry Potter', 17, 'Stag', 1);

INSERT INTO alunos (nome, idade, patrono, casas_id_casa)
VALUES ('Hermione Granger', 17, 'Otter', 1);

INSERT INTO alunos (nome, idade, patrono, casas_id_casa)
VALUES ('Cedric Diggory', 17, 'Badger', 2);

INSERT INTO alimentos (nome, quantidade, categoria, validade, alucinogeno)
VALUES ('Butterbeer', 20, 'Beverage', '2023-12-31', 0);

INSERT INTO alimentos (nome, quantidade, categoria, validade, alucinogeno)
VALUES ('Pumpkin Pasties', 10, 'Pastry', '2023-10-15', 0);

INSERT INTO alimentos (nome, quantidade, categoria, validade, alucinogeno)
VALUES ('Skele-Gro', 5, 'Medicine', '2024-06-30', 0);

INSERT INTO itens_magicos (nome, descricao, efeito, contra_efeito, tipo, alunos_id_aluno)
VALUES ('Invisibility Cloak', 'A cloak that grants invisibility', 'Makes the wearer invisible', 'Wears off after a certain duration', 'Cloak', 1);

INSERT INTO itens_magicos (nome, descricao, efeito, contra_efeito, tipo, alunos_id_aluno)
VALUES ('Elder Wand', 'The most powerful wand in existence', 'Amplifies the power of spells', 'May bring out the user''s dark side', 'Wand', 2);

INSERT INTO itens_magicos (nome, descricao, efeito, contra_efeito, tipo, alunos_id_aluno)
VALUES ('Marauder''s Map', 'A magical map of Hogwarts', 'Displays the location of people and secret passages', 'None', 'Map', 3);

INSERT INTO inventario (casas_id_casa, alimentos_id_alimento, alunos_id_alunos, itens_magicos_id_itens_magicos, data_festa)
VALUES (1, 1, 1, 1, '2023-11-30');

INSERT INTO inventario (casas_id_casa, alimentos_id_alimento, alunos_id_alunos, itens_magicos_id_itens_magicos, data_festa)
VALUES (2, 2, 2, 2, '2023-12-25');

INSERT INTO inventario (casas_id_casa, alimentos_id_alimento, alunos_id_alunos, itens_magicos_id_itens_magicos, data_festa)
VALUES (3, 3, 3, 3, '2024-01-15');

–A)
SELECT casas.fundador AS fundador_casa, itens_magicos.nome AS nome_itens_magicos
FROM casas
LEFT JOIN alunos ON casas.id_casa = alunos.casas_id_casa
LEFT JOIN itens_magicos ON itens_magicos.alunos_id_aluno = alunos.id_aluno;

–B)
