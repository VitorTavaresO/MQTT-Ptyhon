CREATE OR REPLACE FUNCTION somar_numeros(num1 int, num2 int)
RETURNS int AS $$

DECLARE
	soma int := 0;
BEGIN
	FOR cont IN num1..num2 LOOP
		soma := soma + cont;
	END LOOP;
	
	RETURN soma;
END;
$$ LANGUAGE PLPGSQL;

SELECT somar_numeros(1, 5);

CREATE TABLE pessoas (
    nome_pessoas VARCHAR(255) NOT NULL,
    idade_pessoas INT
);

INSERT INTO pessoas (nome_pessoas, idade_pessoas)
VALUES
    ('John', 30),
    ('Alice', 25),
    ('Bob', 35),
    ('Eva', 28),
    ('Michael', 40);

CREATE OR REPLACE FUNCTION listar_pessoas_por_idade(idade int)
RETURNS TABLE(nome varchar, idade_pes int)AS $$
BEGIN
	RETURN QUERY SELECT nome_pessoas, idade_pessoas
	FROM pessoas
	WHERE idade_pessoas > idade;
END;
$$ LANGUAGE PLPGSQL;

SELECT nome, idade_pes FROM listar_pessoas_por_idade(30);
