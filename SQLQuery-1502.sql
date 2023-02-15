--SELECT FROM WHERE

USE minha_empresa_db;

SELECT * FROM FUNCIONARIO;
SELECT * FROM DEPENDENTE;
SELECT * FROM DEPARTAMENTO;
SELECT * FROM DEPTO_LOCALIZACOES;
SELECT * FROM PROJETO;
SELECT * FROM TRABALHA_EM;

-- os funcionários que possuem dois
 -- ou mais dependentes.
SELECT nome
FROM FUNCIONARIO AS F
WHERE (SELECT COUNT (*)
        FROM DEPENDENTE
       WHERE ident=F_ident)>=2;

--funcionarios cujo salario
--É maior que o salério de todos
--os funciondrios do departamento 5.

SELECT nome
FROM FUNCIONARIO
WHERE salario > all (select salario
from funcionario
where D_num = 5);


-- CONSULTAS ANINHADAS CORRELACIONADAS
-- Exemplo: Recupere o nome de cada
-- funcionario que tem um dependente
-- com o mesmo nome e sexo que ele.

  SELECT nome, sobrenome, salario
  FROM FUNCIONARIO AS F
  WHERE F.ident IN (SELECT D.F_ident	
					FROM DEPENDENTE AS D
					WHERE F.nome = D.nome and F.sexo = D.sexo);

 select * from funcionario;
--DA PRA FAZER SEM SUB QUERY
SELECT f.nome
FROM FUNCIONARIO as F, DEPENDENTE as D
WHERE f.sexo = D.sexo and F.nome = D.nome;

-- UTILIZANDO O INNER JOIN
SELECT D.nome, D.sexo, F.nome, F.sexo
FROM FUNCIONARIO AS F
inner join DEPENDENTE AS D
on
	F.nome = D.nome and F.sexo = D.sexo;

	
--Retorne todos os funciondrios que nao possuem dependentes
SELECT nome
FROM FUNCIONARIO AS F
WHERE NOT EXISTS  (SELECT *
				  FROM DEPENDENTE AS D
			      WHERE F.ident = D.F_ident);


--SELECIONAR A IDENTFICACAO DO FUNCIONARIO
--Q  TRABALHAR NO DEPT 1, 2 OU 3;
SELECT DISTINCT F_ident
FROM TRABALHA_EM
WHERE P_num in (1,2,3);

--FUNÇÕES DE AGREGAÇÃO EM SQL
--COUNT, SUM, MAX, MIN, AVG

SELECT COUNT(*) AS	'TOTAL DE FUNCIONARIOS' 
FROM FUNCIONARIO;


SELECT
SUM(salario)as soma,
MAX(salario)as maximo, 
MIN (salario) as minimo,
AVG(salario) as media
FROM FUNCIONARIO
WHERE F.d_num = 5;

--EXEMPLO: CONTAR O NUMERO DE VALORES DE
--SALARIO DISTINTO NO BD
SELECT COUNT(*)
FROM FUNCIONARIO;


SELECT COUNT(distinct S_ident)
FROM FUNCIONARIO;



-- Exemplo: Contar o número de valores 
-- de salário distintos no BD.
SELECT 
	COUNT(distinct S_ident) as S_distinct,
	COUNT(distinct salario) as salarios_distinct
FROM FUNCIONARIO;



--------------------------------------------------
-- AGRUPAMENTOS:
--GROUP BY
--HAVING


-- Exemplo: Para cada departamento, 
-- recupere o número de departamento, 
-- o número de funcionários no departamento
-- e seu salário médio.
SELECT 
	D_num,
	count(ident) as qtd_fun,
	avg(salario) as salario_medio
FROM
	FUNCIONARIO
GROUP BY D_num;



 ---------------- HAVING ----------------------
SELECT 
	D_num,
	count(ident) as qtd_fun,
	avg(salario) as salario_medio
FROM
	FUNCIONARIO
GROUP BY D_num
HAVING AVG(salario) > 10000;



--Exemplo: Para cada projeto em que mais de 2 funcionários trabalham,
--recupere o número e o nome do projeto e o número de funcionários que
--trabalham no projeto.

	SELECT P.nome,
	   P.numero,
       count(*)
	FROM PROJETO as P,TRABALHA_EM as T
	WHERE P.numero = T.P_num
	GROUP BY P.numero, P.nome
	HAVING count(*) >=2 ;



 