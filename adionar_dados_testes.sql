use amaidoso; -- usando o bd

# ADICIONANDO DADOS PARA TESTES
    
# INSERINDO DADOS NA TABELA RESPONSAVEL
insert into responsavel(nome_responsavel, email, senha)
values
	('davi brito', 'davicuidador26@gmail.com', '$Davi_lindão'),
	('ronaldo cobresal', 'ronaldocobre@gmail.com', 'ronald.90##'),
	('marcelo gourmet','marcelo67gourmet@gmail.com', 'm.gourmet67');

# INSERINDO DADOS NA TABELA IDOSO
insert into idoso(nome_idoso, cpf, senha, data_nascimento, id_responsavel)
values
	('jose fagundes de jesus','51500986524','feijãoComfarinha','1940-12-20',1),
	('otavio neto moura','51404076524','loiradaU$P','1955-09-01',1),
	('claudio ferrugem','51520386524','folhasSilva1','1964-10-05',2);

# INSERINDO DADOS NA TABELA MEDICAMENTO
insert into medicacao(nome_medicamento, valor_dose, unidade_medida, data_hora, status_tomado,id_idoso)
values
	('dipirona', '33', 'gotas','2026-04-25 21:35:00', false, 1),
	('dipirona', '29', 'gotas','2026-03-01 22:50:00', true, 2),
	('laxante', '3', 'colher','2026-02-22 19:50:00', false, 3),
	('dipirona', '1', 'comprimido','2026-01-21 19:50:00', false, 1),
	('dipirona', '1', 'mg','2026-02-20 18:00:00', true, 2);