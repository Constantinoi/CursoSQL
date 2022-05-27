/* ----------- Comandos Basico -----------*/

/*Criar Banco*/ 
CREATE DATABASE PROJETO;
/*Conectar Banco*/ 
USE PROJETO;
/*Criar Tabela*/ 
CREATE TABLE CLIENTE(
				Nome VARCHAR(30),
				Sexo CHAR(1),
				Cpf VARCHAR(30)
				);
/*Verificar Tableas*/ 
SHOW TABLES;
/*Estrutura das Tabelas*/ 
DESC CLIENTE;

/* PROCESSOS DE MODELAGEM  */

/* FASE 01 E FASE 02 - AD ADM DE DADOS */

MODELAGEM CONCEITUAL - RASCUNHO
MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM

/* FASE 03 - DBA / AD */

MODELAGEM FÍSICA - SCRIPTS DE BANCO

/* INICIANDO A MODELAGEM FÍSICA */

/* CRIANDO O BANCO DE DADOS */

CREATE DATABASE EXEMPLO

CREATE DATABASE PROJETO;

/* CONECTANDO-SE AO BANCO */

USE PROJETO;

/* CRIANDO A TABELA DE CLIENTES */

CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)

);

/* VERIFICANDO AS TABELAS DO BANCO */

SHOW TABLES;

USE EXEMPLO;
SHOW TABLES;

USE PROJETO;

/* DESCOBRINDO COMO É A ESTRUTURA DE UMA TABELA */

DESC CLIENTE;

-----

/*Tipos de dados */
/*
Todos os banos de dados possuem tipos que devem ser atribuidos aos dados de uma tabela.
Para caracteres literais, temos char e varchar, para números temos int e float, para
objetos como fotos e documentos, temos o blob, para textos extensos, temos o text. 
A disciplina de banco de dados é tão fantástica que ao entendermos o porque das coisas,
podemos iniciar já em modo avançado e um bom exemplo disso são os tipos. Há uma profissão
dentro da área que é a do analista de performance ou tuning, esse profissional é responsável
por analisar o banco de dados e deixá-lo mais rápido. Parece algo avançado, e é! Porém,
com alguas atitudes simples, podemos deixar o banco sem a necessidade de atuação desse profissional.

Cada caracter no banco de dados, vale 1 byte. Sendo assim, se eu entro com o dado JOÃO,
estou entrando com 4 bytes no meu banco. E o que isso tem a ver com a tiagem de tabelas?

O banco de dados funciona como um download de dados da internet. Se baixamos um arquivo de 1 giga,
temos um temo maior que o download de 50 megas, considerando a mesma velocidade de conexão.

Ao tiparmos uma tabela de modo errado ou displicente, vamos aumentar a quantidade de dados que 
será baixada do banco de dados, prolongando assim o tempo de resposta.

Uma comparacao bem didatica é o tipo char e varchar
A palavra var, vem de variant, em ingles, ou seja, que é dinâmica. Logo, vimos que 1 caracter
é igual a 1 byte. Vejamos então a tipagem

varchar(10)
char(10)

entrando a palavra joao

total de bytes varchar(10) = 4 bytes
toal de bytes cahr(10) = 10 bytes

isso ocorre pois o char não varia. Os caracteres restantes serao preenchidos com espaço. 
eles nao ficam vazios. Enquanto que no varchar, o tipo varia conforme o dado.
Entao utilizo sempre o varchar? Não. O charé ligeiramente mais performatico, por nao
ter que gastar tempo variando de tamanho. Entao a regra é utilizar sempre o char quando
sabemos que o numero de caracteres naquela coluna nao vai variar nunca. Por exemplo,
unidade federativa, com dois digitos, sexo com um digito e assim por diante. Vista a diferença
que podemos fazer com uma tipagem correta de tabelas, na próxima aula detalharemos os tipos do mysql
e nos modulos específicos de cada banco, você entenderá os tipos correspondentes no sql server
e no oracle, que mudam muito pouco. */

/*  Inserindo dados e valores nulos */

use projeto;

/* Mostrando as tabelas */
show tables

/* exibindo a estrutura de uma tabela */
desc cliente;

/* sintaxe basica de inserção - INSERT INTO TABELA... */

/* FORMA 01 - OMITINDO AS COLUNAS */

INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

/* FORMA 02 - COLOCANDO AS COLUNAS */

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');
						  
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',99999999999);

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',22222222222);
						  
/* O COMANDO SELECT 
selecao projecao e juncao
*/

SELECT NOW() as DATA_HORA, 'FELIPE MAFRA' AS PROFESSOR;

SELECT 'FELIPE MAFRA';

SELECT 'BANCO DE DADOS';

/* ALIAS DE COLUNAS */


SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;

SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE;

SELECT   EMAIL, SEXO, ENDERECO, NOME FROM CLIENTE;

SELECT   EMAIL, SEXO, ENDERECO, NOME, NOW() AS DATA_HORA FROM CLIENTE;

/* APENAS PARA FINS ACADEMICOS */

SELECT * FROM CLIENTE;

/*TABELA ERRADA - NAO DIGITE DIRETAMENTE NO BANCO */
CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30)
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100),

);

SELECT * FROM CLIENTE;


/* FILTRANDO DADOS COM WHERE E LIKE */

SELECT NOME, TELEFONE FROM CLIENTE;

/* FILTRANDO */

SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO = 'M';

SELECT NOME, ENDERECO FROM CLIENTE
WHERE SEXO = 'F';

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO = 'RJ';

/* UTILIZANDO O LIKE */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE 'RJ';

/* CARACTER CORINGA % -> QUALQUER COISA */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE 'OSCAR CURY%';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE '%CENTRO%';


/* ----------- Uso Tabela Verdade -----------*/
 
/* OPERADORES LÓGICOS 
OR -> PARA QUE A SAIDA DA QUERY SEJA VERDADEIRA, BASTA QUE APENAS UMA CONDICAO SEJA VERDADEIRA.
AND -> PARA QUE A SAIDA SEJA VERDADEIRA TODAS AS CONDICOES PRECISAM SER VERDADEIRAS.
*/
 
/*FUNCOES DE AGREGACAO*/
 
 SELECT COUNT(*) AS "Quantidade de Registros" FROM CLIENTE;
 
 SELECT COUNT(*) FROM CLIENTE;

 /* OPERADOR GROUP BY */
 
 SELECT SEXO, COUNT(*) FROM CLIENTE GROUP BY SEXO;
 /* agrupa o sexo e conta a quantidade que possui de cada tipo - SOMA E AGRUPA*/
 
 /*
Dicas de Analise PRIMEIRO de um COUNT na tabela
*/

SELECT (*) FROM FUNCIONARIOS;

--usando GROUP BY PARA VERIFICAR A QUANTIDADE DE ITENS PARA VERIFICAR A PERFORMACE

/* Filtrando Valores Nulos*/

IS NULL
IS NOT NULL

/*UPDATE */

--conselho o melhor amigo da vida inteira e o WHERE

--DICA SEMPRE FAÇA UM SELECT ANTES DE FAZER UPDATE
SELECT NOME , EMAIL 
FROM CLIENTE 
WHERE NOME = "JOAO"
---copie e onte seu UPDATE
UPDATE CLIENTE 
SET EMAIL = "joao@joao.com"
WHERE NOME = "JOAO"

/*DELETE so com WHERE*/

DELETE FROM CLIENTE;

---DICA
---faça um COUNT total --6 registro
SELECT (*)COUNT FROM CLIENTE;
--e um COUNT por item --1 registro
SELECT (*)COUNT FROM CLIENTE
WHERE NOME = 'ANA'; 

DELETE FROM CLIENTE;
WHERE NOME = 'ANA'; 
---apos deletar faça um count e subtraia o 1º com o 2º;
SELECT (*)COUNT FROM CLIENTE; --5 registros

SELECT 6 - 1;