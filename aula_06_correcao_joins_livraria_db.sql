
INSERT INTO editoras (id, nome)
VALUES
('1', 'Mirandela Editora'),
('2', 'Editora Via-Norte'),
('3', 'Editora Ilhas Tijucas'),
('4', 'Maria Jose Editora');

INSERT INTO assuntos (id, descricao)
VALUES
('B', 'Banco de Dados'),
('P', 'Programação'),
('R', 'Redes'),
('S', 'Sistemas Operacionais');
alter table livros add column preco decimal(12,2) default 0;
INSERT INTO livros (id, titulo, preco, data_lancamento, editora_id, assunto_id)
VALUES
('1', 'Bancos de Dados para a WEB', 31.20, '1999-01-10', '1', 'B'),
('2', 'Programando em Linguagem C', 30.00, '1997-10-01', '1', 'P'),
('3', 'Programando em Linguagem C++', 111.50, '1998-11-01', '3', 'P'),
('4', 'Bancos de Dados na Bioinformática', 48.00, '0000-00-00', '2', 'B'),
('5', 'Redes de Computadores', 42.00, '1996-09-01', '2', 'R');

INSERT INTO autores (id, nome)
VALUES
('1', 'Roberta Del Gato'),
('2', 'Ricardo Yago Brito'),
('3', 'Elaine Lívia Moura'),
('4', 'Carlos Eduardo Lima'),
('5', 'Isabela da Rocha');

insert into autores_livros (autor_id, livro_id)
	values
		(1,1),
        (1,2),
        
        (2,1),
        (2,3),
        (2,4),
        
        (3,4),
        (4,4),
        (5,5),
        (2,5),
        (3,5),
        (4,5);