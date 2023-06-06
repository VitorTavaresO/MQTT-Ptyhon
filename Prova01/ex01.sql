SELECT estado.nome, cidade.nome FROM estado
LEFT JOIN cidade ON cidade.estado_id = estado.id_estado
