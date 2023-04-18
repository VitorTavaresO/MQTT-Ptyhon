-- Dado o esquema abaixo, escreva uma consulta que retorne a quantidade total de vendas para cada produto em ordem decrescente de quantidade:

-- Produto (id, nome, preço)

-- Venda (id, produto_id, quantidade, data)

SELECT Produto.nome, SUM(Venda.quantidade) AS total_vendas

FROM Produto, Venda

WHERE Produto.id = Venda.produto_id

GROUP BY Produto.nome

ORDER BY total_vendas DESC;