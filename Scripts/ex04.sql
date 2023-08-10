ALTER TABLE vendas
ADD COLUMN desconto FLOAT;

DO $$
DECLARE
	quantidade int := 11;
	valor_total float;
	descontoVenda int;
	produto int := 9;
	
BEGIN
	valor_total := (quantidade * (SELECT valor FROM produtos WHERE id_produto = produto));
	IF (quantidade > 5 AND quantidade < 10) THEN
		valor_total := valor_total * 0.9;
		descontoVenda := 10;
	ELSIF (quantidade >= 10) THEN
		valor_total := valor_total * 0.8;
		descontoVenda := 20;
	
	ELSE 
		descontoVenda := 0;
	END IF;
	
	INSERT INTO vendas (quantidade_produtos, valor_total, produto_id, desconto) VALUES
	(quantidade, valor_total, produto, descontoVenda);

END $$;

SELECT * FROM vendas;
