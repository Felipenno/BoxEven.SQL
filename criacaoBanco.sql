CREATE DATABASE BD_BOXEVEN;

USE BD_BOXEVEN;

CREATE TABLE TB_USUARIO(
    ID_USUARIO UNIQUEIDENTIFIER PRIMARY KEY,
    APELIDO VARCHAR(10) UNIQUE NOT NULL,
    NOME_COMPLETO VARCHAR(40) NOT NULL,
    EMAIL VARCHAR(30) UNIQUE NOT NULL,
    SENHA VARCHAR(200) NOT NULL
);

CREATE TABLE TB_UNIDADE_MEDIDA(
    ID_UNIDADE_MEDIDA INT IDENTITY PRIMARY KEY,
    DESCRICAO VARCHAR(20) UNIQUE NOT NULL,
);

CREATE TABLE TB_PRODUTO(
    ID_PRODUTO INT IDENTITY(100, 5) PRIMARY KEY,
    FK_IDUNIDADE_MEDIDA INT NOT NULL,
    ATIVO BIT NOT NULL,
    QUANTIDADE INT NOT NULL,
    PRECO DECIMAL(10,2) NOT NULL,
    NOME VARCHAR(40) UNIQUE NOT NULL,
    IMAGEM_TIPO VARCHAR(22),
    IMAGEM_NOME VARCHAR(40),
    CODIGO_BARRAS VARCHAR(100),
    DATA_CRIACAO DATETIME NOT NULL,
    DATA_ATUALIZACAO DATETIME NOT NULL,
    FOREIGN KEY(FK_IDUNIDADE_MEDIDA) REFERENCES TB_UNIDADE_MEDIDA(ID_UNIDADE_MEDIDA),
);

CREATE TABLE TB_LOCALIZACAO(
    ID_LOCALIZACAO INT IDENTITY PRIMARY KEY,
    FK_IDPRODUTO INT,
    ANDAR VARCHAR(3) NOT NULL,
    CORREDOR INT NOT NULL,
    LADO CHAR(1) NOT NULL,
    PRATELEIRA INT NOT NULL,
    VAO INT NOT NULL,
    FOREIGN KEY(FK_IDPRODUTO) REFERENCES TB_PRODUTO(ID_PRODUTO),
);

CREATE TABLE TB_MOVIMENTACAO(
    ID_MOVIMENTACAO INT IDENTITY PRIMARY KEY,
    FK_IDPRODUTO INT NOT NULL,
    FK_IDUSUARIO UNIQUEIDENTIFIER NOT NULL,
    TIPO VARCHAR(8) NOT NULL,
    QUANTIDADE INT NOT NULL,
    JUSTIFICATIVA TEXT NOT NULL,
    DATA_OPERACAO DATETIME NOT NULL
    FOREIGN KEY(FK_IDPRODUTO) REFERENCES TB_PRODUTO(ID_PRODUTO),
    FOREIGN KEY(FK_IDUSUARIO) REFERENCES TB_USUARIO(ID_USUARIO),
);

--DROP DATABASE BD_BOXEVEN;
--DROP TABLE TB_MOVIMENTACAO;
--DROP TABLE TB_USUARIO;
--DROP TABLE TB_LOCALIZACAO;
--DROP TABLE TB_PRODUTO;
--DROP TABLE TB_UNIDADE_MEDIDA;

--ALTER TABLE TB_PRODUTO ALTER COLUMN PRECO DECIMAL(10,2) NOT NULL;
--ALTER TABLE TB_LOCALIZACAO ADD CONSTRAINT FK_LOCALIZACAO_PRODUTO FOREIGN KEY(FK_IDPRODUTO) REFERENCES TB_PRODUTO(ID_PRODUTO);
--ALTER TABLE TB_PRODUTO ADD CONSTRAINT FK_PRODUTO_MEDIDA FOREIGN KEY(FK_IDUNIDADE_MEDIDA) REFERENCES TB_UNIDADE_MEDIDA(ID_UNIDADE_MEDIDA);
--ALTER TABLE TB_MOVIMENTACAO ADD CONSTRAINT FK_MOVIMENTACAO_PRODUTO FOREIGN KEY(FK_IDPRODUTO) REFERENCES TB_PRODUTO(ID_PRODUTO);
--ALTER TABLE TB_MOVIMENTACAO ADD CONSTRAINT FK_MOVIMENTACAO_USUARIO FOREIGN KEY(FK_IDUSUARIO_ATUAL) REFERENCES TB_USUARIO(ID_USUARIO);