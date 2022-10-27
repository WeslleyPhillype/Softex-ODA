CREATE TABLE Empresa 
( 
 Data_venda DATE,
 total_vendas BIGINT
); 

CREATE TABLE Vendas 
(     
 idproduto INT,
 quant_vendida INT,  
 data_venda DATE,
 Id_venda INT GENERATED ALWAYS AS IDENTITY,
 PRIMARY KEY(Id_venda)
); 

CREATE TABLE produto 
( 
 Nome character varying,
 preço float,
 ID_Produto INT GENERATED ALWAYS AS IDENTITY,
 PRIMARY KEY(ID_Produto)
); 

ALTER TABLE Vendas ADD FOREIGN KEY(idproduto) REFERENCES produto (ID_Produto)ON DELETE CASCADE ON UPDATE CASCADE;

-- Procedure para cadastras produtos
CREATE PROCEDURE cadastro_produto(Nome character varying,preço float)
LANGUAGE 'plpgsql'
AS $$
BEGIN
INSERT INTO produto VALUES(Nome,preço);
COMMIT;
END;
$$;
-- Procedure para cadastras vendas
CREATE PROCEDURE cadastro_vendas(idproduto INT,quant_vendida INT,data_venda DATE)
LANGUAGE 'plpgsql'
AS $$
BEGIN
INSERT INTO Vendas VALUES(idproduto,quant_vendida,data_venda);
COMMIT;
END;
$$;
-- Procedure para criar um relatório que faça um levantamento diário da 
-- quantidade de produtos comprados no dia
CREATE PROCEDURE Total_vendas()
LANGUAGE 'plpgsql'
AS $$
BEGIN
DELETE FROM Empresa;
INSERT INTO Empresa SELECT v.data_venda AS Dia, sum (v.quant_vendida) as temp_sum from Vendas v
GROUP BY v.data_venda;
COMMIT;
END;
$$;

CALL cadastro_produto('TV LCD',2500.00);
CALL cadastro_produto('Iphone 13',13000.00);
CALL cadastro_produto('Smartphone GalaxyA5',1425.00);
CALL cadastro_produto('Ventilador Arno',425.00);
CALL cadastro_produto('Notebook Dell Inspiron',3500.00);

CALL cadastro_vendas(2,10,'2022-10-15');
CALL cadastro_vendas(5,8,'2022-10-15');
CALL cadastro_vendas(4,14,'2022-10-15');
CALL cadastro_vendas(1,2,'2022-10-15');
CALL cadastro_vendas(3,1,'2022-10-15');
CALL cadastro_vendas(3,1,'2022-10-16');
CALL cadastro_vendas(4,8,'2022-10-16');
CALL cadastro_vendas(2,11,'2022-10-16');

CALL Total_vendas();

-- drop schema public cascade;
-- create schema public;
