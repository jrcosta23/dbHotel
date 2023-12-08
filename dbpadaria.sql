show databases;

create database dbpadaria;

use dbpadaria;

create table Fornecedores (
idFornenecedor int primary key auto_increment ,
nome varchar(50) not null,
cnpj varchar(20) not null,
tel varchar(20),
email varchar(20) not null unique,
cep varchar(9),
endereco varchar(100),
numero varchar(10),
bairro varchar(40),
cidade varchar(40),
estado char(2)
);

insert into Fornecedores(nome, cnpj, tel, email, cep, endereco, numero, bairro, cidade, estado) values
("Emily", "56.649.102/0001-97", "(11) 2757-6155", "contato@emily.com.br", "13306-050", "Rua Luiz Morato Castanho", "631", "Rancho Grande", "Itu", "SP");

select * from Fornecedores;



create table Produtos (
idProduto int primary key auto_increment,
nomeProdutos varchar(50) not null,
descricao text,
precoProdutos decimal (10,2) not null,
estoqueProduto int not null,
categoriaProduto enum ('pães','salgados','café'),
validadeProdutos datetime,
ingredientesProduto text,
idFornenecedor int not null,
foreign key (idFornenecedor) references Fornecedores(idFornenecedor)
);

describe Produtos;



insert into Produtos(nomeProdutos, descricao, precoProdutos, estoqueProduto, categoriaProduto,validadeProdutos,ingredientesProduto, idFornenecedor)
values ("Salsichão", "SALSICHAO FGO TOM SECO EDER FAT 100G", 2.50, 12, "salgados", "2023-12-24", "farinha, salsicha e sal", 1);



insert into Produtos(nomeProdutos, descricao, precoProdutos, estoqueProduto, categoriaProduto,validadeProdutos,ingredientesProduto, idFornenecedor)
values ("Empadão", "salgadinho de massa recheada de galinha, queijo, camarão, palmito etc., assada ao forno em fôrma.", 14.50, 8, "salgados", "2023-12-24", "farinha, frango e requeijão", 1);


select * from Produtos;

select * from Produtos where categoriaProduto = "salgados";

select * from Produtos where precoProdutos < 10.00 order by precoProdutos asc;


create table clientes (
idCliente int primary key auto_increment,
nomeCliente varchar(50),
cpfCliente varchar(15) not null unique,
telefoneCliente varchar(20),
emailCliente varchar(50) unique,
cep varchar(9),
enderecoCliente varchar(100),
bairro varchar(40), 
estado varchar(2)
);

insert into clientes (nomeCliente, cpfCliente, telefoneCliente,emailCliente,cep,enderecoCliente,bairro,estado) values ("Melissa Heloisa", "919.810.370-98", "(61) 3728-7811", "melissa@universo3d.com.br", "72260-807", "Quadra QNO 18 Conjunto 7", "Ceilândia Norte", "DF");

select * from clientes;


create table pedido (
idpedido int primary key auto_increment,
datapedido timestamp default current_timestamp,
stastuspedido enum('pendente','finalizado','cancelado'),
idCliente int not null,
foreign key (idCliente) references clientes(idCliente)
);


select * from pedido;

insert into pedido (stastuspedido, idCliente) values ("finalizado", 1);

select * from pedido inner join clientes on pedido.idCliente = clientes.idCliente;

create table itensPedido (
iditensPedido int primary key auto_increment,
idpedido int not null,
foreign key (idpedido) references pedido(idpedido),
idProduto int not null,
foreign key (idProduto) references produtos(idProduto),
quantidade int not null
);


insert into itensPedido (idpedido, idProduto, quantidade) values (1, 8, 2);

insert into itensPedido (idpedido, idProduto, quantidade) values (1, 9, 1);

select * from itensPedido;

select sum(Produtos.precoProdutos * itensPedido.quantidade) as Total from Produtos inner join itensPedido on Produtos.idProduto = itensPedido.idProduto where idPedido = 1;


/* Filtrar produtos por validade (por exemplo, produtos com validade maior do que a data atual) */
 select * from Produtos where validadeProdutos > curdate();
 
 /*Filtrar produtos que contenham um ingrediente específico */
 select * from Produtos where ingredientesProduto like '%farinha%';
 
 /*ATIVIDADE: FILTRAR PÃES QUE SEJAM FEITOS À BASE DE FARINHA DE TRIGO, COM VALOR ATÉ 7.90*/
 select * from Produtos where categoriaProduto = 'salgados' and ingredientesProduto like '%farinha%' and precoProdutos <= 7.90;


select pedido.idpedido, Produtos.idProduto, Clientes.nomeCliente, Produtos.nomeProdutos, itensPedido.quantidade, Produtos.precoProdutos
from pedido inner join Clientes on pedido.idCliente = Clientes.idCliente inner join 
itensPedido on pedido.idpedido = itensPedido.idpedido inner join 
Produtos on Produtos.idProduto = itensPedido.idProduto;
