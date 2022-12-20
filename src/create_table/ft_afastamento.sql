-- Cria viw ft_afastamento_view com os registros desnormalizados.
CREATE VIEW ft_afastamento_view AS
SELECT
B0011 AS febre,
B0012 AS tosse,
B0013 AS dor_garganta,
B0014 AS dificuldade_respirar,
B0015 AS dor_cabeca,
B0016 AS dor_peito,
B0017 AS nausea,
B0018 AS congestao_nasal,
B0019 AS fadiga ,
B00110 AS dor_olhos,
B00111 AS perda_olfato_paladar,
B00112 AS dor_muscular,
B002 AS servico_saude,
B0031 AS ficou_em_casa,
B0032 AS ligou_profissional_saude,
B0033 AS tomou_remedio_sozinho,
B0034 AS tomou_remedio_medico,
B0035 AS visita_sus,
B0036 AS visita_particular,
B0037 AS outras,
C01011 AS valor_dinheiro,
C01021 AS valor_produto,
C0103 AS somente_beneficios,
C0104 AS nao_remunerado,
A001B3 AS ano_nascimento,
A003 AS sexo,
A004 AS raca,
A005 AS escolaridade,
C002 AS afastamento_temporario,
C003 AS motivo_afastamento,
C005 AS tempo_afastamento,
Ano AS ano,
UF AS uf,
V1022 AS zona,
V1013 AS mes_pesquisa
FROM health_professional


-- Transforma view em tabela para conseguir adicionar a coluna id.
SELECT *
INTO ft_afastamento_temp
FROM ft_afastamento_view

ALTER TABLE dbo.ft_afastamento_temp
ADD id INT IDENTITY(1,1) PRIMARY KEY


-- Cria view ft_afastamento_final com os registros normalizados para a criação da ft_afastamento.
CREATE VIEW ft_afastamento_final AS (
SELECT
afas.id,
prof.id as id_profissional,
sint.id as id_sintoma,
prov.id as id_providencia,
remu.id as id_remuneracao,
cont.id as id_controle,
prof.id_cargo as id_cargo,
afas.motivo_afastamento,
afas.afastamento_temporario,
afas.tempo_afastamento
FROM ft_afastamento_temp as afas
INNER JOIN dim_profissional as prof
ON prof.ano_nascimento = afas.ano_nascimento
AND prof.sexo = afas.sexo
AND prof.raca = afas.raca
AND prof.escolaridade = afas.escolaridade
INNER JOIN dim_sintoma as sint
ON afas.dor_cabeca = sint.dor_cabeca
AND afas.febre = sint.febre
AND afas.tosse = sint.tosse
AND afas.dor_garganta = sint.dor_garganta
AND afas.dor_peito = sint.dor_peito
AND afas.nausea = sint.nausea
AND afas.congestao_nasal = sint.congestao_nasal
AND afas.fadiga = sint.fadiga
AND afas.dor_olhos = sint.dor_olhos
AND afas.perda_olfato_paladar = sint.perda_olfato_paladar
AND afas.dor_muscular = sint.dor_muscular
INNER JOIN dim_providencia as prov
ON prov.servico_saude = afas.servico_saude
AND prov.ficou_em_casa = afas.ficou_em_casa
AND prov.ligou_profissional_saude = afas.ligou_profissional_saude
AND prov.tomou_remedio_sozinho= afas.tomou_remedio_sozinho
AND prov.tomou_remedio_medico = afas.tomou_remedio_medico
AND prov.visita_sus = afas.visita_sus
AND prov.visita_particular = afas.visita_particular
AND prov.outras = afas.outras
INNER JOIN dim_remuneracao as remu
ON remu.valor_dinheiro = afas.valor_dinheiro
AND remu.valor_produto = afas.valor_produto
AND remu.somente_beneficios = afas.somente_beneficios
AND remu.nao_remunerado = afas.nao_remunerado
INNER JOIN dim_controle as cont
ON cont.ano = afas.ano
AND cont.uf = afas.uf
AND cont.zona = afas.zona
AND cont.mes_pesquisa = afas.mes_pesquisa)

SELECT *
INTO ft_afastamento
FROM ft_afastamento_final