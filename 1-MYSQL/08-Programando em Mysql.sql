/*DELIMITER - todo comando precisa de ponto e virgula para ser executado*/
/* - todo comando precisa de ponto e virgula para ser executado*/
; -- ponto e virgula e o delimiter padrao

STATUS --verificar as configuracoes
/* mudar o delimiter */

DELIMITER $

--cuidado com os espaços ao modificar o delimiter
--ele deve ter apenas um caracter

/* INICIANDO STORED PROCEDURES*/

DELIMITER $
--SINTAXE PROCEDURE SEM PARAMETRO

CREATE PROCEDURE NOME()
BEGIN 
	QUALQUER PROGRAMACAO;
END
$
--CRIANDO PROCEDURE
CREATE PROCEDURE NOME_EMPRESA()
BEGIN
	SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;
END
$

--CHAMANDO PROCEDURE

DELIMITER ;

CALL NOME_EMPRESA();

---PROCEDURE COM PARAMENTROS

DELIMITER $

CREATE PROCEDURE CONTA()
BEGIN
	SELECT 10 + 10 AS CONTA;
END
$

CALL CONTA();

DROP PROCEDURE CONTA;

--SE TRAVAR O DELIMITER REINICIE O BANCO

DELIMITER $

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN
	SELECT NUMERO1 + NUMERO2 AS CONTA;
END
$

CALL CONTA(100,50)$

-----PROCEDURES COMPLETAS-----

CREATE DATABASE PROJETO;

USE PROJETO;

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);

INSERT INTO CURSOS VALUES(NULL,'JAVA',30,500.00);
INSERT INTO CURSOS VALUES(NULL,'FUNDAMENTOS DE BANCOS DE DADOS',40,700.00);

SELECT * FROM CURSOS;

DELIMITER #

CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30),
							P_HORAS INT(30),
							P_PRECO FLOAT (10,2))
BEGIN
	INSERT INTO CURSOS VALUES(NULL,P_NOME,P_HORAS,P_PRECO);
END
#

DELIMITER ;

CALL CAD_CURSO('BI SQL SERVICE',40,3007.00);
CALL CAD_CURSO('JAVASCRIPT',25,200.00);
CALL CAD_CURSO('TABLEAU',20,242.00);

SELECT * FROM CURSOS;

--1 - EXERCICIO CRIAR UM PROCEDURE PARA CONSULTAR CURSOS

DELIMITER #

CREATE PROCEDURE CONSULTA_CURSOS()
BEGIN
	
	SELECT * FROM CURSOS ORDER BY NOME;

END
#

CALL CONSULTA_CURSOS#
