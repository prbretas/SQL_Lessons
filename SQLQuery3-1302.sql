--Criando um banco de dados
create database exemplo_aula_130223;

--usando BD
use exemplo_aula_130223;


--Criando tabela nomes
create table nomes(
id int,
nome varchar(10),
UF char(2),
primary key(id)
);

--Criando uma sequencia
create sequence nomes_seq
start with 0
increment by 1;


-- Inserindo valores na tabela nomes
insert into nomes
values (next value for nomes_seq,'João','SP'),(next value for nomes_seq,'Pedro','SP'),(next value for nomes_seq,'Maria','SP'),
       (next value for nomes_seq,'Paula','SP'),(next value for nomes_seq,'Paula','SP'),(next value for nomes_seq,'João','BA'),
	   (next value for nomes_seq,'Pedro','BA'),(next value for nomes_seq,'Maria','BA'),(next value for nomes_seq,'Paula','BA'),
	   (next value for nomes_seq,'João','SP'),(next value for nomes_seq,'Paula', 'SP');

--SELECIONAR TABELA
select * from nomes;

--SELECIONAR OS ESTADOS DISTINTOS
SELECT DISTINCT
UF
FROM nomes;

--SELECIONAR OS NOMES DISTINTOS
SELECT DISTINCT
nome
FROM nomes;


--SELECIONAR OS NOMES  E ESTADOS DISTINTOS
SELECT DISTINCT
nome, uf
FROM nomes;



-- Criando a tabela idade_a
create table idade_a(
	id int,
	nome varchar(10),
	idade int,
	primary key(id)
);

INSERT INTO idade_a
values (0,'João',18),(1,'Pedro',19),(2,'Maria',20),(3,'Paula',21);

-- Criando a tabela idade_b
create table idade_b(
	id int,
	nome varchar(10),
	idade int,
	primary key(id)
);


insert into idade_b
values (0,'João',18),(1,'Pedro',23),(2,'Maria',24),(3,'Paula',25);


-- UNION (UNE DUAS TABELAS) - EXCLUI OBJETO QUE FOR IGUAL ENTRE AS TABELAS
-- Unir as informações das 2 tabelas:
SELECT
	nome,
	idade
FROM
	idade_a
UNION
SELECT
	nome,
	idade
FROM
	idade_b;


	-- Unir as informações das 2 tabelas, SEM EXCLUIR OS OBJ IGUAIS -> UNION ALL
SELECT
	nome,
	idade
FROM
	idade_a
UNION ALL
SELECT
	nome,
	idade
FROM
	idade_b;
	--------------------------------------------------------------------
	--EXCEPT: RETORNA OBJ EXCLUSIVOS DA 1ª TABELA SELECIONADA: EX: TABELA A

	SELECT
	nome,
	idade
FROM
	idade_a
EXCEPT
SELECT
	nome,
	idade
FROM
	idade_b;


	--------------------------------------------------------------------
	--INTERSECT : SELECIONA APENAS VALORES QUE SE REPETEM ENTRE AS TABELAS

		SELECT
	nome,
	idade
FROM
	idade_a
INTERSECT
SELECT
	nome,
	idade
FROM
	idade_b;
	
	--------------------------------------------------------------
			-- Criando a tabela clientes 
		create table clientes(
			cpf char(11),
			nome varchar(10),
			primary key(cpf)
		);

		-- Inserindo os dados
		insert into clientes
		values ('18374177098','Arthur'),('17060231030','Bruno'),('23878596693','Filipe'),
		('44192841886','Guilherme'),('59862616156','Hariamy'),('88567582458','Hugo'),
		('95448038662','Igor'),('79845532209','Matheus'),('73145743244','Noah');
		
		
		-- Criando a tabela de saldo ------------------------------------------------------
		create table saldo(
			cpf char(11),
			saldo real,
			primary key(cpf)
		);

		insert into saldo
		values ('17060231030',100),('44192841886',200),('88567582458',300),('79845532209',400),('11654518590',500);
		
		-- Criar a tabela idade ------------------------------------------------------
		create table idade(
		cpf char(11),
		idade int,
		primary key(cpf)
		);

		insert into idade
		values  ('17060231030',18),('23878596693',19),('59862616156',20),('95448038662',21),
				('73145743244',22),('57437935228',23);


	   --INNER  JUNTAS AS INFO DA TABELA CLIENTE E A TABELA SALDO
	SELECT 
	    A.cpf,
	    A.nome,
	    B.saldo
	FROM 
	    clientes as A
	    INNER JOIN
		saldo as B
	ON
		A.cpf = B.cpf;

	   -- LEFT JOIN  ------------------------------------------------------
	SELECT
		A.cpf,
		A.nome,
		B.saldo
	FROM
		clientes as A
	LEFT JOIN
		saldo as B
	ON
		A.cpf = B.cpf;


	-- RIGHT JOIN  -------------------------------------------------------
	SELECT
		A.cpf,
		A.nome,
		B.saldo
	FROM
		clientes as A
	RIGHT JOIN
		saldo as B
	ON
		A.cpf = B.cpf;

			   -- LEFT EXCLUDING JOIN ------------------------------------------------------
	SELECT
		A.cpf,
		A.nome,
		B.saldo
	FROM
		clientes as A
	LEFT JOIN
		saldo as B
	ON
		A.cpf = B.cpf

		WHERE  B.cpf is NULL;


			-- RIGHT EXCLUDING JOIN ------------------------------------------------------
	SELECT
		A.cpf,
		A.nome,
		B.saldo
	FROM
		clientes as A
	RIGHT JOIN
		saldo as B
	ON
		A.cpf = B.cpf
	WHERE A.cpf is NULL;


-- FULL OUTER JOIN
SELECT
	A.cpf,
	A.nome,
	B.saldo
FROM
	clientes as A
FULL OUTER JOIN
	saldo as B
ON
	A.cpf = B.cpf;



	-- FULL EXCLUDING OUTER JOIN --------------------------------------------

	SELECT
		A.cpf,
		A.nome,
		B.saldo
	FROM
		clientes as A
	FULL OUTER JOIN
		saldo as B
	ON
		A.cpf = B.cpf
	WHERE
		A.cpf is NULL or B.cpf is NULL;



		-- INNER - Juntar as informações da tabela clientes, saldo e idade
SELECT
	A.cpf,
	A.nome,
	B.saldo,
	C.idade
FROM
	clientes as A
INNER JOIN
	saldo as B
ON
	A.cpf = B.cpf
INNER JOIN
	idade as C
ON
	A.cpf = C.cpf;
