create table if not exists Departamento 
(
	codDep int not null auto_increment primary key,
    Departamento varchar(100) not null unique,
    Decricao varchar(100),
    Data_Criacao  date not null,
    Data_Criacao  date 
)charset=utf8;

#CRIANDO A TABELA FUNÇÃO 
create table if not exists Cargo
(
	codCargo int not null auto_increment primary key,
    Funcao varchar(100) not null unique,
    Decricao varchar(100),
    Data_Cadast  date not null,
    IDDep int not null,
    foreign key(IDDep) references Departamento(codDep)
)charset=utf8;
#CRIANDO A TABELA FUNÇÃO 
create table if not exists Cargo
(
	codCargo int not null auto_increment primary key,
    Funcao varchar(100) not null unique,
    Decricao varchar(100),
    Data_Cadast  date not null,
    IDDep int not null,
    foreign key(IDDep) references Departamento(codDep)
)charset=utf8;