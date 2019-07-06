-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-05-10 16:51:46.879

-- tables
-- Table: dim_aluno
CREATE TABLE dim_aluno (
    sk_dim_aluno int  NOT NULL,
    cod_aluno int  NOT NULL,
    cod_aluno_coordenacao_regional int  NULL,
    coordenacao_regional varchar(100)  NULL,
    cod_escola int  NULL,
    escola varchar(100)  NULL,
    cod_curso int  NULL,
    curso varchar(100)  NULL,
    cod_serie int  NULL,
    serie varchar(100)  NULL,
    cod_turno int  NULL,
    turno varchar(100)  NULL,
    cod_turma int  NULL,
    turma varchar(100)  NULL,
    data_nascimento int  NULL,
    CONSTRAINT dim_aluno_pk PRIMARY KEY (sk_dim_aluno)
);

-- Table: dim_data
CREATE TABLE dim_data (
    sk_dim_data int  NOT NULL,
    data date  NOT NULL,
    dias_desde int  NULL,
    ano int  NULL,
    mes int  NULL,
    dia_do_ano int  NULL,
    dia_do_mes int  NULL,
    dia_da_semana int  NULL,
    semana_do_ano int  NULL,
    CONSTRAINT dim_data_pk PRIMARY KEY (sk_dim_data)
);

-- Table: dim_disciplina
CREATE TABLE dim_disciplina (
    sk_dim_disciplina int  NOT NULL,
    sk_dim_professor int  NOT NULL,
    cod_aluno int  NOT NULL,
    cod_disciplina int  NOT NULL,
    bimestre int  NULL,
    disciplina varchar(100)  NULL,
    CONSTRAINT dim_disciplina_pk PRIMARY KEY (sk_dim_disciplina)
);

-- Table: dim_instituicao_ensino
CREATE TABLE dim_instituicao_ensino (
    sk_dim_instituicao_ensino int  NOT NULL,
    cod_escola int  NOT NULL,
    cod_coordenacao_regional int  NOT NULL,
    coordenacao_regional varchar(100)  NULL,
    escola varchar(100)  NULL,
    tipo_escola varchar(100)  NULL,
    cod_bloco_predio int  NULL,
    bloco_predio varchar(100)  NULL,
    cod_ambiente_fisico int  NULL,
    ambiente_fisico varchar(100)  NULL,
    tipo_ambiente varchar(100)  NULL,
    funcao_origem varchar(100)  NULL,
    funcao_utilizacao varchar(100)  NULL,
    ambiente_fisico_descricao varchar(100)  NULL,
    ambiente_fisico_area_m2 decimal(5,5)  NULL,
    CONSTRAINT dim_instituicao_ensino_pk PRIMARY KEY (sk_dim_instituicao_ensino)
);

-- Table: dim_professor
CREATE TABLE dim_professor (
    sk_dim_professor int  NOT NULL,
    matricula int  NOT NULL,
    lotacao varchar(100)  NULL,
    nome varchar(100)  NULL,
    cargo varchar(100)  NULL,
    turno varchar(100)  NULL,
    exercicio varchar(100)  NULL,
    cod_exercicio int  NULL,
    carga_horaria int  NULL,
    regional varchar(100)  NULL,
    co_ua int  NULL,
    unidade int  NOT NULL,
    co_unidade int  NOT NULL,
    funcao varchar(100)  NULL,
    atuacao_principal_sigrh varchar(100)  NULL,
    atuacao_secundaria_sigrh varchar(100)  NULL,
    atuacao_principal_sigep varchar(100)  NULL,
    atuacao_secundaria_sigep varchar(100)  NULL,
    pcd varchar(100)  NULL,
    readaptacao_restricao varchar(100)  NULL,
    reducao_ch varchar(100)  NULL,
    CONSTRAINT dim_professor_pk PRIMARY KEY (sk_dim_professor)
);

-- Table: fato_distorcao_serie_idade
CREATE TABLE fato_distorcao_serie_idade (
    pk_fato_distorcao_serie_idade int  NOT NULL,
    sk_dim_aluno int  NOT NULL,
    sk_dim_disciplina int  NOT NULL,
    sk_dim_data int  NOT NULL,
    sk_dim_instituicao_ensino int  NOT NULL,
    mt_aluno_idade_31_marco_2017 int  NULL,
    mt_serie_idade_inicial_2017 int  NULL,
    mt_serie_idade_final_2017 int  NULL,
    CONSTRAINT fato_distorcao_serie_idade_pk PRIMARY KEY (pk_fato_distorcao_serie_idade)
);

-- foreign keys
-- Reference: dim_disciplina_dim_professor (table: dim_disciplina)
ALTER TABLE dim_disciplina ADD CONSTRAINT dim_disciplina_dim_professor
    FOREIGN KEY (sk_dim_professor)
    REFERENCES dim_professor (sk_dim_professor)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fato_desempenho_escolar_dim_aluno (table: fato_distorcao_serie_idade)
ALTER TABLE fato_distorcao_serie_idade ADD CONSTRAINT fato_desempenho_escolar_dim_aluno
    FOREIGN KEY (sk_dim_aluno)
    REFERENCES dim_aluno (sk_dim_aluno)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fato_desempenho_escolar_dim_data (table: fato_distorcao_serie_idade)
ALTER TABLE fato_distorcao_serie_idade ADD CONSTRAINT fato_desempenho_escolar_dim_data
    FOREIGN KEY (sk_dim_data)
    REFERENCES dim_data (sk_dim_data)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fato_desempenho_escolar_dim_disciplina (table: fato_distorcao_serie_idade)
ALTER TABLE fato_distorcao_serie_idade ADD CONSTRAINT fato_desempenho_escolar_dim_disciplina
    FOREIGN KEY (sk_dim_disciplina)
    REFERENCES dim_disciplina (sk_dim_disciplina)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fato_desempenho_escolar_dim_instituicao_ensino (table: fato_distorcao_serie_idade)
ALTER TABLE fato_distorcao_serie_idade ADD CONSTRAINT fato_desempenho_escolar_dim_instituicao_ensino
    FOREIGN KEY (sk_dim_instituicao_ensino)
    REFERENCES dim_instituicao_ensino (sk_dim_instituicao_ensino)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

