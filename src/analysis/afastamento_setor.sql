-- Agrupa o afastamento no serviço de saúde por setores.
SELECT setor, COUNT(*) AS contagem_afastamento_setor FROM dim_cargo AS carg
INNER JOIN dim_profissional AS prof
ON prof.id_cargo = prof.id_cargo
INNER JOIN ft_afastamento AS afas
ON afas.id_profissional = prof.id_cargo
WHERE afastamento_temporario = 1
GROUP BY setor