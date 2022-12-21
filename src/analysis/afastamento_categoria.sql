-- Agrupa o afastamento no serviço de saúde por nível superior e técnico.
SELECT categoria, COUNT (*) AS contagem_afastamento_categoria FROM dim_cargo AS carg
INNER JOIN dim_profissional AS prof
ON prof.id_cargo = carg.id
INNER JOIN ft_afastamento AS afas
ON afas.id_profissional = prof.id
WHERE afastamento_temporario = 1
GROUP BY categoria