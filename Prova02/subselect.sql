-- EX1 - Selecione o nome dos produtos que foram vendidos em quantidades maiores que a média de todas as vendas.
SELECT produtos.nome_produto FROM produtos, vendas
WHERE produtos.id_produto = vendas.produto_id
AND quantidade_produtos > (SELECT AVG(quantidade_produtos) FROM vendas);

-- EX2 - Liste o nome e o valor dos produtos que nunca foram vendidos.

SELECT produtos.nome_produto, produtos.valor FROM produtos
WHERE produtos.id_produto NOT IN(SELECT vendas.produto_id FROM vendas);

-- EX3 - Para cada produto, obtenha o nome, valor e a quantidade total vendida.

SELECT produtos.nome_produto, produtos.valor,(
SELECT vendas.quantidade_produtos)
FROM produtos INNER JOIN vendas
ON produtos.id_produto = vendas.produto_id;

-- EX4 - Encontre o valor médio dos produtos que foram vendidos mais de 3 vezes.
SELECT AVG(p.valor) AS valor_medio
FROM produtos p
WHERE p.id_produto IN (
    SELECT v.produto_id
    FROM vendas v
    GROUP BY v.produto_id
    HAVING COUNT(v.produto_id) > 3
);


