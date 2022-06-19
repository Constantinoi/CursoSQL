USE EMPRESA
GO

CREATE TABLE TB_EMPRESA(
	ID INT,
	NOME VARCHAR(50)	
)
GO

CREATE TABLE ALUNO(
	IDALUNO INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(30) NOT NULL,
	SEXO CHAR(1) NOT NULL,
	NASCIMENTO DATE NOT NULL,
	EMAIL VARCHAR(30) UNIQUE
)
GO

/* NAO CRIE CONSTRAINTS POR DENTRO DA TABELA POIS ELE NOMEIA
ALEATORIO*/

/* CONSTRAINTS*/

ALTER TABLE ALUNO
ADD CONSTRAINT CK_SEXO CHECK (SEXO IN ('M','F'))
GO

/* 1 - 1*/

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY IDENTITY(100,10),
	BAIRRO VARCHAR(30),
	UF CHAR(2) NOT NULL
	CHECK (UF IN('RJ','SP','MG')),
	ID_ALUNO INT UNIQUE
)
GO

/*CRIANDO A FK*/

ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_ALUNO
FOREIGN KEY(ID_ALUNO) REFERENCES ALUNO(IDALUNO)
GO

/* COMANDO DE DESCRICAO

 PROCEDURES JA CRIADAS E ARMAZENAS NO SISTEMA
 
*/

--MOSTRA DETALHES

SP_COLUMNS ALUNO
GO

--MOSTRA MAIS DETALHES
SP_HELP ALUNO 
GO

/* INSERINDO DADOS*/
INSERT INTO ALUNO VALUES('ANDRE','M','1994/12/22','ANDERE@A.COM')
INSERT INTO ALUNO VALUES('ANDRE2','M','1993/03/22','ANDERE2@A.COM')
INSERT INTO ALUNO VALUES('ANDRE3','M','1992/02/22','ANDERE3@A.COM')
INSERT INTO ALUNO VALUES('ANDRE4','M','1991/01/22','ANDERE4@A.COM')
GO

/*ENDERECO*/

INSERT INTO ENDERECO VALUES('FLAMENGO','RJ',1)
INSERT INTO ENDERECO VALUES('CENTRO','MG',2)
INSERT INTO ENDERECO VALUES('MORUMBI','SP',3)
INSERT INTO ENDERECO VALUES('CENTRO','SP',4)
GO

/*CRIANDO A TABELA TELEFONES  1 - N */

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY IDENTITY,
	TIPO CHAR(3) NOT NULL, 
	NUMERO VARCHAR(10) NOT NULL,
	ID_ALUNO INT,
	CHECK (TIPO IN ('RES','COM','CEL'))
)
GO

INSERT INTO TELEFONE VALUES('CEL','7899889',1)
INSERT INTO TELEFONE VALUES('RES','4325444',1)
INSERT INTO TELEFONE VALUES('COM','4354354',2)
INSERT INTO TELEFONE VALUES('CEL','2344556',2)
GO


SELECT * FROM ALUNO
GO

SELECT * FROM TELEFONE
GO

/* PEGAR DATA ATUAL*/

SELECT GETDATE()
GO

/* CLAUSULA AMBIGUA - QUANDO TEM UM JOIN E COLUNAS MESMO NOME*/

SELECT A.NOME , T.TIPO , T.NUMERO , E.BAIRRO, E.UF
FROM ALUNO A
INNER JOIN TELEFONE T
ON A.IDALUNO = T.ID_ALUNO
INNER JOIN ENDERECO E
ON A.IDALUNO = E.ID_ALUNO
GO

/* TRAZER ALUNO QUE NAO TEM TELEFONE*/

SELECT A.NOME , T.TIPO , T.NUMERO , E.BAIRRO, E.UF
FROM ALUNO A
LEFT JOIN TELEFONE T
ON A.IDALUNO = T.ID_ALUNO
INNER JOIN ENDERECO E
ON A.IDALUNO = E.ID_ALUNO
GO

/* CORRIGINDO ONDE ESTA NULL*/

SELECT 
A.NOME , 
ISNULL(T.TIPO , 'SEM') AS TIPO,
ISNULL(T.NUMERO , 'NUMERO') AS TELEFONE,
E.BAIRRO, 
E.UF
FROM ALUNO A
LEFT JOIN TELEFONE T
ON A.IDALUNO = T.ID_ALUNO
INNER JOIN ENDERECO E
ON A.IDALUNO = E.ID_ALUNO
GO
