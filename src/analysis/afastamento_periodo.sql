-- Agrupa o período de afastamento no serviço de saúde.
SELECT tempo_afastamento, COUNT(*) AS contagem_afastamento_tempo FROM ft_afastamento
GROUP BY tempo_afastamento