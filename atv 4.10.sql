CREATE TABLE cliente 
( 
 CPF BIGINT NOT NULL,
 Nome varchar(20),
 Sobrenome varchar(200),
 Telefone varchar(13),
 Dia_Cadastro Date,
 PRIMARY KEY(CPF)
);

-- Procedure para cadastras clientes
CREATE PROCEDURE cadastro_cliente(CPF BIGINT,Nome varchar(20),
Sobrenome varchar(20),Telefone varchar(13))
LANGUAGE 'plpgsql'
AS $$
BEGIN
INSERT INTO cliente VALUES(cpf,nome,sobrenome,telefone,NOW());
COMMIT;
END;
$$;

CREATE OR REPLACE FUNCTION contar_cliente(Dia DATE)
RETURNS INT AS $$
DECLARE 
 numero int = 0;
BEGIN
 numero =  COUNT(Dia_Cadastro) FROM cliente WHERE Dia_Cadastro = Dia::date;
 RETURN numero;

END;
$$LANGUAGE 'plpgsql';


CALL cadastro_cliente(08466635441,'Carlos','Silva Diniz','(81)3333-6584');
CALL cadastro_cliente(18765498234,'João','Ferreira Gusmão','(83)5698-4521');
CALL cadastro_cliente(12398745632,'Ana','Silva Araújo','(23)4569-8741');
CALL cadastro_cliente(36974112385,'Rita','Souza','(21)7896-5412');
CALL cadastro_cliente(75395145632,'Thiago','Fernadez','(81)4569-8741');


SELECT contar_cliente('2022-10-12') AS total_clientes

-- drop schema public cascade;
-- create schema public;
