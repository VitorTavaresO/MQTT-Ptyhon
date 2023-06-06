SELECT fornecedor.nome, estado.nome,
(
SELECT produto.nome FROM produto
WHERE venda.produto_id = produto.id_produto
) AS produto_nome
FROM venda
INNER JOIN produto ON venda.produto_id = produto.id_produto
INNER JOIN fornecedor ON produto.fornecedor_id = fornecedor.id_fornecedor
INNER JOIN cidade ON fornecedor.cidade_id = cidade.id_cidade
INNER JOIN estado ON cidade.estado_id = estado.id_estado
WHERE (produto.valor_unitario * venda.quantidade) > 30;
