CREATE DATABASE projeto_final;

USE projeto_final;

-- EXEMPLO PARA ALTERAR ALGUM DADO NA TABELA
ALTER TABLE nome_tabela
ALTER column nome_coluna varchar(100);

--VER TODAS AS TABELAS DO BANCO DE DADOS
SELECT * FROM information_schema.tables;


---------------------------- TABELA ALUNO --------------------------
CREATE TABLE ALUNO(
cpf varchar(11) not null,  --primary key
nome varchar(20)  not null,
sobrenome varchar(20) not null,
endereco varchar(100),
telefone varchar(11),
dt_nasc date not null,

primary key(cpf)
);

---------------------------- TABELA CURSO --------------------------
CREATE TABLE CURSO(
codigo varchar(10),  --primary key
nome varchar(20),
descricao varchar(20),
cod_dept int

primary key(codigo)
);

---------------------------- TABELA MATRICULA --------------------------
CREATE TABLE MATRICULA(
codigo_curso varchar(10),  -- PK -> fk_curso_matricula
cpf_aluno varchar(11), -- PK -> fk_aluno_matricula
data_matricula date

primary key(codigo_curso, cpf_aluno),
constraint fk_Curso_Matricula foreign key (codigo_curso) references CURSO(codigo),
constraint fk_Aluno_Matricula foreign key (cpf_aluno) references ALUNO(cpf)
);

----------------------------------------------------------------------------------------------
CREATE TABLE DISCIPLINA(
codigo varchar(10),-- pk
nome varchar(20),
quant_creditos int, --numero de horas da disciplina
matricula_prof varchar(10) --fk_prof_disciplina

primary key(codigo)
);

----------------------------------------------------------------------------------------------
CREATE TABLE CURSA(
cpf_aluno varchar(11), --PK -> fk_aluno_cursa
codigo_disciplina varchar(10), --PK -> fk_disciplina_cursa

primary key(cpf_aluno, codigo_disciplina),
constraint fk_Aluno_Cursa foreign key (cpf_aluno) references ALUNO(cpf),
constraint fk_Disciplina_Cursa foreign key (codigo_disciplina) references DISCIPLINA(codigo)
);

----------------------------------------------------------------------------------------------
CREATE TABLE COMPOE(
codigo_curso varchar(10), -- PK -> fk_Curso_Compoe
codigo_disciplina varchar(10) --PK -> fk_Disciplina_Compoe

primary key (codigo_curso, codigo_disciplina)
constraint fk_Curso_Compoe foreign key (codigo_curso) references CURSO(codigo),
constraint fk_Disciplina_Compoe foreign key (codigo_disciplina) references DISCIPLINA(codigo)
);

----------------------------------------------------------------------------------------------

CREATE TABLE PROFESSOR(
matricula varchar(10), --pk
nome varchar(20)  not null,
sobrenome varchar(20) not null,
endereco varchar(100),
telefone varchar(11),
dt_nasc date,
codigo_dept varchar(10), --fk_departamento_professor
data_contratacao date

primary key(matricula),
constraint fk_dept_prof foreign key (codigo_dept) references DEPARTAMENTO(codigo)

);
--------------------------------------------------------------------------------------------

CREATE TABLE DEPARTAMENTO(
codigo varchar(10), --PK
nome varchar(20),

primary key(codigo)
);
--------------------------------------------------------------------------------
CREATE TABLE PRE_REQ(
codigo_disciplina varchar(10),  --pk fk_Disciplina_PreReq
codigo_disciplina_dependencia varchar(10)--pk fk_Disciplina_PreReq

primary key(codigo_disciplina, codigo_disciplina_dependencia),
constraint fk_Disciplina_PreReq foreign key(codigo_disciplina) references DISCIPLINA(codigo),
constraint fk_Disc_Dep_PreReq_ foreign key (codigo_disciplina_dependencia) references DISCIPLINA(codigo)
);