-- Considere as tabelas "alunos" e "notas" com os atributos "id_aluno", "nome_aluno", "idade_aluno" e "id_nota", "id_aluno", "nota". Escreva um comando SQL para selecionar o nome do aluno e a média de suas notas, apenas para aqueles que têm média maior que 7.

SELECT alunos.nome_aluno, AVG(notas.nota) AS media_notas

FROM alunos, notas

WHERE alunos.id_aluno = notas.id_aluno

GROUP BY alunos.nome_aluno

HAVING AVG(notas.nota) > 7;