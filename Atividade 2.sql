/*Atividade 

1-Traga os Funcionarios que trabalhem no departamento de filmes ou no departamento de roupas;

2-O gestor pediu a lista das funcionarias que trabalhem no departamento de filmes ou 
no departamento lar. Ele necessita enviar um email para as colaboradoras desses dois setores;

3-Traga os funcionarios do sexo masculino ou os funcionarios que trabalhem no setor Jardim;


*/
-----------1
SELECT * FROM  funcionarios WHERE 
departamento = 'Filmes' OR departamento = 'Roupas' ;
-----------2
SELECT email FROM funcionarios WHERE
sexo = 'Feminino'
AND
departamento = 'Filmes'
OR 
departamento = 'Lar';
-----

SELECT * FROM  funcionarios WHERE 
departamento = 'Jardim' 
or
sexo = 'Masculino';

--CORRECAO de acordo com Performace

-------2 ficou assim pois departamento tem menos itens do que sexo
SELECT email FROM funcionarios WHERE
(departamento = 'Filmes' AND sexo = 'Feminino')
OR
(departamento = 'Lar' AND sexo = 'Feminino');

----3 ficou assim pois existem mais itens do sexo masculino do que itens departamento jardim
--com isso tem mais chance de dá verdadeiro na primeira condicao;
SELECT * FROM  funcionarios WHERE 
sexo = 'Masculino'
or
departamento = 'Jardim';



