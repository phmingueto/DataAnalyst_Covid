-- Cria view filtrando sinais sintomas distintos e tranforma em tabela adicionando coluna (primary key).
CREATE VIEW dim_sintoma_view AS
SELECT DISTINCT B0011 AS febre, B0012 AS tosse, B0013 AS dor_garganta, B0014 AS dificuldade_respirar, B0015 AS dor_cabeca, B0016 AS dor_peito, B0017 AS nausea,
B0018 AS congestao_nasal, B0019 AS fadiga , B00110 AS dor_olhos, B00111 AS perda_olfato_paladar, B00112 AS dor_muscular FROM health_professional

SELECT *
INTO dim_sintoma
FROM dim_sintoma_view

ALTER TABLE dbo.dim_sintoma
ADD id INT IDENTITY(1,1) PRIMARY KEY