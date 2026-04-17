# CRIAÇÃO DO BANCO DE DADOS
create database amaidoso; -- criando o bd
use amaidoso; -- usando o bd

#CRIAÇÃO DAS TABELAS

# TABELA RESPONSÁVEL
create table responsavel(

	id_responsavel integer primary key auto_increment,
    nome_responsavel varchar(100) not null,
    
    -- LOGIN E IDENTIFICAÇÃO
	email varchar(200) unique not null,
    senha varchar(16) not null
);

# TABELA IDOSO
create table idoso(

    id_idoso integer primary key auto_increment,
    nome_idoso varchar(100) not null, -- armazena o nome completo do idoso
    
    -- LOGIN E IDENTIFICAÇÃO
	cpf varchar(11) unique not null, -- para não existir nenhum usuário idoso com mesmo cpf
    senha varchar(16) not null, -- senha de login
    
    -- DADOS PESSOAIS
    data_nascimento date not null, -- armazena a data de nascimento

    -- RELACIONAMENTO
    id_responsavel integer not null,
    foreign key(id_responsavel) references responsavel(id_responsavel)
    on delete cascade -- Se o responsável sair, apaga o idoso
);

# TABELA MEDICAÇÃO
create table medicacao(

	id_medicacao integer primary key auto_increment,
    nome_medicamento varchar(80) not null,
    
    -- INFORMAÇÃO DA MEDICAÇÃO
    valor_dose decimal(10,2) not null, -- o valor da dose é como o 100 de 100mg ou o 20 de 20 gotas
    unidade_medida enum('mg','ml','gotas','colher','comprimido') not null, -- o enum cria uma lista para que nenhum valor fora do permitido seja registrado nessa coluna
    data_hora datetime not null,
    status_tomado boolean default false, -- status para saber se o idoso tomou a medicação. sendo o valor falso como padrão
    
    id_idoso integer not null,
    foreign key(id_idoso) references idoso(id_idoso)
    on delete cascade -- Quando o registro do idoso for excluido apaga o esse registro também
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