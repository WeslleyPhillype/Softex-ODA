create database livraria;
use livraria;

create table livro (
	idLivro smallint auto_increment not null primary key,
    titulo varchar(255) not null,
    subTitulo varchar(255) not null,
    autor varchar(255) not null,
    genero varchar(255) not null,
    ano date not null
);

insert into livro (titulo, subTitulo, autor, genero, ano) values
	('Star Wars', 'Livro dos Sith', 'Daniel Wallace', 'Ficção científica, Literatura fantástica, Ópera espacial', '2012-02-10'),
    ('O Caminho Jedi', 'Um Manual para Estudantes da Força', 'Daniel Wallace', 'Ficção científical, Literatura fantástica, Ópera espacial', '2011-09-07'),
    ('O Senhor dos Anéis', 'A Sociedade do Anel', 'J. R. R. Tolkien', 'Literatura Fantástica, Obra de referência', '1954-07-29'),
    ('O Senhor dos Anéis', 'As Duas Torres', 'J. R. R. Tolkien', 'Literatura Fantástica, Obra de referência', '1954-11-11'),
    ('O Senhor dos Anéis', 'O Retorno do Rei', 'J. R. R. Tolkien', 'Literatura Fantástica, Obra de referência', '1955-10-20');