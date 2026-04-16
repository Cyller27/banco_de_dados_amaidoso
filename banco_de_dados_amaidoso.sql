# CRIAÇÃO DO BANCO DE DADOS
create database amaidoso; -- criando o bd
use amaidoso; -- usando o bd

#CRIAÇÃO DAS TABELAS

# TABELA RESPONSÁVEL
create table responsavel(

	id_responsavel integer primary key auto_increment,
    nome_responsavel varchar(100) not null,
    nome_usuario varchar(15) not null,
    telefone varchar(20),
    email varchar(50) unique not null, -- Para não existir email duplicado no registrar
    senha varchar(20) not null
);

# TABELA IDOSO
create table idoso(
	-- nome exibição para a tabela idoso
    -- Login por cpf, não é necessário nome_usuário
	id_idoso integer primary key auto_increment,
	nome_idoso varchar(100) not null,
    nome_usuario varchar(15) not null,
	dt_nasc date, -- Realmente Necessário?
	sexo char(1), -- Faz sentido
	cpf char(11) unique not null, -- Para permitir apenas um cpf por idoso e esse valor não pode ser nulo
    observacoes text,
    senha varchar(20) not null,
    
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
    -- unidade de medida (Para comprimidos)
    dt_hora datetime,
    status_tomado boolean default false, -- false = pendente, true = confirmado
    
    id_idoso integer not null,
    foreign key(id_idoso) references idoso(id_idoso)
    
);
# TABELA LEMBRETE
create table lembrete(

	id_lembrete integer primary key auto_increment,
    descricao varchar (100),
    dt_hora datetime, -- feito
    endereco varchar(100),
    
    id_responsavel integer not null,
    foreign key(id_responsavel) references responsavel(id_responsavel),
    id_idoso integer not null,
    foreign key(id_idoso) references idoso(id_idoso)

);

# TABELA ANOTAÇÕES
create table anotacoes(
	
    id_anotacoes integer primary key auto_increment,
    descricao text,
    
    id_idoso integer not null,
    foreign key(id_idoso) references idoso(id_idoso)
);

# TABELA NOTICAÇÃO
create table notificacao(

	id_notificacao integer primary key auto_increment,
    titulo varchar(50) not null,
    mensagem text not null,
    dt_envio datetime not null,
    
    id_idoso integer not null,
    foreign key(id_idoso) references idoso(id_idoso),
    
    id_responsavel integer not null,
    foreign key(id_responsavel) references responsavel(id_responsavel)
);