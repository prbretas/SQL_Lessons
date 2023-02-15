		create database exercicio0802_db
		use exercicio0802_db 
		drop database exercicio0802

		-----------------------------------------------

		CREATE TABLE AGENCIA(
		codAgencia INT,  --primary key
		nome varchar(40) not null,
		cidade varchar(100),

		primary key(codAgencia),
		);

		-----------------------------------------------

		CREATE TABLE CLIENTE(
		codCliente INT,  --primary key
		nome varchar(40) not null,
		rua varchar (40),
		cidade varchar (30),

		primary key(codCliente)

		);

		-----------------------------------------------------

		CREATE TABLE EMPRESTIMO(
		nroEmprestimo int,  --primary key
		codAgencia int,
		total real,
		
		primary key(nroEmprestimo),
		constraint fk_Agencia_Emprestimo foreign key(codAgencia) references AGENCIA(codAgencia)
		);

				--------------------------------------------------------
		CREATE TABLE CONTA(
		nroConta int, --primary key
		codAgencia int,
		saldo int, 

		primary key(nroConta ),
		constraint fk_Agencia_Conta foreign key(codAgencia) references AGENCIA(codAgencia),
		);


	
		-----------------------------------------------------
		CREATE TABLE DEVEDOR(
		codCliente int, --primary key
		 nroEmprestimo int, --primary key

		primary key(codCliente, nroEmprestimo),
		constraint fk_Cliente_Devedor foreign key(codCliente) references CLIENTE(codCliente),
		constraint fk_Emprestimo_Devedor foreign key(nroEmprestimo) references EMPRESTIMO(nroEmprestimo)

		 );


		--VER TODAS AS TABELAS DO BANCO DE DADOS
		SELECT * FROM information_schema.tables;

		------------------------------------------------------------

		CREATE TABLE CORRENTISTA(
		 codCliente int, 
		 nroConta int,

		 primary key (codCliente, nroConta),
		constraint fk_Cliente_Correntista foreign key(codCliente) references CLIENTE(codCliente),
		constraint fk_Conta_Correntista foreign key(nroConta) references CONTA(nroConta)
		);

	DROP TABLE CLIENTE
	DROP TABLE AGENCIA
	DROP TABLE EMPRESTIMO
	DROP TABLE DEVEDOR
	DROP TABLE CONTA
	DROP TABLE CORRENTISTA


		SELECT * FROM AGENCIA
		SELECT * FROM CLIENTE --
		SELECT * FROM EMPRESTIMO
		SELECT * FROM DEVEDOR --
		SELECT * FROM CONTA --
		SELECT * FROM CORRENTISTA -- 


		insert into AGENCIA
values(0700,'Centro','S�o Paulo'),(0550,'Rodovi�ria','S�o Paulo'),(0210,'Bar�o Geraldo','Campinas'),(2121,'S�','S�o Paulo'),
      (0315,'Pinheiros','S�o Paulo'),(0205,'Aeroporto','S�o Paulo'),(0750,'Centro','Campinas'),(0200,'Tucuruvi','S�o Paulo'),
      (1220,'Morumbi','S�o Paulo'),(1155,'Itaquera','S�o Paulo'),(0111,'USP','S�o Paulo'),(7070,'Jabaquara','S�o Paulo'),
      (1715,'Pacaemb�','S�o Paulo'),(2200,'Guarulhos','Guarulhos'),(0222,'Unicamp','Campinas'),(0001,'Paulista','S�o Paulo');
      
insert into CLIENTE
values(1111,'Jo�o da Silva','Rua S�o Jos� - 638','S�o Paulo'),(1112,'Jos� Costa','Rua S�o Paulo - 619','S�o Paulo'),
      (1113,'Marcos Ameixa','Rua Santo Ant�nio - 554','Campinas'),(1114,'Sebasti�o Roma','Avenida Brasil - 532','Campinas'),
      (1115,'Lucas Souza','Rua S�o Pedro - 458','S�o Paulo'),(1116,'Mateus Barbosa','Rua S�o Jo�o - 455','S�o Paulo'),
      (1117,'Maria Carvalho','Rua S�o Francisco - 442','Campinas'),(1118,'Manuel Santos','Av. Princesa do Oeste - 447','Campinas'),
      (1119,'Mariana Gomes','Rua Sete de Setembro - 428','S�o Paulo'),(1120,'Sandra Rocha','Av. Bar�o de Rio Branco - 227','S�o Paulo'),
      (1121,'Carlos Quaresma','Rua Quinze de Novembro - 394','S�o Paulo'),(1122,'Andr� Mendon�a','Rua Marechal Deodoro da Fonseca - 125','S�o Paulo'),
      (1123,'Aberlado Ramos','Rua Leonardo Martins - 1145','Campinas'),(1124,'Joaquim Ferreira','Rua Tiradentes - 384','Campinas'),
      (1125,'Edgar Matias','Rua Francisco Menor - 1107','S�o Paulo'),(1126,'Maria Jos�','Rua Gua�u� - 1019','Campinas');
      
insert into EMPRESTIMO
values(1,0700,10250.00),(2,1155,100550.00),(3,0315,70250.00),(4,0210,5000.00),(5,7070,1050.00),(6,0001,1000000.00),(7,1220,2450.00),(8,1715,1124.00),
      (9,0315,1250.00),(10,1155,80000.00),(11,0210,5050.00),(12,0111,7500.00),(13,0205,1000.00),(14,1155,7500000.00),(15,1220,12540.00),(16,0210,750.00);
      
insert into DEVEDOR
values(1111,13),(1117,12),(1122,8),(1119,6),(1113,3),(1115,1),(1115,10),(1111,2),
      (1112,14),(1116,16),(1121,7),(1121,5),(1111,4),(1117,9),(1116,11),(1111,15);
      
insert into CONTA
values(1001,0700,7500),(1002,0111,7500),(1003,7070,7500),(1004,0200,7500),(1005,0210,7500),(1006,0111,7500),(1007,1155,7500),(1008,0315,7500),
      (1009,0205,7500),(1010,0001,7500),(1011,0111,7500),(1012,2121,7500),(1013,0750,7500),(1014,0222,7500),(1015,1220,7500),(1016,2200,7500);

insert into CORRENTISTA
values(1111,1001),(1112,1002),(1113,1003),(1114,1004),(1115,1005),(1116,1006),(1117,1007),(1118,1008),
      (1119,1009),(1120,1010),(1121,1011),(1122,1012),(1123,1013),(1124,1014),(1125,1015),(1126,1016);





	  -----------------------------------------------------------------------------
	  --EXERCICIOS
	  --Responda as perguntas abaixo:
		--a) Liste as informa��es da rela��o empr�stimo para os empr�stimos com totais superiores a R$ 1.200.
			SELECT *
			FROM EMPRESTIMO
			WHERE total > 1200

		--b) Liste os n�meros dos empr�stimos para os empr�stimos com totais superiores a R$1.200.
			SELECT nroEmprestimo
			FROM EMPRESTIMO
			WHERE total > 1200

		--c) Liste os nomes dos clientes que tem um empr�stimo na ag�ncia 1.
		
	
		--d) Liste os nomes dos clientes que t�m um empr�stimo na ag�ncia Centro.

	
	  
