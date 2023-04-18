-- Dadas as tabelas "produtos" com os atributos "id" (int), "nome" (varchar) e "preco" (decimal) e "pedidos" com os atributos "id" (int), "id_produto" (int), "data_pedido" (date) e "quantidade" (int), escreva uma consulta SQL para retornar o nome do produto mais vendido e a quantidade total vendida deste produto. Dica: use a cláusula “LIMIT”.

SELECT produtos.nome, SUM(pedidos.quantidade) AS total_vendas

FROM produtos, pedidos

WHERE produto.id = pedidos.id_produto

GROUP BY produtos.nome

ORDER BY total_vendas DESC

LIMIT 1;

