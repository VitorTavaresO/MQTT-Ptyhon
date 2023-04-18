-- Dadas as tabelas "usuarios" com os atributos "id" (int), "nome" (varchar) e "email" (varchar) e "pedidos" com os atributos "id" (int), "id_usuario" (int), "data_pedido" (date) e "valor" (decimal), escreva uma consulta SQL para retornar o nome do usuário que realizou o primeiro pedido e a data deste pedido. Dica: use a cláusula “LIMIT”.

SELECT usuarios.nome, data_pedido

FROM usuarios, pedidos

WHERE usuarios.id = pedidos.id_usuario

ORDER BY pedidos.data_pedido ASC

LIMIT 1;