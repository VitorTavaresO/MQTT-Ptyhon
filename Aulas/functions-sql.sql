--Crie um select que retorne na sua consulta o nome dos clientes e a quantidade de caracteres em cada nome.
SELECT cliente.nome, CHAR_LENGTH(cliente.nome) FROM cliente;

--Crie um select que retorne o nome e o valor_unitario de cada produto reduzindo em uma casa decimal, saindo de 2 para apenas 1.
SELECT produto.nome, TRUNC(produto.valor_unitario, 1) FROM produto;

-- Crie um select que retorne o nome do fornecedor e seu telefone, porém o telefone deve estar em formato numérico e não em varchar.
SELECT fornecedor.nome, TO_NUMBER(fornecedor.telefone, '999999999') FROM fornecedor;
