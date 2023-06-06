SELECT cliente.nome AS nome, cidade.nome AS cidade FROM cliente
INNER JOIN cidade ON cliente.cidade_id = cidade.id_cidade
UNION
SELECT vendedor.nome, cidade.nome FROM vendedor
INNER JOIN cidade ON vendedor.cidade_id = cidade.id_cidade
ORDER BY cidade;
