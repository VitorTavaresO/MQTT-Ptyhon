CREATE TABLE estado (
	id_estado SERIAL NOT NULL PRIMARY KEY,
	nome VARCHAR(50),
	sigla CHAR(2)
);

CREATE TABLE cidade(
	id_cidade SERIAL NOT NULL PRIMARY KEY,
	nome VARCHAR(255),
	estado_id INTEGER NOT NULL REFERENCES estado(id_estado)
);

CREATE TABLE fornecedor(
	id_fornecedor SERIAL NOT NULL PRIMARY KEY,
	nome VARCHAR(255),
	telefone VARCHAR(20),
	cidade_id INTEGER NOT NULL REFERENCES cidade(id_cidade)
);

CREATE TABLE vendedor(
	id_vendedor SERIAL NOT NULL PRIMARY KEY,
	nome VARCHAR(255),
	email VARCHAR(255),
	cidade_id INTEGER NOT NULL REFERENCES cidade(id_cidade)
);

CREATE TABLE cliente(
	id_cliente SERIAL NOT NULL PRIMARY KEY,
	nome VARCHAR(255),
	telefone VARCHAR(20),
	email VARCHAR(255),
	cidade_id INTEGER NOT NULL REFERENCES cidade(id_cidade)
);

CREATE TABLE produto(
	id_produto SERIAL NOT NULL PRIMARY KEY,
	nome VARCHAR(255),
	valor_unitario DECIMAL(5,2),
	fornecedor_id INTEGER NOT NULL REFERENCES fornecedor(id_fornecedor)
);


CREATE TABLE venda(
	id_venda SERIAL NOT NULL PRIMARY KEY,
	quantidade INTEGER,
	vendedor_id INTEGER NOT NULL REFERENCES vendedor(id_vendedor),
	cliente_id INTEGER NOT NULL REFERENCES cliente(id_cliente),
	produto_id INTEGER NOT NULL REFERENCES produto(id_produto)
);
INSERT INTO estado (nome, sigla)
VALUES
('Paraná', 'PR'),
('São Paulo', 'SP'),
('Santa Catarina', 'SC'),
('Mato Grosso', 'MG');

INSERT INTO cidade (nome, estado_id)
VALUES
('Curitiba', 1),
('São Paulo', 2),
('Florianópolis', 3);

INSERT INTO fornecedor (nome, telefone, cidade_id)
VALUES
('Ricardo', '123456789', 1),
('Roberval', '987654321', 2),
('Renato', '24681379', 3);

INSERT INTO  vendedor (nome, email, cidade_id)
VALUES
('Carla', 'carla@gmail.com', 1),
('Carlos', 'carlos@gmail.com', 2),
('Clovis', 'clovis@gmail.com', 3);

INSERT INTO cliente (nome, telefone, email, cidade_id)
VALUES
('Pedro', '123456789', 'pedro@gmail.com', 1),
('Petra', '987654321', 'petra@gmail.com', 2),
('Potra', '246813795', 'potra@gmail.com', 3);

INSERT INTO produto (nome, valor_unitario, fornecedor_id)
VALUES
('Tomate', 5.00, 1),
('Batata', 7.00, 2),
('Couve', 6.00, 3);
INSERT INTO venda (quantidade, vendedor_id, cliente_id, produto_id)
VALUES
(5, 1, 1, 1),
(4, 2, 2, 2),
(3, 3, 3, 3),
(10, 1, 1, 1);
