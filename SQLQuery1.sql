
--Mostrar todas os meus banco de dados
SELECT name, database_id, create_date
FROM sys.databases;
GO

USE master;

--Escolhendo o banco de dados utilizado
USE minha_empresa_db;

--Criando tabela FUNCIONARIO
CREATE TABLE FUNCIONARIO(
ident INT,  --primary key
nome varchar(20) not null,
sobrenome varchar(20) not null,
endereco varchar(100),
salario real,
dt_nasc date,
s_ident int,
D_num int, 
sexo char(1),

primary key(ident),
constraint fk_Fun_Fun foreign key(S_ident) references FUNCIONARIO(ident)
);


------------------------------------------------------------------------------
--CRIAR TABELA DE DEPENDENTE
CREATE TABLE DEPENDENTE(
F_ident INT,  --primary key
nome varchar(20) not null, --primary key
dt_nasc date,
sexo char(1),
relacionamento varchar(20)

primary key(F_ident, nome),
constraint fk_Func_Dep foreign key(F_ident) references FUNCIONARIO(ident)
);

DROP TABLE DEPENDENTE;
------------------------------------------------------------------------------

-- Adicionando valores à tabela dependente
INSERT INTO DEPENDENTE
VALUES (1161,'Fernando','1998-01-05', 'M','filho');

INSERT INTO DEPENDENTE
VALUES (1166,'Joaquim','1994-12-12', 'M','filho');

INSERT INTO DEPENDENTE
VALUES (1171,'Fernanda','1974-11-12', 'F','esposa');

INSERT INTO DEPENDENTE
VALUES (1171,'Roberto','1999-11-11', 'M','filho');

INSERT INTO DEPENDENTE
VALUES (1180,'Carlos','1997-07-31', 'M','filho');

---------------------------------------------------------------------------------


-- INSERINDO DADOS NA TABELA FUNCIONARIO
INSERT INTO FUNCIONARIO
VALUES (1161,'Fernando','Wong','Rua da Lapa, 34, São Paulo, SP', 35500, '1984-12-31', NULL,1, 'M');

INSERT INTO FUNCIONARIO
VALUES (1162,'Ronaldo','Lima','Rua Rebouças, 334, São Paulo, SP', 7300, '1962-12-08', 1161,1, 'M'),
	   (1163,'João','Silva','Rua das Flores, 751, Rio de Janeiro, RJ', 5558.00, '1965-01-09', 1161,1, 'M'),
       (1164,'Joice','Leite','Av. Rio Branco, 54, Rio de Janeiro, RJ', 6508.00, '1972-07-31', 1161,1, 'F');


	   --CRIAR TABELA DEPARTAMENTO
	  CREATE TABLE DEPARTAMENTO(
		numero int,
		nome varchar(20) not null,
		Gident int not null,
		Gdata date,
		primary key(numero),
		constraint fk_Dept_Fun foreign key(Gident) references FUNCIONARIO(ident)
		);


		-- Inserindo dados na tabela departamento
INSERT INTO departamento
VALUES (1,'Engenharia',1161,'2016-12-20'),(2,'Pesquisa',1165,'2017-11-08'),(3,'Contabilidade',1169,'2018-05-16'),
       (4,'Finanças',1173,'2011-01-11'),(5,'RH',1177,'2019-12-20');



		--ALTER TABLE FUNCIONARIO
		ALTER TABLE FUNCIONARIO
ADD constraint fk_Dept_Fun foreign key (D_num) references departamento(numero);

--criando a tabela projetos (numero, nome, localização, D_num)
CREATE TABLE PROJETO(
	numero int,
	nome varchar(30),
	localizacao varchar(50),
	D_num int,

	primary key (numero),
	constraint fk_Dept_Proj foreign key (D_num) references departamento(numero)
);


--INSERIR DADOS NA TABELA PROJETOS
INSERT INTO PROJETO
VALUES (1,'Projeto A','São Paulo',1),(2,'Projeto F','Mauá',1),
       (3,'Projeto K','Santo André',1),(4,'Projeto P','Sorocaba',1),
	   (5,'Projeto B','São Paulo',2),(6,'Projeto G','Sorocaba',2),
	   (7,'Projeto L','Diadema',2),(8,'Projeto Q','Mauá',2);


	   -- VER OS VALORES DA TABELA
		SELECT * FROM FUNCIONARIO;
		SELECT * FROM DEPARTAMENTO;
		SELECT * FROM PROJETO;
		SELECT * FROM DEPENDENTE;
		SELECT * FROM DEPTO_LOCALIZACOES;
		SELECT * FROM TRABALHA_EM;

  
		-- EXCLUIR TABELA
		DROP TABLE DEPARTAMENTO;
		DROP TABLE PROJETO;
		DROP TABLE DEPENDENTE;

		
		--ALTERAR NOME DO PROJETO
EXEC sp_rename 'PROJETOS', 'PROJETO';
GO

--INSERINDO VALORES NA TABELA

INSERT INTO projeto(numero,nome,localizacao,D_num)
VALUES (9,'Produto C','Santo André',3),(10,'Produto H','Campinas',3),(11,'Produto M','Santo André',3),(12,'Produto R','São Bernardo',3),
       (13,'Produto D','São Bernardo',4),(14,'Produto I','São Paulo',4);

	   INSERT INTO projeto(numero,nome,localizacao,D_num)
VALUES (15,'Produto N','São Bernardo',4),(16,'Produto S','Santo André',4),
       (17,'Produto E','Diadema',5),(18,'Produto J','São Paulo',5),(19,'Produto O','Santo André',5),(20,'Produto T','Mauá',5);



-- CRIANDO A TABELA  TRABALHA EM 
CREATE TABLE TRABALHA_EM(
F_ident int,
P_num int,
horas int DEFAULT 0,

primary key(F_ident, P_num),
constraint fk_Func_TrabEm foreign key (F_ident) references FUNCIONARIO (ident),
constraint fk_Proj_TrabEm foreign key (P_num) references PROJETO(numero)

);

SELECT * FROM TRABALHA_EM;


DADOS PARA TRABALHA_EM
-- Inserindo dados na tabela trabalha_em
insert into trabalha_em
values (1161,1,10),(1161,2,30),(1162,2,10),(1163,3,10),(1164,4,40),
       (1165,5,25),(1166,6,20),(1166,7,10),(1167,7,35),(1168,8,100);

insert into trabalha_em
values (1169,9,15),(1169,10,12),(1170,11,10),(1171,12,70),(1172,12,80),(1173,13,100);


--CRIAR TABELA DEPARTAMENTO LOCALIZACOES
CREATE TABLE DEPTO_LOCALIZACOES(
D_num int, 
localizacoes varchar(50),

primary key(D_num, localizacoes),
constraint fk_DeptDept_Lo foreign key(D_num) references DEPARTAMENTO(numero)
);


INSERT INTO DEPTO_LOCALIZACOES
VALUES (1,'São Paulo'),(1,'Rio de Janeiro'),(2,'Sorocaba'),(3,'Florianópolis'),(3,'Recife'),
       (4,'São Paulo'),(5,'São Paulo'),(5,'Salvador');


	   ---------------ALTERANDO ATRIBUTO DO PROJETO-------------
	   SELECT * FROM PROJETO WHERE numero = 10;
	   
	   UPDATE PROJETO
	   SET localizacao ='Santo Andre', D_num = 5
	   WHERE numero = 10;

	   -- EXERCICIOS 2 ---------------------- INCLUIR 10% NO VALOR DO SALARIO DOS SUPERVISORES
	   SELECT * FROM FUNCIONARIO;

	   --COMO SABER QL FUNCIONARIO EH SUPERVISOR
	   SELECT * FROM FUNCIONARIO WHERE S_ident is Null;

	   UPDATE FUNCIONARIO
	   SET salario = salario*1.1
	   WHERE S_ident is NULL;


	   --SELECIONAR TODOS EM TRABALHA-EM
	   	   SELECT * FROM FUNCIONARIO WHERE sobrenome = 'souza';


	   --EXEMPLO 3 - EXERCICIO 3 - ALTERAR VALOR DE UM ATRIBUTO PARA DEFAULT
	   UPDATE TRABALHA_EM
	   SET horas = DEFAULT
	   WHERE F_ident = 1163;


	   -- DELETE ---> EXCLUIR ALGUMA TUPLA EXPECIFICA DA TABELA
	   --REMOVER TODOS OS FUNCIONARIOS COM SOBRENOME SOUZA
	   DELETE
	   FROM FUNCIONARIO
	   WHERE sobrenome = 'Souza'; --nao ira conseguir excluir pq esta vinculado a outra tabela


	    SELECT * FROM FUNCIONARIO WHERE sobrenome = 'souza';


	   -- Exemplo 1: Remova todos os funcionários com ident = 1174.
DELETE
FROM FUNCIONARIO
WHERE ident = 1174;


--VER TODAS AS TABELAS DO BANCO DE DADOS
SELECT * FROM information_schema.tables;

--EXEMPLO 3 - REMOVER TODOS OS FUNCIONARIOS QUE NAO SAO GERENTES
--IRA DAR ERRO POIS ESTAO VINCULADOS A OUTRA TABELA
DELETE
FROM FUNCIONARIO
WHERE S_ident is not null;

--EXEMPLO 4 -  EXCLUIR TODAS AS TUPLAS DA TABELA FUNCIONARIO
--IRA DAR ERRO POIS ESTAO VINCULADOS A OUTRA TABELA
DELETE FROM FUNCIONARIO



-- SELECT -- FROM -- WHERE
--EXEMPLO 1 RECUPERE A DATA DE NASC E O ENDEREÇO
--FUNCIONARIOS CUJO NOME SEJA JOAO SILVA
SELECT dt_nasc, endereco
FROM FUNCIONARIO
WHERE nome = 'João 'and sobrenome = 'Silva';


--EXEMPLO 2 :  RECUPERAR O SALARIO DO GERENTE DO DEPARTAMENTO 5
SELECT salario
FROM FUNCIONARIO
WHERE D_num = 5 and S_ident is Null;


--EXEMPLO 3 - PARA CADA PROJETO LOCALIZADO EM MAUA
--LISTE O NUMERO DE PROJETO, O NUMERO DO DEPARTAMENTO
--ENDERECO E DATA DE NASCIMENTO DO GERENTE

SELECT PROJETO.numero, PROJETO.D_num, sobrenome, endereco, dt_nasc
FROM PROJETO, FUNCIONARIO
WHERE PROJETO.localizacao = 'Mauá' and PROJETO.D_num = FUNCIONARIO.D_num and S_ident is NULL;


SELECT numero FROM PROJETO WHERE localizacao ='Mauá';

--AMBIGUIDADE
--EXEMPLO 1 PARA CADA FUNCIONARIO RECUPERE O SEU NOME E SOBRENOME
--E TAMBEM AS MESMAS INFOS DO SUPERVISOR
SELECT f.nome, f.sobrenome, s.nome, s.sobrenome, s.ident
FROM FUNCIONARIO as f, FUNCIONARIO as s;

---------------------------------------------------------------------------------





-- AULA 08/02/23
-- CLAUSULA WHERE NAO ESPECIFICADA E USO DO (*)
--EXEMPLO 1 SELECIONE TODOS OS VALORES DE IDENT DE FUNCIONARIO
SELECT ident from FUNCIONARIO;

--EXEMPLO 2 SELECIONE TODOS AS COMBINACOES DE IDENT E NOME DE DEPARTAMENTO NO BD
SELECT f.ident, d.nome
FROM FUNCIONARIO as f, DEPARTAMENTO as d;


--EXEMPLO 3 RECUPERE TODOS OS VALORES DE ATRIBUTO DE QUALQUER FUNCIONARIO COM O GERENTE 1163
SELECT * FROM FUNCIONARIO WHERE s_ident = 1161;

--EX 4 RECUPERE TODOS OS ATRIBUTOS DE UM GERENTE E OS ATRIBUTOS DO DEP QUE ELE GERENCIA
SELECT * 
FROM FUNCIONARIO as f, DEPARTAMENTO as d -- APELIDOS PARA ATRIBUTOS, ENTIDADE
WHERE f.ident = d.Gident


--LIKE
--EXEMPLO 5 - RECUPERE OS FUNCIONARIO COM ENDEREÇO EM SAO PAULO
SELECT nome, sobrenome
FROM FUNCIONARIO
WHERE endereco LIKE '%São Paulo, SP%'

-- EXEMPLO 6 - RECUPERE TODOS OS FUNCIONARIOS QUE NASCERAM NA DECADA DE 60
SELECT nome, sobrenome
FROM FUNCIONARIO
WHERE dt_nasc like '%__6_______%'   --EXEMPLO --> '1965-12-13'

-- EXEMPLO 7 - QUAL O EFEITO DE DAR 10% DE AUMENTO NOS FUNCIONARIOS QUE TRABALHAM EM UM PROJETO F
SELECT f.nome, f.sobrenome, f.salario, 1.1*salario as aumento_salario
FROM FUNCIONARIO as f, TRABALHA_EM as te, PROJETO as p
WHERE f.ident = te.F_ident and te.P_num = p.numero and p.nome = 'Projeto F';

select * from projeto


--EXEMPLO 8 RECUPERE TODOS OS FUNCIONARIOS COM SALARIO ENTRE 30MIL E 40MIL
SELECT nome, sobrenome
FROM FUNCIONARIO
WHERE (salario between 40000 and 80000);


SELECT nome, sobrenome
FROM FUNCIONARIO
WHERE (salario >= 30000) and( salario >= 40000);




