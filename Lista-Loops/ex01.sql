--01-> Inserir do 1 ao 10 em uma tabela
CREATE TABLE numeros(
	num INTEGER NOT NULL
);
--IF loop
DO $$
DECLARE
	cont int := 1;
BEGIN
	LOOP
	IF(cont > 10) THEN
		exit;
	END IF;
	INSERT INTO numeros(num) VALUES (cont);
	cont := cont + 1;
	END LOOP;
END $$

DO $$
DECLARE
	cont int := 1;
BEGIN
	WHILE (cont <= 10) LOOP
	INSERT INTO numeros(num) VALUES (cont);
	cont := cont + 1;
	END LOOP;
END $$

DO $$
DECLARE
BEGIN
	FOR cont IN 1..10 LOOP
	INSERT INTO numeros(num) VALUES (cont);
	END LOOP;
END $$

DROP TABLE numeros;
SELECT * FROM numeros;
