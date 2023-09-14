-- LOOP
DO $$
DECLARE
	cont int := 0;
	num int := 3;
BEGIN
	LOOP
		IF (cont > 10) THEN
		EXIT;
		END IF;
		RAISE NOTICE '% * % = %', num, cont, (num * cont);
		cont := cont + 1;
	END LOOP;
END $$

-- WHILE LOOP
DO $$
DECLARE
	cont int := 0;
	num int := 3;
BEGIN
	WHILE (cont <= 10) LOOP
		RAISE NOTICE '% * % = %', num, cont, (num * cont);
		cont := cont + 1;
	END LOOP;
END $$

-- FOR LOOP
DO $$
DECLARE
	num int := 3;
BEGIN
	FOR cont IN 0..10 LOOP
		RAISE NOTICE '% * % = %', num, cont, (num * cont);
	END LOOP;
END $$

DO $$
DECLARE
	num int := 3;
BEGIN
	FOR cont IN REVERSE 10..0 LOOP
		RAISE NOTICE '% * % = %', num, cont, (num * cont);
	END LOOP;
END $$

DO $$
DECLARE
	num int := 3;
BEGIN
	FOR cont IN 0..10 BY 2 LOOP
		RAISE NOTICE '% * % = %', num, cont, (num * cont);
	END LOOP;
END $$
