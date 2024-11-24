-- Tabela Fornecedor
create database e_commerce;
drop database e_commerce;
use e_commerce;
 show databases;
 
 show tables;
 
 insert into Fornecedor(idFornecedor,razaoSocial,CNPJ) 
				values	('2','Nando_racing','11223344556677'),
						('1','speed_motos','77665544332211');
  
   alter table Fornecedor drop CNPJ;
   alter table Fornecedor add CNPJ char(14);
   
CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY,
    razaoSocial VARCHAR(45),
    CNPJ char(14)
);

insert into Produto (categoria,valor,descricao)
			values  ('eletronico','1000','celular'),
					('movel','300','sofa');
-- Tabela Produto
CREATE TABLE Produto (
    idProduto INT auto_increment PRIMARY KEY,
    categoria VARCHAR(45),
    valor VARCHAR(45),
    descricao VARCHAR(45)
);


insert into Estoque(local,quantidade)
		values    ('zona_1','15'),
				  ('zona_2','10');
                  
-- Tabela Estoque
CREATE TABLE Estoque (
    idEstoque INT auto_increment PRIMARY KEY,
    local VARCHAR(45),
    quantidade INT,
    idProduto INT,
    constraint fk_idProduto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);
insert into Cliente(idCliente,nome,endereco,CNPJ,CPF)
			values ('12','antonio','rua A',null,'01218317116'),
					('13','jose','rua B','18642891461239',null);

-- Tabela Cliente
alter table Cliente auto_increment= 1;
drop table Cliente;
 
CREATE TABLE Cliente (
    idCliente INT  PRIMARY KEY,
    nome VARCHAR(45),
    endereco VARCHAR(45),
    CNPJ CHAR(14),
    CPF CHAR(11)
);

insert into Cliente_PJ(idCliente_PJ,razaoSocial)
				values('15','vardeco');

-- Tabela Cliente_PJ
CREATE TABLE Cliente_PJ (
    idCliente_PJ INT PRIMARY KEY,
    idCliente INT,
    razaoSocial VARCHAR(45),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
	
);

insert into Cliente_PF(idCliente_PF)
                      values('19');

-- Tabela Cliente_PF
CREATE TABLE Cliente_PF (
    idCliente_PF INT PRIMARY KEY,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);


insert into Pedido(statusPedido,dataPedido,frete)
			values('s')


-- Tabela Pedido
CREATE TABLE Pedido (
    idPedido INT auto_increment PRIMARY KEY,
    statusPedido VARCHAR(45),
    dataPedido DATE,
    frete FLOAT,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Entrega
CREATE TABLE Entrega (
    idEntrega INT auto_increment PRIMARY KEY,
    codigoRastreamento VARCHAR(45),
    dataSaidaProduto DATE,
    dataEntrega DATE,
    idPedido INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

-- Tabela FormaPagamento
CREATE TABLE FormaPagamento (
    idFormaPagamento INT auto_increment PRIMARY KEY,
    formaPagamento VARCHAR(45),
    parcelas INT,
    valorParcela DECIMAL(10,2),
    idPedido INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

-- Tabela Cartao
CREATE TABLE Cartao (
    idCartao INT auto_increment PRIMARY KEY,
    nomeEscritoNoCartao VARCHAR(45),
    numeroCartao VARCHAR(45),
    dataValidade VARCHAR(5),
    valor DECIMAL(10,2),
    idFormaPagamento INT,
    FOREIGN KEY (idFormaPagamento) REFERENCES FormaPagamento(idFormaPagamento)
);

-- Tabela Pix
CREATE TABLE Pix (
    idPix INT auto_increment PRIMARY KEY,
    dataHoraTransferencia VARCHAR(45),
    valor DECIMAL(10,2),
    idFormaPagamento INT,
    FOREIGN KEY (idFormaPagamento) REFERENCES FormaPagamento(idFormaPagamento)
);

-- Tabela Produto_has_Estoque
CREATE TABLE Produto_has_Estoque (
    idProduto INT,
    idEstoque INT,
    PRIMARY KEY (idProduto, idEstoque),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque)
);

-- Tabela Pedido_has_Produto
CREATE TABLE Pedido_has_Produto (
    idPedido INT,
    idProduto INT,
    quantidade INT,
    PRIMARY KEY (idPedido, idProduto),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) 
);

show tables;
select Cliente;       s
