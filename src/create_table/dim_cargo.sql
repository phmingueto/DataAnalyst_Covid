-- Cria view filtrando por cargos distintos e tranforma em tabela adicionando coluna (primary key).
CREATE VIEW dim_cargo_view AS
SELECT DISTINCT C007C AS categoria, C007B AS registro, C007 AS setor, C008 AS carga_horaria_normal, C009 AS carga_horaria_fato, C013 AS remoto FROM health_professional

SELECT *
INTO dim_cargo
FROM dim_cargo_view

ALTER TABLE dim_cargo
ADD id INT IDENTITY(1,1) PRIMARY KEY