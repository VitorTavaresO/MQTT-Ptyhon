-- Considere as tabelas "Pessoas" e "Enderecos". A tabela "Pessoas" possui os seguintes atributos: id, nome, idade e id_endereco. A tabela "Enderecos" possui os seguintes atributos: id, rua, numero e cidade. Qual comando SQL exibirá o nome, idade e rua das pessoas que possuem endereço na cidade de São Paulo, ordenados por idade de forma decrescente?

SELECT Pessoas.nome, Pessoas.idade, Enderecos.rua

FROM Pessoas, Enderecos

WHERE Pessoas.id_endereco = Enderecos.id

AND Enderecos.cidade = 'São Paulo'

ORDER BY Pessoas.idade DESC;