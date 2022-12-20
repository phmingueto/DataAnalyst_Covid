-- Agrupa o afastamento no serviço de saúde por sinais e sintomas apresentados.
SELECT id_sintoma, COUNT(*) AS contagem_afastamento_sintoma FROM dim_sintoma AS simt
INNER JOIN ft_afastamento AS afas
ON simt.id = afas.id_sintoma
WHERE afastamento_temporario = 1 AND motivo_afastamento = 1
GROUP BY id_sintoma