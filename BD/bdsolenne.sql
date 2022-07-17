Create database if not exists Cfsolenne charset utf8;
create table if not exists Departamento 
(
	codDep int not null auto_increment primary key,
    Departamento varchar(100) not null unique,
    Decricao varchar(100),
    Data_Criacao  date not null,
    Data_Modif  date 
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
#CRIANDO A TABELA CURSO E cATEGORIA
create table if not exists Categoria
(
	codCat int not null auto_increment primary key,
    Categoria varchar(100) not null unique,
    Decricao varchar(100) 
)charset=utf8;
create table if not exists Curso
(
	codCurso int not null auto_increment primary key,
    Curso varchar(100) not null unique,
    CargaHoraria int not null,
    preco decimal,
    Data_Cadast  date not null,
    IDCat int not null,
    foreign key(IDCat) references Categoria(codCat)
    
)charset=utf8;

#CRIANDO A TABELA FUNCIONARIO ENDEREÇO CONTACTO
create table if not exists Funcionario
(
	codFunc int not null auto_increment primary key,
    Nome varchar(100) not null,
    Sobrenome varchar(100), 
    Apelido varchar(100) not null,
    Identidade varchar(14) unique, 
    genero enum('M','F') not null,
    Data_Nasc date not null
    
)charset=utf8;
create table if not exists EnderecoFunc 
(
	codEnd int not null auto_increment primary key,
    Bairro varchar(100) not null,
    Rua char, 
    Zona int,
    Cidade varchar(14),
	IDFunc int not null,
    foreign key(IDFunc) references Funcionario(codFunc)
)charset=utf8;

create table if not exists ContFunc 
(
	codCont int not null auto_increment primary key,
    Contato varchar(100) not null unique,
    Descricao varchar(100), 
    IDFunc int not null,
    foreign key(IDFunc) references Funcionario(codFunc)
)charset=utf8;
create table if not exists DocFunc 
(
	codDoct int not null auto_increment primary key,
    Doc varchar(100) not null,
    IDFunc int not null,
    foreign key(IDFunc) references Funcionario(codFunc)
    
)charset=utf8;
create table if not exists TipoFormacao 
(
	codTipo int not null auto_increment primary key,
    Tipo varchar(100) not null unique,
    descricao varchar(100)
    
)charset=utf8;
create table if not exists FormacaoFunc
(
	codFormacao int not null auto_increment primary key,
    Nome_formacao varchar(100) not null,
    Nivel varchar(100), 
    Instituicao varchar(100) not null,
    IDFunc int not null,
    foreign key(IDFunc) references Funcionario(codFunc), 
    DITipoForm int not null,
    foreign key(DITipoForm) references TipoFormacao (codTipo)
    
)charset=utf8;
#CRIANDO A TABELA FUNCIONARIO ENDEREÇO CONTACTO
create table if not exists Formando
(
	codForm int not null auto_increment primary key,
    Nome varchar(100) not null,
    Sobrenome varchar(100), 
    Apelido varchar(100) not null,
    Identidade varchar(14) unique, 
    genero enum('M','F') not null,
    Data_Nasc date not null
    
)charset=utf8;
create table if not exists EnderecoFormando
(
	codEnd int not null auto_increment primary key,
    Bairro varchar(100) not null,
    Rua char, 
    Zona int,
    Cidade varchar(14),
	IDForm int not null,
    foreign key(IDForm) references Formando(codForm)
)charset=utf8;

create table if not exists ContFormando
(
	codCont int not null auto_increment primary key,
    Contato varchar(100) not null unique,
    Descricao varchar(100),
	IDForm int not null,
    foreign key(IDForm) references Formando(codForm)
    
)charset=utf8;
##Tabelas Principais
create table if not exists Incrição
(
	codInscricao int not null auto_increment primary key,
    ValorCurso1 decimal,
    ValorCurso2 decimal,
    ValorMaterial decimal,
	ValorCartao   decimal not null,
    data_inscricao date not null,
    IDForm int not null,
    foreign key(IDForm) references Formando(codForm),
    IDFunc int not null,
    foreign key(IDFunc) references Funcionario(codFunc),
    IDCurso int not null,
    foreign key(IDCurso) references Curso(codCurso)
    
)charset=utf8;

create table if not exists CadFormador
(
	codigo int not null auto_increment primary key,
    data_inscricao date not null,
    IDFunc int not null,
    foreign key(IDFunc) references Funcionario(codFunc),
    IDCurso int not null,
    foreign key(IDCurso) references Curso(codCurso)
    
)charset=utf8;

select* from curso;
select* from departamento;