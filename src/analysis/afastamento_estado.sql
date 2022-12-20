-- Agrupa o afastamento no serviço de saúde por estados.
SELECT uf, COUNT(*) AS contagem_afastamento_uf FROM dim_controle AS cont
INNER JOIN ft_afastamento AS afas
ON afas.id_controle = cont.id
WHERE afastamento_temporario = 1
GROUP BY uf