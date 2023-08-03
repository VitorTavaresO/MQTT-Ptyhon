DO $$
DECLARE
	produto int := 1;
	quantidade int := 2;
	valor decimal;
	valor_total decimal;
	produto_id int;
BEGIN
	valor := (SELECT produtos.valor FROM produtos WHERE id_produto = produto);
	valor_total := quantidade * valor;
	INSERT INTO vendas (quantidade_produtos, valor_total, produto_id)
	VALUES (quantidade, valor_total, produto);

END $$;
