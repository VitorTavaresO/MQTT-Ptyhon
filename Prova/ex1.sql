--Dado o seguinte esquema:

--Cliente (id INT, nome VARCHAR(50), idade INT)

--Pedido (id INT, data DATE, valor DECIMAL(10,2), cliente_id INT)

--Escreva uma consulta que liste os nomes e idades dos clientes que fizeram pedidos entre os dias 1 e 15 do mês atual, ordenados pelo nome em ordem crescente e pela idade em ordem decrescente.

SELECT nome, idade

FROM Cliente, Pedido

WHERE Pedido.cliente_id = Cliente.id

AND data BETWEEN '2023-04-01' AND '2023-04-15'

ORDER BY nome ASC, idade DESC;