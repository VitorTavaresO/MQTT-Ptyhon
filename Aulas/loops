DO $$
DECLARE
	cont int := 0;
	num int := 3;
BEGIN
	LOOP
		IF (cont > 10) THEN
		exit;
		END IF;
		RAISE NOTICE '% * % = %', num, cont, (num * cont);
		cont := cont + 1;
		END LOOP;
END $$
