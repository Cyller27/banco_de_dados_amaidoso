# CRIAÇÃO DO BANCO DE DADOS
create database amaidoso;
use amaidoso;

#CRIAÇÃO DAS TABELAS

# TABELA IDOSO
create table idoso(

	id_idoso integer primary key auto_increment,
	nome_idoso varchar(100) not null,
	dt_nasc date not null,
	sexo char(1),
	cpf char(11),
    observacoes text,
    
	-- RELAÇÃO COM CHAVE ESTRANGEIRA
    id_responsavel integer not null,
	foreign key(id_responsavel) references responsavel(id_responsavel)
	-- references responsavel(id_responsavel)
);

# TABELA MEDICAÇÃO
create table medicacao(

	id_medicacao integer primary key auto_increment,
    nome_medicamento varchar(100),
    dosagem varchar(100),
    horario datetime,
    id_idoso integer not null,
    foreign key(id_idoso) references idoso(id_idoso)
    
);
# TABELA COMPROMISSO
-- create table compromisso();

# TABELA RESPONSÁVEL
create table responsavel(
	id_responsavel integer primary key auto_increment,
    nome_responsavel varchar(100) not null,
    cpf char(11),
    telefone varchar(20) not null,
    email varchar(100),
    senha varchar(15) not null
    -- dt_cadastro date not null // ISSO É REALMENTE NECESSÁRIO?
    
);
# TABELA ANOTAÇÕES
-- create table anotacoes