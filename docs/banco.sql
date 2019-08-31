
CREATE GENERATOR FORNECEDORES_FOR_CODIGO_GEN;
SET GENERATOR FORNECEDORES_FOR_CODIGO_GEN TO 1;

CREATE GENERATOR PATRIMONIO_COD_PAT_GEN;
SET GENERATOR PATRIMONIO_COD_PAT_GEN TO 0;

CREATE GENERATOR SETORES_COD_SETOR_GEN;
SET GENERATOR SETORES_COD_SETOR_GEN TO 0;



/******************************************************************************/
/****                                Tables                                ****/
/******************************************************************************/



CREATE TABLE CAB_RELATORIOS (
    COD                 SMALLINT NOT NULL,
    ORGAO               VARCHAR(40),
    UNIDADE             VARCHAR(40),
    UNIDADE_ADMIN       VARCHAR(40),
    CPF                 VARCHAR(11),
    RESPON_UNIDADE      VARCHAR(40),
    CAB_RODAPERG        BLOB SUB_TYPE 0 SEGMENT SIZE 80,
    TEXTOTRANSFERENCIA  BLOB SUB_TYPE 0 SEGMENT SIZE 80
);

CREATE TABLE CADUSER (
    REGE  VARCHAR(1)
);

-- CREATE TABLE CATEGORIAS ( 
--     ID_CATEGORIA   INTEGER NOT NULL,
--     CAT_DESCRICAO  VARCHAR(80),
--     CAT_DEPRECIA   DOUBLE PRECISION,
--     CAT_VIDA       SMALLINT
-- );

CREATE TABLE FORNECEDORES (
    FOR_CODIGO    INTEGER NOT NULL,
    FOR_CNPJ      VARCHAR(14),
    FOR_NOME      VARCHAR(50),
    FOR_ENDERECO  VARCHAR(50),
    FOR_BAIRRO    VARCHAR(50),
    FOR_CIDADE    VARCHAR(50),
    UF            VARCHAR(2),
    CEP           VARCHAR(8),
    TELEFONE      VARCHAR(12),
    TELEFONE_2    VARCHAR(12),
    CELULAR       VARCHAR(12),
    EMAIL         VARCHAR(50),
    SITE          VARCHAR(60),
    FOR_OBS       BLOB SUB_TYPE 0 SEGMENT SIZE 80,
    FOR_CADASTRO  TIMESTAMP
);

CREATE TABLE INVENTARIO (
    CODINVENTARIO       DOUBLE PRECISION NOT NULL,
    DATAIVENTARIO       TIMESTAMP,
    DECRICAOINVENTARIO  VARCHAR(80),
    COD                 SMALLINT
);

CREATE TABLE INVENTARIOITENS (
    CODINVENTARIO         DOUBLE PRECISION NOT NULL,
    PATRIMONIOTOMBAMENTO  DOUBLE PRECISION NOT NULL,
    ESTADOCONSERVACAO     VARCHAR(1),
    BAIXA                 VARCHAR(1),
    LOCALIZADO            VARCHAR(1),
    CODIVENTANTERIOR      DOUBLE PRECISION,
    DATAIVENTANTERIOR     TIMESTAMP,
    DATA                  TIMESTAMP,
    BAIXAANTERIOR         VARCHAR(1),
    LOCALIZADOANTERIOR    VARCHAR(1),
    CODSUBSETOR           INTEGER,
    CODSETOR              INTEGER
);

CREATE TABLE IVENTARIOCOMISSAO (
    CODIGO            DOUBLE PRECISION NOT NULL,
    NOMEINVETARIANTE  VARCHAR(80),
    FUNCAO            VARCHAR(40),
    CODINVENTARIO     DOUBLE PRECISION NOT NULL
);

CREATE TABLE MOTIVOSTRANSFERENCIA (
    CODIGOMOTIVO  SMALLINT NOT NULL,
    MOTIVO        VARCHAR(40)
);

-- CREATE TABLE PATRIMONIO (
--     COD_PAT               DOUBLE PRECISION NOT NULL,
--     PATRIOMONIO           VARCHAR(10),
--     TIPO                  VARCHAR(9),
--     PLACA_SERIE           VARCHAR(26),
--     MARCA                 VARCHAR(30),
--     MATERIAL              VARCHAR(250),
--     DEST                  VARCHAR(8),
--     EST_CON               VARCHAR(1),
--     QUANT                 INTEGER,
--     VALOR                 DOUBLE PRECISION,
--     SETOR                 INTEGER,
--     BAIXA                 VARCHAR(1),
--     STATUS                VARCHAR(1),
--     DATA_BAIXA            TIMESTAMP,
--     DOCUMENTO_BAIXA       VARCHAR(16),
--     TRANS_PARA            VARCHAR(40),
--     TRNAS_BAIXA_EMP       VARCHAR(1),
--     OBS                   BLOB SUB_TYPE 0 SEGMENT SIZE 80,
--     CONFERIDO             VARCHAR(1),
--     MODIFICADO_POR        VARCHAR(35),
--     DATA_MODIFICAO        TIMESTAMP,
--     COD                   SMALLINT,
--     FOR_CODIGO            INTEGER,
--     NOTA_FISCAL           VARCHAR(20),
--     DATA_COMPTA           TIMESTAMP,
--     PREGAO                VARCHAR(30),
--     SOLICITA_INCLUSAO     VARCHAR(1),
--     PAT_SUBSETORCOD       INTEGER,
--     ID_CATEGORIA          INTEGER,
--     CONVENIO              VARCHAR(20),
--     PATRIMONIOTOMBAMENTO  DOUBLE PRECISION,
--     PATCODIGOBARRA        VARCHAR(10),
--     DATAIMPLANTACAO       TIMESTAMP,
--     FIMGARANTIA           TIMESTAMP,
--     CODIGO                VARCHAR(4),
--     ULTIMOINVENTARIO      DOUBLE PRECISION,
--     DATAIVENTARIO         TIMESTAMP,
--     LOCALIZACAO           VARCHAR(10)
-- );

CREATE TABLE RESP (
    MASP_RESP      VARCHAR(20) NOT NULL,
    NOME_RESP      VARCHAR(40),
    TELEFONE_RESP  VARCHAR(12),
    DATA_PUBLIC    TIMESTAMP,
    DATA_NOMEACAO  TIMESTAMP,
    ENDERECO       VARCHAR(35),
    NUMERO_END     VARCHAR(6),
    CPF            VARCHAR(11)
);

CREATE TABLE RESP_SUBSETORES (
    MASP_RESP      VARCHAR(20) NOT NULL,
    NOME_RESP      VARCHAR(40),
    TELEFONE_RESP  VARCHAR(12),
    DATA_PUBLIC    TIMESTAMP,
    DATA_NOMEACAO  TIMESTAMP,
    ENDERECO       VARCHAR(35),
    NUMERO_END     VARCHAR(6),
    CPF            VARCHAR(11)
);

CREATE TABLE SETORES (
    COD_SETOR    INTEGER NOT NULL,
    NOME_SETOR   VARCHAR(35),
    COD_RESP     VARCHAR(20),
    COD_UNIDADE  SMALLINT,
    RESPONSAVEL  VARCHAR(40),
    NOMEUNIDADE  VARCHAR(40)
);

CREATE TABLE SUBSETORES (
    SUBS_CODIGO    INTEGER NOT NULL,
    SUBS_SETOR     INTEGER,
    SUBS_NOME      VARCHAR(45),
    RESP_SUBSETOR  VARCHAR(20),
    RESPONSAVEL    VARCHAR(40)
);

CREATE TABLE TRANSFERENCIA (
    NUMEROTRANSFERENCIA  DOUBLE PRECISION NOT NULL,
    SETORTRANSFERE       INTEGER,
    SETORRECEBE          INTEGER,
    SUBS_RECEBE          INTEGER,
    DATA                 TIMESTAMP,
    CODIGOMOTIVO         SMALLINT,
    COD_UNIDADE_RECEBE   SMALLINT,
    MASP_RESP            VARCHAR(20),
    COD_UNIDADE_TRANSF   SMALLINT
);

CREATE TABLE TRANSITEMS (
    NUMEROTRANSFERENCIA  DOUBLE PRECISION NOT NULL,
    COD_PAT              DOUBLE PRECISION NOT NULL,
    SUBSETORCOD          INTEGER
);

CREATE TABLE USER_AGENDA (
    SEQUENCIA      INTEGER NOT NULL,
    USUARIO        VARCHAR(20),
    NOME           VARCHAR(50),
    TELEFONE       VARCHAR(50),
    COMPLEMENTO    BLOB SUB_TYPE 0 SEGMENT SIZE 80,
    COMPARTILHADO  SMALLINT
);

CREATE TABLE USER_BARRA_F (
    OPCAO      INTEGER NOT NULL,
    GRUPO      VARCHAR(4) NOT NULL,
    PORSENHA   VARCHAR(1),
    INVISIVEL  VARCHAR(1)
);

CREATE TABLE USER_GRUPOS (
    GRUPO      VARCHAR(4) NOT NULL,
    DESCRICAO  VARCHAR(20)
);

CREATE TABLE USER_LOG (
    USUARIO  VARCHAR(20),
    DATA     TIMESTAMP,
    HORA     VARCHAR(8),
    TABELA   VARCHAR(80),
    TIPO     VARCHAR(30),
    COMANDO  BLOB SUB_TYPE 0 SEGMENT SIZE 80,
    ESTACAO  VARCHAR(40)
);

CREATE TABLE USER_MENU_LATERAL (
    OPCAO     INTEGER NOT NULL,
    GRUPO     VARCHAR(4) NOT NULL,
    PORSENHA  VARCHAR(1)
);

CREATE TABLE USER_MENU_SUPERIOR (
    OPCAO      INTEGER NOT NULL,
    GRUPO      VARCHAR(4) NOT NULL,
    PORSENHA   VARCHAR(1),
    INVISIVEL  VARCHAR(1)
);

CREATE TABLE USER_NOMES (
    USUARIO  VARCHAR(20) NOT NULL,
    SENHA    VARCHAR(20),
    MASTER   VARCHAR(1),
    GRUPO    VARCHAR(4)
);

CREATE TABLE USER_TABELAS (
    TABELA_OBJ  VARCHAR(40) NOT NULL,
    GRUPO       VARCHAR(4) NOT NULL,
    CERCEADO    VARCHAR(20)
);



/******************************************************************************/
/****                             Primary keys                             ****/
/******************************************************************************/

ALTER TABLE CAB_RELATORIOS ADD CONSTRAINT ICAB_RELATORIOS PRIMARY KEY (COD);
ALTER TABLE CATEGORIAS ADD CONSTRAINT ICATEGORIAS PRIMARY KEY (ID_CATEGORIA);
ALTER TABLE FORNECEDORES ADD CONSTRAINT IFORNECEDORES PRIMARY KEY (FOR_CODIGO);
ALTER TABLE INVENTARIO ADD CONSTRAINT IINVENTARIO PRIMARY KEY (CODINVENTARIO);
ALTER TABLE INVENTARIOITENS ADD CONSTRAINT IINVENTARIOITENS PRIMARY KEY (CODINVENTARIO, PATRIMONIOTOMBAMENTO);
ALTER TABLE IVENTARIOCOMISSAO ADD CONSTRAINT IIVENTARIOCOMISSAO PRIMARY KEY (CODIGO, CODINVENTARIO);
ALTER TABLE MOTIVOSTRANSFERENCIA ADD CONSTRAINT IMOTIVOSTRANSFERENCIA PRIMARY KEY (CODIGOMOTIVO);
ALTER TABLE PATRIMONIO ADD CONSTRAINT IPATRIMONIO PRIMARY KEY (COD_PAT);
ALTER TABLE RESP ADD CONSTRAINT IRESP PRIMARY KEY (MASP_RESP);
ALTER TABLE RESP_SUBSETORES ADD CONSTRAINT IRESP_SUBSETORES PRIMARY KEY (MASP_RESP);
ALTER TABLE SETORES ADD CONSTRAINT ISETORES PRIMARY KEY (COD_SETOR);
ALTER TABLE SUBSETORES ADD CONSTRAINT ISUBSETORES PRIMARY KEY (SUBS_CODIGO);
ALTER TABLE TRANSFERENCIA ADD CONSTRAINT ITRANSFERENCIA PRIMARY KEY (NUMEROTRANSFERENCIA);
ALTER TABLE TRANSITEMS ADD CONSTRAINT ITRANSITEMS PRIMARY KEY (NUMEROTRANSFERENCIA, COD_PAT);
ALTER TABLE USER_AGENDA ADD CONSTRAINT IUSER_AGENDA PRIMARY KEY (SEQUENCIA);
ALTER TABLE USER_BARRA_F ADD CONSTRAINT IUSER_BARRA_F PRIMARY KEY (OPCAO, GRUPO);
ALTER TABLE USER_GRUPOS ADD CONSTRAINT IUSER_GRUPOS PRIMARY KEY (GRUPO);
ALTER TABLE USER_MENU_LATERAL ADD CONSTRAINT IUSER_MENU_LATERAL PRIMARY KEY (OPCAO, GRUPO);
ALTER TABLE USER_MENU_SUPERIOR ADD CONSTRAINT IUSER_MENU_SUPERIOR PRIMARY KEY (OPCAO, GRUPO);
ALTER TABLE USER_NOMES ADD CONSTRAINT IUSER_NOMES PRIMARY KEY (USUARIO);
ALTER TABLE USER_TABELAS ADD CONSTRAINT IUSER_TABELAS PRIMARY KEY (TABELA_OBJ, GRUPO);


/******************************************************************************/
/****                               Indices                                ****/
/******************************************************************************/

CREATE INDEX IINVENTARIO0 ON INVENTARIO (CODINVENTARIO);
CREATE INDEX IINVENTARIOITENS0 ON INVENTARIOITENS (CODINVENTARIO, PATRIMONIOTOMBAMENTO);
CREATE INDEX IIVENTARIOCOMISSAO0 ON IVENTARIOCOMISSAO (CODIGO, CODINVENTARIO);
CREATE INDEX IMOTIVOSTRANSFERENCIA0 ON MOTIVOSTRANSFERENCIA (CODIGOMOTIVO);
CREATE INDEX ITRANSFERENCIA0 ON TRANSFERENCIA (NUMEROTRANSFERENCIA);
CREATE INDEX ITRANSITEMS0 ON TRANSITEMS (NUMEROTRANSFERENCIA, COD_PAT);
