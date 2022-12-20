-- Agrupa os motivos de afastamento no serviço de saúde.
SELECT motivo_afastamento, COUNT(*) AS contagem_afastamento_motivo FROM ft_afastamento
GROUP BY motivo_afastamento