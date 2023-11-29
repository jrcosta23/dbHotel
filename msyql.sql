/* banco de  de dados para gerenciamento de um hotel */
show databases;

show tables;

create database dbHotel;

use  dbHotel;



create table funcionarios (
idFunc int primary  key auto_increment,
nomefunc varchar (100) not null,
login varchar   (20)  not  null unique,
email varchar  (50)  not null,
senha  varchar  ( 255) not null,
cargo varchar  (20)

);

describe funcionarios;

insert into funcionarios (nomefunc, login, email, senha , cargo)  values ("administrador","admin", "administrador@gmail.com", md5("admin"), "administrador" );
insert into funcionarios (nomefunc, login, email, senha , cargo)values("pamellapereto", "pamellapereto", "pamella@gmail.com", md5("123@senac"),"ti");
insert into funcionarios (nomefunc, login, email, senha , cargo)values("breno silva","brenosilva", "breno@gmail.com", md5("123@senac"), "contabilidade"); 
insert into funcionarios (nomefunc, login, email, senha , cargo)values("victoria cardoso","victoriacardoso", "victoriacardoso@gmail.com", md5("123@senac"),"rh");
select * from funcionarios;
select login as login , senha  from funcionarios where login = "admin" and senha = md5("admin");

create table quartos (
idquarto int primary key auto_increment,
andar varchar(10) not null,
tipoQuarto varchar(50) not null,
ocupacaMax int  not null,
situacao char(3)  not null,
nome varchar(50) not null,
descricao text,
foto varchar(255) not null,
preco decimal (10,2) not null,
cafeDaManha char(3) not null,
numeroQuarto varchar(10) not null,
tipoCama varchar(20),
varanda char(3)
);
describe  quartos;


insert into quartos (andar, tipoQuarto, ocupacaMax, situacao, nome, descricao, foto, preco, cafeDaManha, precoCafe, numeroQuarto, tipoCama, varanda) values
("5º" , "superior premier", 3, "não",
"Familiar","O quarto de 32m² com piso  frio, varanda - vista  para o mar. oferecer ar condicinado individual,TV LCD 42'',wi-fi  gratis, cofre digita,
 frigobar abastecido  e banheiro com secador de cabelo e amenities e mesa  de trabalho.",
"https://www.hilton.com/im/en/SAOMOHH/8396002/deluxe-casal-01-tratada-3000pxl.jpg?impolicy=crop&cw=5277&ch=3000&gravity=NorthWest&xposition=27&yposition=0&rw=760&rh=432",
750.90, "sim", 60.00, "505" ,"Queen size", "sim");

insert into quartos (andar, tipoQuarto, ocupacaMax, situacao, nome, descricao, foto, preco, cafeDaManha, precoCafe, numeroQuarto, tipoCama, varanda) values
("2º", "superior premier", 2, "sim", "casal",
"O quarto de 32m² com piso  frio, varanda - vista  para o mar. oferecer ar condicinado individual,TV LCD 42'',wi-fi  gratis, cofre digita,
 frigobar abastecido  e banheiro com secador de cabelo e amenities e mesa  de trabalho.",
"https://www.hilton.com/im/en/SAOMOHH/8396002/deluxe-casal-01-tratada-3000pxl.jpg?impolicy=crop&cw=5277&ch=3000&gravity=NorthWest&xposition=27&yposition=0&rw=760&rh=432",
1650.00, "sim" , 60.00, "230" , "Queen size", "sim");

insert into quartos (andar, tipoQuarto, ocupacaMax, situacao, nome, descricao, foto, preco, cafeDaManha, precoCafe, numeroQuarto, tipoCama, varanda) values
("3º", "premier", 3, "não", "casal", "O quarto de 32m²  com piso frio, varanda - vista para o mar. oferecer ar condicinado individual , TV LCD 40'' ,wi-fi gratis, cofre digital,
 frigobar abastecido e banheiro com secador  de  cabelo e amenities  e mesa de trabalho",
 "https://s2.glbimg.com/QA7LmbS-ozlHO2u_9v3UbxbSr2A=/620x455/e.glbimg.com/og/ed/f/original/2021/06/29/ipiranga0184.jpg",
1200.00, "sim" , 60.00, "315", "Queen size", "sim");


select * from quartos;
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
 celular varchar (20) not null
 );
 
describe cliente;
 
insert into cliente (nomeCompleto, cpf , rg, email, celular) values
("josé  de assis", "829.942.570-09", "48.356.888-7", "josedeassis@gmail.com" , "(96) 99338-2803");
insert into cliente (nomeCompleto, cpf , rg, email, celular) values
("paulo ferreira", "712.689.550.04", "18.353.888-7", "pauloferreiro@gmail.com" , "(11) 99537-2203");

select * from cliente;

 create table pedido (
   idpedido int primary key auto_increment,
   datapedido timestamp default current_timestamp,
   stastuspedido enum("pendente", "finalizado", "cancelado") not null,
   idCliente int  not null,
   foreign key (idCliente)  references cliente(idCliente)
   
);

 insert  into  pedido (startuspedido, idCliente) values ("pendente",  1);
 insert  into  pedido (startuspedido, idCliente) values ("finalizado", 4);

select * from pedido;
select  *  from pedido  inner join  cliente on pedido.idCliente = cliente.idCliente;

 create table reservas (
    idreserva int primary key auto_increment,
    idpedido  int  not null,
    idquarto  int  not null,
    foreign key (idpedido) references pedido(idpedido),
    foreign key (idquarto) references quartos(idquarto),
	ckeckin  datetime  not null, 
	ckeckout datetime not null
    );
    
describe  reservas;

insert into reservas(idpedido, idquarto, ckeckin, checkout ) values (1,6, "2023-09-09  14:00:00",  "2023-10-05 12:00:00");
insert into reservas (idpedido, idquarto, ckeckin, checkout) values (1,1, "2023-09-09  14:00:00",  "2023-10-05 12:00:00");
    
select * from  reservas;
select reservas.idreserva, pedido.idpedido,
quartos.idquarto, quartos.nome, quartos.andar, quartos.numeroQuarto
from (reservas inner join  pedido on  reservas.idpedido = pedido.idpedido)
inner join quartos on reservas.idquarto = quartos.idquarto;


/* Soma total do Pedido  feito pelo cliente */

select sum(quartos.preco) as total  from  reservas inner join quartos on 
reservas.idquarto = quartos.idquarto where idPedido = 1;


/* cliente cecília vitória Barros -  idPedido 2
quarto  reservas: superior  premier twin (7º andar, numero 703, preco/diária: 1150.90

check-in: 27/11/2023 as 10h00
check-in: 08/12/2023 as 10h00




