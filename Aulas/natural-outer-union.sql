SELECT Pessoa.nome, Cep.id_cep, Pessoa.cep_id, Cep.localidade
FROM Cep LEFT JOIN Pessoa
ON cep_id = id_cep;

SELECT Mensagem.id_msg, Mensagem.descricao_msg
FROM Mensagem
WHERE id_msg <= 50
UNION
SELECT Cep.id_cep, Cep.localidade
FROM Cep
WHERE Cep.localidade LIKE '%ar%'
ORDER BY descricao_msg;