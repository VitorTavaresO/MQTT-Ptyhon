--Considere as tabelas "clientes" e "vendas" com os seguintes atributos: clientes (id_cliente, nome, endereco, cidade, estado, cep) e vendas (id_venda, data_venda, id_cliente, id_produto, quantidade). Escreva um comando SQL para selecionar o nome do cliente, a data da venda e o nome do produto vendido, ordenados pela data em ordem crescente.

SELECT clientes.nome, vendas.data_venda, produtos.nome

FROM clientes, vendas, produtos

WHERE clientes.id_cliente = vendas.id_cliente

AND vendas.id_produto = produto.id_produto

ORDER BY vendas.data_venda ASC;