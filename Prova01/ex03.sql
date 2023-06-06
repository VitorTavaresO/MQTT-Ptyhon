SELECT cliente.nome, cliente.email,
(SELECT venda.quantidade FROM venda
WHERE venda.cliente_id = cliente.id_cliente) AS quantidade
FROM cliente
INNER JOIN venda ON venda.cliente_id = cliente.id_cliente;
