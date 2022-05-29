/* Modelagem 
DEVEMOS MODELAR NOSSO BANCO VOLTADO A DADOS, 
E NAO A REGRAS DE NEGOCIO;*/
/*
PRIMEIRA FORMA NORMAL

1 - Todo campo vetorizado(mesma familia) se tornara outra tabela

[amarelo,azul,laranja,verde] - vetor cores
[ka, fiesta, uno , civic] - vetor carros

2- Todo campo multivalorado se tornara outra tabela.
quando o campo for divisivel

COLUNA - ENDERECO
LINHA - RUA FULANO DE TAL , 123, BAIRRO TAL, CIDADE TAL , UF TAL

3 - TODA TABLE NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE TODO O 
REGISTRO COMO SENDO UNICO.
ISSO E O QUE CHAMAMOS DE CHAVE PRIMARIA OU PRIMARY KEY.


*/

/*CARDINALIDADE E OBRIGATORIEDADE

quem define tua cardinalidade e tua regra de negocio

1-OBRIGATORIEDADE ( 0 = falso/nao obrigatorio e 1 = verdadeiro/obrigatorio)(minimo que vai acontecer)

2- CARDINALIDADE (maximo que vai acontecer)

(0,n)
(0,1)
(1,n)
(1,1)
 EX: 
 Endereco - obrigatorio o cadastro de um endereco
 R= (1,1)
 Telefone - o cliente nao e obrigado a informar telefone
 porem, caso queira, ele pode informar mais de um.
 
r= (0,n)


*OBS: a leitura e de acordo com o segundo numero de cada par*
*/

CREATE DATABASE COMERCIO;
 
USE COMERCIO;

SHOW DATABES;

/*CHAVE PRIMARIA E O IDENTIFICADOR DA TABELA*/

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,--SO TEM NO MYSQL
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(11) UNIQUE
);

SHOW TABLES;

CREATE TABLE ENDERRECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES','COM','CEL') NOT NULL,--SO TEM NO MYSQL
	NUMERO VARCHAR(10) NOT NULL
);

/* CHAVE ESTRANGEIRA*/