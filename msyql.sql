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

/* update */
/* atualizar  o campo login na tabela funcionarios espeficado o id */
update  funcionarios set cargo = "gerencia" where idFunc =5;


