-- Agrupa o afastamento no serviço de saúde por faturamento em dinheiro.
SELECT valor_dinheiro, COUNT(*) AS contagem_afastamento_faturamento FROM dim_remuneracao AS remu
INNER JOIN ft_afastamento AS afas
ON afas.id_controle = remu.id
WHERE afastamento_temporario = 1
GROUP BY valor_dinheiro