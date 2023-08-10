SELECT nome_produto AS Produto, valor AS Preço,
	CASE
		WHEN (valor < 5.00) THEN 'Barato'
		WHEN (valor >= 5.00 AND valor <= 10.00) THEN 'Normal'
		WHEN (VALOR > 10.00) THEN 'Caro'
	END AS Classificação
FROM produtos;
