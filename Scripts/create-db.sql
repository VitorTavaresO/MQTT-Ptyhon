create table produtos (
	id_produto serial not null primary key,
	nome_produto varchar(255) not null,
	valor decimal(6, 2) not null
);

create table vendas (
	id_venda serial not null primary key,
	quantidade_produtos int not null,
	valor_total decimal(7,2) not null,
	produto_id int not null references produtos(id_produto)
);

insert into produtos (nome_produto, valor)
values ('caderno', 25.00),
	('lapis', 1.00),
	('borracha', 0.5),
	('estojo', 10.00),
	('caneta', 5.00),
	('marca-texto', 6.00),
	('lapis de cor', 12.00),
	('post-it', 5.00),
	('giz de cera', 10.00);
