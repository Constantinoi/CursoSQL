/* FORMAS NORMAIS*/

/*
PRIMEIRA FORMA NORMAL

	ATOMICIDADE - UM CAMPO NAO PODE SER DIVISIVEL.
	UM CAMPO NAO PODE SER VETORIZADO.
	PK - DEVE TER UMA CHAVE PRIMARIA.


SEGUNDA  FORMA NORMAL
	
	QUALQUER CAMPO NAO CHAVE DEVE DEPENDER DA TOTALIDADE DA CHAVE;
	
TERCEIRA  FORMA NORMAL
	
	DEPENDENCIA TRANSITIVA 
	CAMPOS NAO CHAVE QUE DEPENDEM DE OUTROS CAMPOS NAO CHAVE 
	VIRAM OUTRA TABELA
*/

CREATE DATABASE CONSULTORIO;

USE CONSULTORIO;

CREATE TABLE PACIENTE (
	IDPACIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR (30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	NASCIMENTO DATE
);

CREATE TABLE MEDICO(
	IDMEDICO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	ESPECIALIDADE VARCHAR(30),
	FUNCIONARIO ENUM('S','N')
);

CREATE TABLE HOSPITAL(
	IDHOSPITAL INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	BAIRRO VARCHAR(30),
	CIDADE VARCHAR(30),
	ESTADO CHAR(2)
);

CREATE TABLE CONSULTA(
	IDCONSULTA INT PRIMARY KEY AUTO_INCREMENT,
	ID_PACIENTE INT,
	ID_MEDICO INT,
	ID_HOSPITAL INT,
	DATA DATETIME,
	DIAGNOSTICO VARCHAR(50)
);
---- UMA CONSULTA SO GERA UMA INTERNACAO POR ISSO ID_CONSULTA FICOU UNIQUE
CREATE TABLE INTERNACAO(
	IDINTERNACAO INT PRIMARY KEY AUTO_INCREMENT,
	ENTRADA DATETIME,
	QUARTO INT,
	SAIDA DATETIME,
	OBSERVACOES VARCHAR(50),
	ID_CONSULTA INT UNIQUE
);
/* CRIANDO AS CONSTRAINT*/
ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_PACIENTE
FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(IDPACIENTE);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_MEDICO
FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(IDMEDICO);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_HOSPITAL
FOREIGN KEY (ID_HOSPITAL) REFERENCES HOSPITAL(IDHOSPITAL);

ALTER TABLE INTERNACAO ADD CONSTRAINT FK_CONSULTA_INTERNACAO
FOREIGN KEY (ID_CONSULTA) REFERENCES CONSULTA(IDCONSULTA);