-- Cria view e tranfroma em table para adicionar coluna (primary key)
CREATE VIEW dim_controle_view AS
SELECT DISTINCT Ano AS ano, UF AS uf, V1022 AS zona, V1013 AS mes_pesquisa FROM health_professional

SELECT *
INTO dim_controle
FROM dim_controle_view

ALTER TABLE dbo.dim_controle
ADD id INT IDENTITY(1,1) PRIMARY KEY