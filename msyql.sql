/*  mostrar os bancos de dados existentes no servidor */
show databases;

/* excluir a tabela do banco*/
 drop table funcionarios;
/* criar  uma tabela */
create database dbHotel;

/* selecionar  banco de dados*/
use  dbHotel;

/* criar uma tabela  */
create table  funcionarios (
/* int  se refere ao tipo  do campo  na tabela 
primary  key determina que o campo idfun seja uma chave primária  responsável   por identificar   cada 
funcionário  auto_increment determina  que o mysql de um id novo a cada  cadastro */
idFunc int primary key auto_increment,
/*  varchar  é a  quantidade variácel de caracteres  nome (nesse caso, até 100 caracteres) 
nomefun  varchar (100 ) not null, 
/*  unique determina  que  o campo  seja  único e o valor  não  possa */
login varchar   (20)  not  null unique,
senha  varchar  ( 255) not null,
cargo varchar  (20)

);

/*descreve  os campos  da tabela  funcionarios */
describe funcionarios;



/* mostrar as tabelas*/
show tables;

/* inserir um  novo funcionarios  na tabela, com nome,login, senha cripitografada  e cargo */ 
insert into funcionarios( nomefunc, login, senha , cargo)  values ("aministrador","admi", md5("admi"), "administrador" );

insert into funcionarios (nomefunc, login, senha, cargo)values("pamellapereto", "pamellapereto", md5("123@senac"),"ti");
insert into funcionarios (nomefunc, login, senha, cargo)values("breno silva","brenosilva", md5("123@senac"), "cotabilidade"); 
insert into funcionarios (nomefunc, login, senha, cargo)values("victoria cardoso","victoriacardoso", md5("123@senac"),"rh");

/* inserir um novo funcionarios na tabela com nome, login, senha, critografada */
/*insert into funcionarios (nomefunc, login, senha, cargo)values("fellipe Lopes","fellipe", md5("123@senac");


/*read */
/* le/ buscar as informações  da tabela  funcionarios */
select * from funcionarios;

/* buscar  login e a  senha da tabela funcionarios  em que login e seja admin senha seja  admin */
select login as login , senha  from funcionarios where login - "admi" and senha - md5("amdi");

/* update */
/* atualizar  o campo login na tabela funcionarios espeficado o id */
update  funcionarios set cargo = "gerencia" where idFunc =5;



/* adicionar  o campo email a  tabela funcionarios */
alter table funcionarios add column email varchar(50) not null;

/* excluir  um campo tabela*/
alter  table funcionarios drop column email;

/*reposicionar o campo email para que ele  fique apos  o campo login  */
alter  table funcionarios modify column email varchar (50) not null  after login;

/* modificar  campo  email para que torne obrigatório, ou seja,   nao nulo (not null) */
alter table  funcionarios modify column eamil varchar (50) not null;

update funcionarios set  email = "pamella123@senac" where idFunc = 2;
update funcionarios  set email = "brenosilva123@senac" where idFunc = 3;
update funcionarios set  email = "victoriacardoso123@senac" where  idFunc = 5;


create table quartos (
idquarto int primary key auto_increment,
andar varchar(10) not null,
tipoQuarto varchar(50) not null,
ocupacaMax int  not null,
situacao char(3)  not null,
nome varchar(50) not null,
descricao text,
preco decimal (10,2) not null,
tipoCama varchar(20),
varanda char(3)
);

describe quartos;

alter table  quartos add column numeroQuarto varchar(10) not null after preco;

/*ADICIONAR COMANDO ABAIXO */
alter table quartos add column cafeDaManha char(3) not null after preco;
alter table quartos add column foto  varchar(255) not null after descricao;

alter table quartos add numeroQuarto varchar(10) not null after andar;

insert into quartos (andar, tipoQuarto, ocupacaMax, situacao, nome, descricao, foto, preco, cafeDaManha, numeroQuarto, tipoCama, varanda)
values
("5º" , "superior premier", 3, "não",
"Familiar","O quarto de 32m² com piso  frio, varanda - vista  para o mar. oferecer ar condicinado individual,TV LCD 42'',wi-fi  gratis, cofre digita,
frigobar abastecido  e banheiro com secador de cabelo e amenities e mesa  de trabalho. ",
"https://www.hilton.com/im/en/SAOMOHH/8396002/deluxe-casal-01-tratada-3000pxl.jpg?impolicy=crop&cw=5277&ch=3000&gravity=NorthWest&xposition=27&yposition=0&rw=760&rh=432",
750.90, "sim", "505" ,"Queen size", "sim");


insert into quartos (andar, tipoQuarto, ocupacaMax, situacao, nome, descricao, foto, preco, cafeDaManha, numeroQuarto, tipoCama, varanda)
values
("2º", "superior premier", 2, "sim", "casal",
"O quarto de 32m² com piso  frio, varanda - vista  para o mar. oferecer ar condicinado individual,TV LCD 42'',wi-fi  gratis, cofre digita,
frigobar abastecido  e banheiro com secador de cabelo e amenities e mesa  de trabalho. ",
"https://www.hilton.com/im/en/SAOMOHH/8396002/deluxe-casal-01-tratada-3000pxl.jpg?impolicy=crop&cw=5277&ch=3000&gravity=NorthWest&xposition=27&yposition=0&rw=760&rh=432",
1650.00, "sim" , "230" , "Queen size", "sim");

insert into quartos (andar, tipoQuarto, ocupacaMax, situacao, nome, descricao, foto, preco, cafeDaManha, numeroQuarto, tipoCama, varanda)
values
("2º", "luxo", 1, "sim", "solteiro", "O quarto de 32m² com piso  frio, varanda - vista  para o mar. oferecer ar condicinado individual,TV LCD 42'',wi-fi  gratis, cofre digita,
frigobar abastecido  e banheiro com secador de cabelo e amenities e mesa  de trabalho. ", "https://www.hilton.com/im/en/SAOMOHH/8396002/deluxe-casal-01-tratada-3000pxl.jpg?impolicy=crop&cw=5277&ch=3000&gravity=NorthWest&xposition=27&yposition=0&rw=760&rh=432",
650.00, "sim" , "212", "Queen size", "sim");


select * from quartos where situacao = "não" order by preco asc;
select * from quartos where cafeDaManha = "sim" and situacao = "não";
select * from  quartos where varanda = "sim" and cafeDaManha = "sim"  and situacao = "não";
select * from  quartos where  preco < 600.00 and situacao = "não";
 
 
 
 
 
 
 create table cliente (
 idCliente int primary  key auto_increment,
 nomeCompleto varchar (100) not null,
 cpf char(14) not null unique, 
 rg char (12) not null unique,
 email varchar(50) unique,
 celular varchar (20) not null, 
 numeroCartao varchar (20) not null unique,
 nomeTiTular varchar (100) not null,
 validade  date not null,
 cvv char(3) not null,
 checkin datetime not null, 
 checkout datetime not null,
 idquarto int not null,
 foreign key (idquarto) references quartos (idquarto)
 
 );
 
 describe cliente;
 
insert into cliente (nomeCompleto, cpf , rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout, idquarto) value
("josé  de assis", "829.942.570-09", "48.353.888-7", "josedeassis@gmail.com" , "(96) 99338-2803", "5526 4886 2543", "josé de assis", "2025-03-31","452",
"2023-11-02  14:00:00",  "2023-11-05 12:00:00", 1);


insert into cliente (nomeCompleto, cpf , rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout, idquarto) value
("paulo ferreira", "829.942.570-01", "18.353.888-7", "pauloferreiro@gmail.com" , "(11) 99537-2203", "453 9876 6533", "paulo ferreira", "2026-04-01","452",
"2023-09-09  14:00:00",  "2023-10-05 12:00:00", 6);








 
insert into quartos (andar, tipoQuarto, ocupacaMax, situacao, nome, descricao, foto, preco, cafeDaManha, numeroQuarto, tipoCama, varanda)
values  ("2º", "luxo", 1, "não", "solteiro", "O quarto de 32m² com piso  frio, varanda - vista  para o mar. oferecer ar condicinado individual,TV LCD 42'',wi-fi  gratis, cofre digita,
frigobar abastecido  e banheiro com secador de cabelo e amenities e mesa  de trabalho. ", "https://www.hilton.com/im/en/SAOMOHH/8396002/deluxe-casal-01-tratada-3000pxl.jpg?impolicy=crop&cw=5277&ch=3000&gravity=NorthWest&xposition=27&yposition=0&rw=760&rh=432",
650.00, "sim" , "212", "Queen size", "sim");
 
 
 
insert into quartos (andar, tipoQuarto, ocupacaMax, situacao, nome, descricao, foto, preco, cafeDaManha, numeroQuarto, tipoCama, varanda)
values ("3º", "premier" , 3, "não", "casal", "O quarto de 32m²  com piso frio, varanda - vista para o mar. oferecer ar condicinado individual , TV LCD 40'' ,wi-fi gratis, cofre digital,
frigobar abastecido e banheiro com secador  de  cabelo e amenities  e mesa de trabalho", "https://s2.glbimg.com/QA7LmbS-ozlHO2u_9v3UbxbSr2A=/620x455/e.glbimg.com/og/ed/f/original/2021/06/29/ipiranga0184.jpg",
1200.00, "sim", "315", "Queen size", "sim");


select * from cliente;



select  cliente.nomeCompleto,
cliente.celular
from quartos inner join cliente on quartos.idquarto = cliente.idquarto where numeroQuarto = 315;


/*  buscar TODAS  AS  INFOMAÇÕES da tabela  quartos que está vinculada a tabela cliente pelo campo idquarto */
select *  from  quartos inner join cliente
on quartos.idquarto = cliente.idquarto;

/*  busca  o nome  completo e o celular  do cliente  que alugou o o quarto de número 505, pois  a  tabela quartos  está vinculada a tabela  cliente pelo campo idquarto */
select cliente.nomeCompleto as Nome, date_format(cliente.checkout, '%d/%m/%Y - %H:%i') as checkout from  quartos inner join cliente on  quartos.idquarto where numeroquarto = 505;

/*ATIVIDADE AVALIATIVA */

 

