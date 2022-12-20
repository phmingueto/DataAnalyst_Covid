-- Cria view filtrando providências tomadas distintas e tranforma em tabela adionando coluna (primary key).
CREATE VIEW dim_providencia_view AS
SELECT DISTINCT B002 AS servico_saude, B0031 AS ficou_em_casa, B0032 AS ligou_profissional_saude, B0033 AS tomou_remedio_sozinho,
B0034 AS tomou_remedio_medico, B0035 AS visita_sus, B0036 AS visita_particular, B0037 AS outras FROM health_professional

SELECT *
INTO dim_providencia
FROM dim_providencia_view

ALTER TABLE dim_providencia
ADD id INT IDENTITY(1,1) PRIMARY KEY