show databases;
 
 create database dbpadaria;
 
 use dbpadaria;
 
 
 create table Fornecedores (
 idFornenecedor int primary key  auto_increment,
 nome varchar (50),
 cnpj varchar (20), 
 tel varchar(20),
 email varchar(20),
 cep varchar (9),
 endereco varchar (100),
 numero varchar (10),
 bairro varchar (40),
 cidade varchar (40),
 estado char (2)
 );
 
 select * from Fornecedores;
 
insert into Fornecedores( nome, cnpj, tel, email, cep, endereco, numero, bairro, cidade, estado) values 
("junior de andrade", "46.712.002-79",  "(11) 99645-3271", "junior@gmail.com", "04923-200"," polo da paz","21", "nakamura","sao paulo","sp");

 

 create table Produtos (
 idProduto int primary key   auto_increment,
 nomeProdutos varchar(50),
 descricao text, 
 precoProdutos Decimal (10,2),
 estoqueProduto int,
 categoriaProduto enum ( 'pães','café', 'salgados') ,
 idFornecedores  int
 );
 
describe Produtos;
 
 insert into Produtos (nomeProdutos, precoProdutos, estoqueProduto, categoriaProduto, idFornecedores) values ('pãe de forma' ,15.00 , 1.000, 'pães', 1);
  insert into Produtos (nomeProdutos, precoProdutos, estoqueProduto, categoriaProduto, idFornecedores) values ('pãe de mel ' ,5.00, 10, 'pães', 1);
 
select * from Produtos;

insert into Produtos (nomeProdutos, precoProdutos, estoqueProduto, categoriaProduto, idFornecedores) values ('pãe de forma' ,15.00 , 1.000, 'pães', 1);
 insert into Produtos (nomeProdutos, precoProdutos, estoqueProduto, categoriaProduto, idFornecedores) values ('pãe de mel ' ,5.00, 10, 'pães', 1);
 
 
insert into Produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values
("Bolo de Chocolate", "Fofinho, prático, rápido e delicioso: essa é realmente a melhor receita de bolo de chocolate do mundo!", "45.00", 10, "Bolos", 1);

insert into Produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values
("Pão Francês", "O pãozinho é algo que não sai da dieta das pessoas. Seja no café da manhã, como acompanhamento antes de um almoço ou como lanche da tarde.", "0.50", 50, "Pães", 1);

alter table Produtos ADD column validadeProduto datetime;
alter table Produtos ADD column pesoProduto decimal(10,2);
alter table Produtos ADD column ingredientesProduto text;

insert into Produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor, pesoProduto, ingredientesProduto, validadeProduto) values
("Bolo de Chocolate", "Fofinho, prático, rápido e delicioso: essa é realmente a melhor receita de bolo de chocolate do mundo!", "45.00", 10, "Bolos", 1, "2.00", "2 xícaras de farinha de trigo, 1 xícara de leite, 1 colher (sopa) de fermento em pó, cobertura, 2 xícaras de leite, 2 xícaras de açucar, 6 colheres (sopa) de chocolate em pó, 6 ovos, 2 colheres (sopa) de manteiga", "2023-11-20");

insert into Produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor, pesoProduto, ingredientesProduto, validadeProduto) values
("Pão Francês", "O pãozinho é algo que não sai da dieta das pessoas. Seja no café da manhã, como acompanhamento antes de um almoço ou como lanche da tarde.", "0.00", 50, "Pães", 1, "0.45", "1/2 kg de farinha de trigo, 15g de sal, 1 colher (sopa) de margarina, 10g de fermento para pão, 20g de açucar", "2023-11-16");


update Produtos set pesoProduto = "2.00" where idProduto = 1;
update Produtos set ingredientesProduto = "2 xícaras de farinha de trigo, 1 xícara de leite, 1 colher (sopa) de fermento em pó, cobertura, 2 xícaras de leite, 2 xícaras de açucar, 6 colheres (sopa) de chocolate em pó, 6 ovos, 2 colheres (sopa) de manteiga" where idProduto = 1;
update Produtos set validadeProduto = "2023-11-20" where idProduto = 1;

update Produtos set pesoProduto = "0.45" where idProduto = 2;
update Produtos set ingredientesProduto = "1/2 kg de farinha de trigo, 15g de sal, 1 colher (sopa) de margarina, 10g de fermento para pão, 20g de açucar" where idProduto = 2;
update Produtos set validadeProduto = "2023-11-15" where idProduto = 2;


select * from Produtos;
select * from Produtos where categoriaProduto = "Pães";
select * from Produtos where precoProdutos < 50.00 order by precoProdutos asc;
 
 
select * from Produtos;
 
 
 select sum(quantidade * 15.00) as total from itensPedido inner join Produtos on itensPedido.idProdutos = 
 Produtos.idProduto where idPedido = 1;
 


  
 create table Pedido (
   idpedido int primary key auto_increment,
   dataPedido timestamp default current_timestamp,
   stastusPedido enum("pendente", "finalizado", "cancelado") not null,
   idCliente int  not null,
   foreign key (idCliente)  references Clientes(idCliente)
);
 describe Pedido;
 insert  into  Pedido (startusPedido, idCliente) values ("pendente",  1);
 insert  into  Pedido (startusPedido, idCliente) values ("finalizado", 4);
 
 select * from pedido;
 

 
create table Clientes(
idCliente int primary key auto_increment,
nomeCliente varchar (50),
cpfCliente varchar (15),
telefoneCliente varchar (20),
emailCliente varchar(50),
cep varchar (9),
enderecoCliente varchar (100),
bairro varchar (40),
estado char (2)

);

select * from Clientes;

insert into Clientes( nomeCliente , cpfCliente , telefoneCliente , emailCliente)values("junior de andrade",  "46.712.002-79","(11) 99645-3271", "junior@gmail.com");


create table  itensPedido (
iditensPedido int primary key auto_increment,
idPedido int not null,
foreign key (idPedido) references Pedido (idPedido),
idProduto int not null,
foreign key (idProduto) references Produtos (idProduto),
quantidade int not null

);

describe itensPedido;

insert into itensPedido(idpedido, idProduto, quantidade) values (1,1,3);
insert into itensPedido(idpedido, idProduto, quantidade) values (1,2,5);


select  *  from   pedido   inner join Cliente on pedido.idCliente =  cliente.idCliente;
select  * from    itensPedido inner join pedido on itnesPedido.idPedido = pedido.idPedido;
select  * from    itensPedido inner join pedido  on itensPedido.idPedido = produtos.idProduto;
select  * from    itens Pedido inner join produto on itensPedido.idPedido = pedido.idPedido;


/*OBJETIVO: consultar o nome do cliente que abriu seu pedido em  determinada data para  verificar  o que  ele comprou de itens nesse pedido  e a respectiva quantidade,
ou seja, quais produtos e quanto  cada um 	quem comprou  o que quanto comprou*/


 select cliente.nomeCliente, pedido.idPedido, pedido.dataPedido,  itensPedido.quantidade, produto.precoProduto
from Clientes  inner join pedido on pedido.idCliente = pedido.idCliente inner join
itensPedido on pedido.idPedido = itensPedido.idPedido inner join
produto on  produto. idPedido.idProduto;


select sum(Produtos.precoProdutos *  itensPedido.quantidade) as total from Produtos  inner join itensPedido on Produtos.idProduto =  idPedido.idProduto where  idPedido = 1;



/* FILTRAR PRODUTOS  POR  VALIDADE (POR EXEMPLO, PRODUTOS COM VALIDADE MAIOR  QUE A DATA ATUAL) */
select * from Produtos where validadeProdutos  >   curdate();



/*FILTRAR PRODUTOS QUE CONTENHAS  UM INGREDIENTE  ESPECÍFICO  */

select * from  Produtos  where ingredientesProduto like "%glúten%";



/* ATIVIDADE: FILTRAR  PÃES QUE SEJAM FEITO S Á BASE DE FARINHA DE TRIGO, COM VALOR ATÉ 7.90 */
/* QUERO UM RESULTADO  AO  MENOS! */

describe Produtos;
 
 /*ATIVIDADE: FILTRAR PÃES NÃO QUE SEJAM FEITOS À BASE DE FARINHA DE TRIGO, COM VALOR ATÉ 7.90*/
 
 select * from Produtos where categoriaProduto = 'Pães' and ingredientesProduto not like '%farinha de trigo%' and precoProdutos <= 7.90;
 
insert into Produtos (nomeProdutos, ingredientesProduto, pesoProdutos, validadeProdutos, precoProdutos, estoqueProduto, categoriaProduto, idFornecedores) values
("Bolinho de queijo", "sem lactose", 120, "2023-12-07", 13.50, 5, "salgados", 1); 

insert into Produtos (nomeProdutos, ingredientesProduto, pesoProduto, validadeProdutos, precoProdutos,estoqueProduto, categoriaProduto, idFornecedores) values
("Pão italiano", "trigo", 0.450, "2023-12-07", 7.90, 5, "coxinha", 1);



update itensPedido inner join Produtos on  itensPedido.idProduto = Produtos.idProduto
set Produtos.estoqueProduto = Produtos.estoqueProduto - itensPedido.quantidade 
where itensPedido.quantidade > 0;

select nomeProdutos, estoqueProduto from  Produtos;




