use ecommerce;


-- Quais tabelas você possui?

show tables ;

-- pesquisas simples com select:

-- selecionando todas as colunas de clients
SELECT * FROM clients;

-- selecionando e contatenando as colunas, Fname e Lname, incluindo o CPF
SELECT concat(Fname,' ',Lname),CPF from clients;


-- Quais produtos estão com estoque abaixo de 20? 

 SELECT Pname ,quantity FROM product
INNER JOIN productStorage on idProduct = idProdStorage 
WHERE quantity <  20;

-- Quantos pedidos foram feitos por cada cliente?
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by idClient; 
 





s