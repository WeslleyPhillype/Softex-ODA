CREATE TABLE Locatário
(
CPF SERIAL PRIMARY KEY NOT NULL,
Nome varchar(100),
Email varchar(150),
Endereço varchar(200),
Telefone varchar(13)
);

CREATE TABLE Livro 
(
    ID_Livro INT GENERATED ALWAYS AS IDENTITY,
    Nome varchar(200),
    Editora varchar(100),
    ISBN bigint,
	PRIMARY KEY (ID_Livro)
);


CREATE TABLE Autor
(
    ID_Autor INTEGER GENERATED ALWAYS AS IDENTITY,
    Nome varchar(30),
    Sobrenome varchar(100),
    Data_Nasc date,
    PRIMARY KEY (ID_Autor)
);

CREATE TABLE Locação
(
	ID_Livro INT PRIMARY KEY,
	CPF SERIAL,
	Data_Locação DATE,
	Data_Devolução DATE
);

CREATE TABLE Autoria
(
	ID_Autor INT ,  
 	ID_Livro INT,
	PRIMARY KEY (ID_Autor,ID_Livro)
);

ALTER TABLE Locação ADD CONSTRAINT fk_LocLivro FOREIGN KEY(ID_Livro) REFERENCES Livro (ID_Livro) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Locação ADD CONSTRAINT fk_LocLoc FOREIGN KEY(CPF) REFERENCES Locatário (CPF) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Autoria ADD CONSTRAINT fk_AutAut FOREIGN KEY(ID_Autor) REFERENCES Autor (ID_Autor) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Autoria ADD CONSTRAINT fk_AutLivro FOREIGN KEY(ID_Livro) REFERENCES Livro (ID_Livro) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO Livro (Nome,Editora,ISBN) VALUES
('Cálculo com Geometria Analítica','Harbra',8529402065),
('Fundamentos de Física - Volume 1 - Mecânica','LTC',8521630352),
('Engenharia de Controle Moderno','Pearson Universidades',8576058103),
('Mecânica Vetorial para Engenheiros: Estática','AMGH',8580550467),
('Fundamentos de Física - Volume 4 - Óptica e Física Moderna','LTC',9788521630388),
('Fundamentos de Física - Eletromagnetismo','LTC',8521613911);

INSERT INTO Autor (Nome,Sobrenome,Data_Nasc) VALUES 
('Katsuhiko', 'Ogata','1925-01-06'),
('Louis', 'Leithold','1924-10-16'),
('Ferdinand','Pierre Beer','1915-08-08'),
('David','Halliday','1916-03-03'),
('Robert','Resnick','1923-01-11'),
('Jearl','Walker','1945-01-20');

INSERT INTO Autoria (ID_Livro,ID_Autor) VALUES
(1,2),(2,4),(2,5),(2,6),(3,1),(4,3),(5,4),(5,5),(5,6),(6,4),(6,5),(6,6);

INSERT INTO Locatário (CPF,Nome,Email,Endereço,Telefone) VALUES 
(0845553244,'João Carlos','Jcarlos@gmail.com','Rua 13 de maio','(81)7825-4489'),
(0845553255,'José Vitor', 'Jvitor@gmail.com','Rua da Saudade','(81)7825-6589'),
(0845553294,'Paulo André','Pandr@gmail.com','Rua do Sol','(81)7825-4495');

INSERT INTO Locação (ID_Livro,CPF,Data_Locação,Data_Devolução)VALUES
(2,0845553244,'2022-10-10','2022-10-22'),
(1,0845553255,'2022-10-01','2022-10-15'),
(5,0845553244,'2022-10-12','2022-10-24'),
(3,0845553255,'2022-10-04','2022-10-18'),
(4,0845553294,'2022-10-04','2022-10-18'),
(6,0845553244,'2022-10-10','2022-10-22');

select * from Locatário
select * from Autor
select * from Livro
select * from Locação
select * from Autoria

SELECT
              loct.CPF AS Locador_CPF,
			  loct.Nome AS Locador,
              liv.Nome AS Livro,
			  liv.ID_Livro AS Livro_ID,
			  loc.Data_Locação,
			  loc.Data_Devolução
             
FROM
              Locatário loct
              INNER JOIN Locação loc ON loc.CPF = loct.CPF
              INNER JOIN Livro liv ON loc.ID_Livro = liv.ID_Livro
			  ORDER BY Locador;

SELECT
              aut.Nome AS Autor,
			  aut.ID_Autor AS Autor_ID,
              liv.Nome AS Livro,
			  liv.ID_Livro AS Livro_ID
             
FROM
              Autor aut
              INNER JOIN Autoria autr ON autr.ID_Autor = aut.ID_Autor
              INNER JOIN Livro liv ON autr.ID_Livro = liv.ID_Livro
			  ORDER BY Autor;
			 
-- drop schema public cascade;
-- create schema public;
