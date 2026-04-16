use amaidoso; -- usando o bd

# ADICIONANDO DADOS PARA TESTES
    
# INSERINDO DADOS NA TABELA RESPONSAVEL
insert into responsavel(nome_responsavel, nome_usuario, telefone, email, senha)
values
	('davi brito', 'Dr Davi', '(11) 91867-8756', 'davicuidador26@gmail.com', '$Davi_lindão'),
	('ronaldo cobresal', 'Ronaldo', '(11) 99055-8906', 'ronaldocobre@gmail.com', 'ronald.90##'),
	('marcelo gourmet', 'gourmeti', '(67) 96782-2376', 'marcelo67gourmet@gmail.com', 'm.gourmet67');

# INSERINDO DADOS NA TABELA IDOSO
insert into idoso(nome_idoso, nome_usuario, dt_nasc, sexo, cpf, observacoes, senha, id_responsavel)
values
	('jose','jose the big','1990-12-20', 'm','51500986524','é um velho muito chato','101010',1),
	('arnalda','galao de agua','1950-09-23', 'f','51556398323','é uma velha legal','baile2001',1);

# INSERINDO DADOS NA TABELA MEDICAMENTO
insert into medicacao(nome_medicamento, dosagem, horario, id_idoso)
values
	('dipirona', '10ml', '2026-03-24 20:20:00',1);