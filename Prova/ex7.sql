-- Considere as seguintes tabelas:

-- Tabela "alunos"
-- id	nome	curso
-- 1	João	Direito
-- 2	Maria	Medicina
-- 3	Pedro	Engenharia
-- 4	Juliana	Direito
-- Tabela "matriculas"
-- id	aluno_id	nota	status
-- 1	1	8.5	aprovado
-- 2	2	7.0	reprovado
-- 3	1	9.0	aprovado
-- 4	4	6.5	reprovado
-- 5	2	6.0	reprovado
-- 6	3	7.5	aprovado
-- 7	3 	8.0 	aprovado 
-- Qual é a query SQL que retorna a média de notas dos alunos aprovados em cada curso, ordenando de forma decrescente pela média das notas?

SELECT alunos.curso, AVG(matriculas.nota) AS media_notas

FROM alunos, matriculas

WHERE alunos.id = matriculas.aluno_id

AND matriculas.status = 'aprovado'

GROUP BY alunos.curso

ORDER BY media_notas DESC;