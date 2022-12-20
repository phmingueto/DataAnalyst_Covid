-- Tranforma view em tabela para adicionar coluna (primary key), filtrando somente profissionais da saúde com ensino superior e técnico.
SELECT *
INTO health_professional
FROM total_sample where C007C IN (26,27)
SELECT * FROM health_professional

ALTER TABLE dbo.health_professional
ADD id INT IDENTITY(1,1) PRIMARY KEY