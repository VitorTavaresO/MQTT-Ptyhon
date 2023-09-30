CREATE TABLE funcionarios (
	id_funcionario SERIAL NOT NULL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	salario NUMERIC NOT NULL,
	bonus NUMERIC NOT NULL
);

CREATE OR REPLACE FUNCTION atualizarBonus()
RETURNS TRIGGER AS $$
BEGIN
	IF (NEW.salario >= 1500 AND NEW.salario <= 3000) THEN
		NEW.bonus := 0.2;
	ELSIF (NEW.salario >= 3001 AND NEW.salario <= 5000) THEN
		NEW.bonus := 0.25;
	ELSIF (NEW.salario > 5000) THEN
		NEW.bonus := 0.3;
	END IF;
RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER triggerBonus
BEFORE INSERT OR UPDATE
ON funcionarios
FOR EACH ROW
EXECUTE PROCEDURE atualizarBonus();

DROP TRIGGER triggerBonus ON funcionarios;

INSERT INTO funcionarios (nome, salario)
VALUES ('Maria', 1600),
('Davi Banana', 3200),
('Regina Moinhos', 6000);

SELECT * FROM funcionarios;
