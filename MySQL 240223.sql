   /* AULAS DE MYSQL - ALURA 24/02/23*/
   
   /*
   O IF NOT EXISTS é opcional. Ele permite que você verifique se a tabela que você cria
   já existe no banco de dados. Se for esse o caso, o MySQL ignorará toda a instrução e
   não criará nenhuma nova tabela.
   
   CREATE  TABLE  [IF NOT EXISTS]  table_name(
       column_1_definition,
       column_2_definition,
       ...,
       table_constraints
    )  ENGINE=storage_engine;
    
    -------------------------------------------------------------------------------------  
    A seguir, é mostrada a sintaxe da definição de uma coluna:
    column_name  data_type(length)  [NOT NULL]  [DEFAULT  value]  [AUTO_INCREMENT]  column_constraint;
*/

create database teste01;

use teste01;

CREATE TABLE PESSOA(
nome varchar(50) NOT NULL,
sobronome varchar(50) NOT NULL,
dataNasc varchar(10),
documento varchar(30) NOT NULL,
endereco varchar(100)
);

select * from PESSOA;

INSERT INTO PESSOA
VALUES
('Jose', 'da Silva', '06/19/1965', '71254094167-1 SP', 'Rua 1234 Nº256 - Apto 1201, São Paulo-SP'),
('Carlos', 'Frias', '18/05/1952', '99415410011-9 BA', 'Rua Antonio Gomes Nº105, Salvador-BA');

    DESCRIBE PESSOA;
/*------------------------------------------------*/
CREATE  TABLE  IF NOT EXISTS  tasks  (

         task_id  INT  AUTO_INCREMENT  PRIMARY KEY,

         title  VARCHAR(255)  NOT NULL,

         start_date  DATE,

         due_date  DATE,

         status  TINYINT  NOT NULL,

         priority  TINYINT  NOT NULL,

         description  TEXT,

         created_at  TIMESTAMP  DEFAULT  CURRENT_TIMESTAMP
)           ENGINE=INNODB;

select * from tasks;
/*DESCREVER A TABELA, TIPOS DE VALORES, NULOS, AUTO INCREMENT, PK e FK, etc*/
    DESCRIBE  tasks;
    
    
    CREATE TABLE IF NOT EXISTS checklists (

     todo_id  INT  AUTO_INCREMENT,
     task_id  INT,
     todo  VARCHAR(255)  NOT NULL,
     is_completed  BOOLEAN  NOT NULL  DEFAULT  FALSE,
     PRIMARY KEY  (todo_id  ,  task_id),
     FOREIGN KEY  (task_id)
          REFERENCES  tasks  (task_id)
          ON UPDATE  RESTRICT  ON DELETE  CASCADE
);

    DESCRIBE  checklists;
    
    
/***************************** COMANDOS MY SQL ***********************************/

show tables; /*Para ver todas as tabelas da base de dados.*/
show databases; /*Listar todas as bases de dados no servidor SQL.*/
create database [databasename];/* Para criar uma base de dados em um servidor SQL.*/
use [db name]; /*Mudar de base de dados.*/
describe [table name]; /*Para ver os formatos dos campos.*/
drop database [database name];/* Para apagar uma base de dados.*/
drop table [table name];/* Para apagar uma tabela.*/
SELECT * FROM [table name];/* Para ver toda a informação de uma tabela.*/
show columns from [table name];/* Retornar a informação das colunas e as respectivas colunas da tabela especificada.*/

SELECT FROM [table name] WHERE [field name] = “valor dado”;/* Ver campos específicos com o valor “valor dado”.*/
SELECT FROM [table name] WHERE name = “Fulano” AND phone_number = ‘8585858′;/* Ver todas as entradas que contenham o nome “Fulano” e o Numero de telefone ‘8585858′.*/
SELECT FROM [table name] WHERE name != “Abracadabra” AND phone_number = ‘6777777′ order by phone_number;/* Ver todas as entradas que contenham o nome “Abracadabra” e o número de telefone ‘6777777′ ordenadas pelo campo do telefone.*/
SELECT FROM [table name] WHERE name like “Delva%” AND phone_number = ‘6220980′;/* Ver todas as entradas que comecem pelas letras ‘joão’ e pelo telefone ‘6220980′.*/


SELECT DISTINCT [column name] FROM [table name];/* Mostrar entradas únicas.*/
SELECT [col1],[col2] FROM [table name] ORDER BY [col2] DESC; /*Mostrar entradas seleccionadas por ordem ascendente (asc) ou descentente (desc).*/
SELECT COUNT() FROM [table name];/* Retornar o número de colunas.*/
SELECT SUM() FROM [table name]; /* Somar as colunas.*/
INSERT INTO [table name] (Host,User,Password) VALUES(’%’,’user’,PASSWORD(’password’));/* Mudar para a mysql db. Criar um novo utilizador.*/
SET PASSWORD FOR ‘user’@’hostname’ = PASSWORD(’passwordhere’);/* Mudar uma password de um utilizador.(da linha de comandos MySQL).*/
DELETE from [table name] where [field name] = ‘whatever’; /*Apagar linhas de uma tabela.*/
FLUSH PRIVILEGES; /*Atualizar permissões e previlégios de uma base de dados.*/
alter table [table name] drop column [column name];/* Apagar uma Coluna.*/
alter table [table name] add column [new column name] varchar (20);/* Adicionar uma coluna a uma Base de Dados.*/
alter table [table name] change [old column name] [new column name] varchar (50);/* Mudar o nome de uma tabela.*/
alter table [table name] add unique ([column name]);/* Criar uma única coluna.*/
alter table [table name] modify [column name] VARCHAR(3);/* Criar uma coluna maior.*/
alter table [table name] drop index [colmn name];/* Apagar unica de uma tabela.*/

[mysql dir]/bin/mysqldump -u root -ppassword –opt >/tmp/alldatabases.sql;/* Fazer um backup de todas as bases de dados.*/
[mysql dir]/bin/mysqldump -u username -ppassword –databases databasename >/tmp/databasename.sql/* Fazer um backup de apenas uma base de dados.*/
[mysql dir]/bin/mysqldump -c -u username -ppassword databasename tablename > /tmp/databasename.tablename.sql /* Fazer o backup de uma tabela de uma base de dados.*/
[mysql dir]/bin/mysql -u username -ppassword databasename < /tmp/databasename.sql /* Restaurar uma base de dados (ou tabela) de um backup.*/
UPDATE NOME_DA_TABELA SET campo1 = valor1, campo2 = valor2. /* O comando update possui a sintaxe muito similar ao do INSERT, mas é utilizada para atualizar registros do banco de dados.*/