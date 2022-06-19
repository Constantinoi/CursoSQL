/* O cliente Tera Comércio de Produtos S.A, solicitou a modelagem de um banco de dados para cadastro dos seus clientes.
A função da Unidados é a análise dos requisitos junto aos usuários para a correta construção do produto. O cliente deseja 
que inicialmente os scripts sejam construídos para o Banco de Dados MySQL, porém, posteriormente pode haver mudança no 
ambiente e consequentemente adaptação dos scripts para outros produtos de SGBD.
O cliente não quer nenhuma informação relativa à vendas ou estoque, desejando somente as informações primárias de Clientes.
*/

/*  nosso cliente solicitou uma tabela para armazenar os livros que são comercializados pela empresa. 
A solicitação é somente para livros e não há a necessidade de realizar busca em outras tabelas. 
Hoje há um funcionário de vendas que tem uma tabela do Excel para guardar esses registros, 
mas as buscas estão ficando complexas. Decidiu-se então criar um banco de dados separado para esse funcionário.
Após a criação da tabela, deveremos entregar algumas queries prontas para que sejam enviadas para o programador. As queries são as seguintes:
1 – Trazer todos os dados.
2 – Trazer o nome do livro e o nome da editora
3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.
4 - Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino.
5 – Trazer os valores dos livros das editoras de São Paulo.
6 – Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio).
*/

CREATE DATABASE Livraria;

CREATE TABLE Livros(
	ID BIGINT,
	Nome_Livro VARCHAR(30),
	Nome_Autor VARCHAR(50),
	Sexo_Autor VARCHAR(10),
	Numero_Paginas INT,
	Nome_Editora VARCHAR(50),
	Valor_Livro FLOAT(10,2),
	UF_EDITORA CHAR(2),
	Ano_Publicacao INT
);

INSERT INTO Livros VALUES(1,'Cavaleiro Real','Ana Claudia','Feminino',465,'Atlas',49.9,'RJ',2009);
INSERT INTO Livros VALUES(2,'SQL para leigos','João Nunes','Masculino',450,'Addison',98,'SP',2018);
INSERT INTO Livros VALUES(3,'Pessoas efetivas','Eduardo Santos','Masculino',390,'Beta',78.99,'RJ',2018);
INSERT INTO Livros VALUES(4,'Habitos Saudaveis','Eduardo Santos','Masculino',630,'Beta',150.98,'RJ',2019);


1- SELECT * FROM Livros;
2- SELECT Nome_Livro , Nome_Editora FROM Livros;
3- SELECT Nome_Livro, UF_EDITORA FROM Livros WHERE Sexo_Autor = 'Masculino';
4- SELECT Nome_Livro, Numero_Paginas FROM Livros WHERE Sexo_Autor = 'Feminino';
5- SELECT Valor_Livro FROM Livros WHERE UF_EDITORA = 'SP';
6- SELECT * FROM Livros WHERE Sexo_Autor = 'Masculino'
	AND UF_EDITORA = 'SP' OR UF_EDITORA = 'RJ';