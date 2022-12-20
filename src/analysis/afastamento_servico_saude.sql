-- Consulta o afastamento total no serviço de saúde
SELECT afastamento_temporario, COUNT(*) AS contagem_afastamento FROM ft_afastamento
GROUP BY afastamento_temporario