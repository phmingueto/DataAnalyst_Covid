-- Agrupa o afastamento no serviço de saúde por carga horária semanal normalmente trabalhada.
SELECT carga_horaria_normal, COUNT(*) AS contagem_afastamento_hora FROM dim_cargo AS carg
INNER JOIN dim_profissional AS prof
ON prof.id_cargo = prof.id_cargo
INNER JOIN ft_afastamento AS afas
ON afas.id_profissional = prof.id_cargo
WHERE afastamento_temporario = 1
GROUP BY carga_horaria_normal