/*SELECAO, PROJECAO E JUNCAO*/

--PROJECAO -> TUDO QUE VOCE QUER VER NA TELA ;

SELECT NOW() AS DATA_ATUAL;

SELECT 2+2 AS SOMA;

SELECT 2+2 AS SOMA, NOME , NOW()
FROM CLIENTE;

--SELECAO -> É UM SUBCONJUNTO DO REGISTRO TOTAL DE UMA TABELA
--A CLAUSULA DE SELECAO E O WHERE

/*BD E A TEORIA DOS CONJUNTOS*/

SELECT NOME,SEXO,EMAIL --PROJECAO
FROM CLIENTE -- ORIGEM
WHERE SEXO = 'F' -- SELECAO

/*JUNCAO -> JOIN*/
--JOIN DE 2  TABELAS
SELECT NOME, SEXO, BAIRRO, CIDADE --PROJECAO
FROM CLIENTE -- ORIGEM
	INNER JOIN ENDERECO -- JUNCAO
	ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F' --SELECAO

SELECT NOME,SEXO,EMAIL,TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE

--JOIN DE 3 TABELAS

SELECT C.NOME,C.SEXO, E.CIDADE, T.TIPO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE


/*
DML - DATA MANIPULATION LANGUAGEM
DDL - DATA DEFINITION LANGUAGE
DCL - DATA CONTROL LANGUAGE
TCL - TRANSACTION CONTROL LANGUAGE
*/

/*COMANDOS DML
*/

--INSERT

INSERT INTO CLIENTE VALUES(NULL,'PAULA','M',NULL,'12348944');

--SELECT
SELECT * FROM CLIENTE;

--UPDATE
--1º--SELECT 
SELECT * FROM CLIENTE;
WHERE IDCLIENTE = 7;
--2º--UPDATE
UPDATE CLIENTE 
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

--DELETE
SELECT * FROM CLIENTE;
WHERE IDCLIENTE = 7;
--2º--UPDATE
DELETE FROM CLIENTE 
WHERE IDCLIENTE = 7;


/*COMANDOS DDL*/

--NOME -> VARCHAR
--DEFININDO O DADO

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT (10,2) NOT NULL
);

---ALTER TABLE

/* ALTERANDO NOME DE UMA TABELA*/
/*CHANGE*/
ALTER TABLE PRODUTO 
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;

ALTER TABLE PRODUTO 
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;

/*MODIFY*/
--ALTERANDO O TIPO
ALTER TABLE PRODUTO 
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

/*ADICIONANDO COLUNA*/

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */

ALTER TABLE PRODUTO 
ADD COLUMN FLOAT (10,2) NOT NULL
AFTER NOME_PRODUTO

/*PRIMEIRA*/
ALTER TABLE PRODUTO 
ADD COLUMN FLOAT (10,2) NOT NULL
FIRST;
