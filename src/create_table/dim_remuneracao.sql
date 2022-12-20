-- Cria view filtrando remunerações distintas e tranforma em tabela adicionando coluna (primary key).
CREATE VIEW dim_remuneracao_view AS
SELECT DISTINCT C01011 AS valor_dinheiro, C01021 AS valor_produto, C0103 AS somente_beneficios, C0104 AS nao_remunerado FROM health_professional

SELECT *
INTO dim_remuneracao
FROM dim_remuneracao_view

ALTER TABLE dim_remuneracao
ADD id INT IDENTITY(1,1) PRIMARY KEY