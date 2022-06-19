/* CRIANDO BANCO DE DADOS */

CREATE DATABASE AULA_SQL

CREATE DATABASE aula_sql2

use aula_sql2

CREATE TABLE teste(
	NOME VARCHAR(30)
);

/* NO SQL SERVER NAO EXECUTA TUDO DE UMA VEZ

PROCESSAMENTO ASSICRONO

ELE EXECUTA DO MENOS CUSTOSO AO MAIS CUSTUSO

ELE POSSUI UM DELIMITADOR CHAMADO GO

*/

CREATE DATABASE aula_04
GO

use aula_04
GO

CREATE TABLE teste(
	NOME VARCHAR(30)
)
GO

/* MDF e LDF

MDF - Master Data File (Dicionario de dados)

ºArmazena os dados
ºAo prencher o MDF é gerado uma transacao
ºTransacionais

LDF - Log Data File

ºArmazena logs

Ao criar um banco de dados padrao ele crias o mdf e ldf

OBS...
MDF deve ser usado apenas para dicionario de dados com isso
 criamos uma extensao chamada de .NDF
*/