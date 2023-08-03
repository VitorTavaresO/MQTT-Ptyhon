-- Identificar a média e quantos produtos estão acima dela
DO $$
DECLARE
	media decimal;
	quantidade int;
BEGIN 
	media := (SELECT AVG(produtos.valor) FROM produtos);
	quantidade := (SELECT COUNT(*) FROM produtos WHERE valor > media);
	raise notice 'Quantidade de produtos acima da média é %', quantidade;

END $$;
