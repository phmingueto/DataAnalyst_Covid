-- Cria viw dim_profissional com os registros desnormalizados.
CREATE VIEW dim_profissional_view AS
SELECT
C007C AS categoria,
C007B AS registro,
C007 AS setor,
C008 AS carga_horaria_normal,
C009 AS carga_horaria_fato,
C013 AS remoto,
A001B3 AS ano_nascimento,
A003 AS sexo,
A004 AS raca,
A005 AS escolaridade
FROM health_professional


-- Transforma view em tabela para conseguir adicionar a coluna id.
SELECT *
INTO dim_profissional_temp
FROM dim_profissional_view

ALTER TABLE dim_profissional_temp
ADD id INT IDENTITY(1,1) PRIMARY KEY


-- Cria view dim_profissional_final com os registros normalizados para a criação da dim_profissional.
CREATE VIEW dim_prof_final as
SELECT
prof.id,
carg.id as id_cargo,
prof.ano_nascimento,
prof.sexo,
prof.raca,
prof.escolaridade
FROM dim_profissional_temp as prof
INNER JOIN dim_cargo as carg
ON
prof.categoria = carg.categoria
AND prof.registro = carg.registro
AND prof.setor = carg.setor
AND prof.carga_horaria_normal = carg.carga_horaria_normal
AND prof.carga_horaria_fato = carg.carga_horaria_fato
AND prof.remoto = carg.remoto

SELECT *
INTO dim_profissional
FROM dim_prof_final