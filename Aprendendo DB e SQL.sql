create table Client
(
    Codigo int identity (1,1) not null, --PrimaryKey

-- Atributos
    Nome varchar (50) not null,
    CPF char (11) not null,
    Telefone char (11),
    Celular char (11),
    Email varchar (40),
    Logradouro varchar (100),
    CEP char (8),
    Cidade varchar (40),
    Estado varchar (30) 

constraint PK_Codigo primary key (Codigo)
) 

create table Fidelidad
(
    Codigo_Cliente int not null, --PrimaryKey

--Atributos
    Data_Adesao datetime not null,
    Pontos int not null, 

constraint PK_Codigo_Cliente primary key (Codigo_Cliente),
constraint FK_Codigo_Cliente foreign key (Codigo_Cliente) references Cliente(Codigo),
)

CREATE TABLE Forma_Pagamento
(
	Codigo INT IDENTITY (1,1) NOT NULL,
	Nome VARCHAR(25),
	Tipo VARCHAR(25),
	CONSTRAINT PK_CodigoPagamento PRIMARY KEY (Codigo)
)


CREATE TABLE Marca
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(20),
	Empresa VARCHAR(30),
	CONSTRAINT PK_CodigoMarca PRIMARY KEY (Codigo)
)


CREATE TABLE Produto
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(30),
	Descricao VARCHAR(MAX),
	Codigo_Marca INT NOT NULL,
	CONSTRAINT PK_CodigoProduto PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoMarca FOREIGN KEY (Codigo_Marca) REFERENCES Marca(codigo)
)


CREATE TABLE Pedido_Venda
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Valor DECIMAL(6,2),
	Valor_Imposto DECIMAL(6,2),
	Data DATETIME NOT NULL,
	Codigo_Forma_Pagamento INT NOT NULL,
	Codigo_Cliente INT NOT NULL,
	CONSTRAINT PK_CodigoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoFormaPagamento FOREIGN KEY (Codigo_Forma_Pagamento) REFERENCES Forma_Pagamento(Codigo),	
	CONSTRAINT FK_CodigoCliente FOREIGN KEY (Codigo_Cliente) REFERENCES Cliente(Codigo)
)

CREATE TABLE Item_Pedido_Venda
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Valor_Total DECIMAL(6,2),
	Valor_Imposto DECIMAL(6,2),
	Valor_Unitario DECIMAL(6,2),
	Quantidade int,
	Codigo_Produto INT NOT NULL,
	Codigo_Pedido_Venda INT NOT NULL,
	CONSTRAINT PK_CodigoPedidoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoProdutoVenda FOREIGN KEY (Codigo_Produto) REFERENCES Produto(Codigo),
	CONSTRAINT FK_CodigoVenda FOREIGN KEY (Codigo_Pedido_Venda) REFERENCES Pedido_Venda(Codigo)
)


CREATE TABLE Distribuidor 
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	CNPJ VARCHAR(14) NOT NULL,
	Nome_Fantasia VARCHAR(40) NOT NULL,
	Razao_Social VARCHAR(40) NOT NULL,
	CEP NCHAR(8),
	Logadouro VARCHAR(40),
	Estado CHAR(2),
	Cidade VARCHAR(35),
	CONSTRAINT PK_CodigoDistribuidor PRIMARY KEY (Codigo)
)


CREATE TABLE Pedido_Compra
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Data DATETIME NOT NULL,
	Valor DECIMAL(6,2),
	Entregue BIT,
	Codigo_Distribuidor INT NOT NULL,
	CONSTRAINT PK_CodigoPedido_Venda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoDistribuidor FOREIGN KEY (Codigo_Distribuidor) REFERENCES Distribuidor(Codigo)
)

CREATE TABLE Item_Pedido_Compra
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	ValorTotal DECIMAL(6,2),
	ValorUnitario DECIMAL(6,2),
	Quantidade int,
	Codigo_Produto INT NOT NULL,
	Codigo_Pedido_Compra INT NOT NULL,
	CONSTRAINT PK_CodigoItemPedidoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoProdutoCompra FOREIGN KEY (Codigo_Produto) REFERENCES Produto(Codigo),
	CONSTRAINT FK_CodigoPedidoCompraItem FOREIGN KEY (Codigo_Pedido_Compra) REFERENCES Pedido_Compra(Codigo),
)


Commit








-- Alteração de Tabela 

alter table Fidelidade
add Data_Nascimento datetime

alter table Fidelidade
drop column Data_Nascimento


-- Visualização de Tabela

select * from Cliente

--//

-- Alterações de Tabela --

--alter table -- Seleciona a tabela a ser alterada
--add + tipo -- Adiciona uma coluna em tabela ja existente
--drop column -- Exclui uma coluna de uma tabela
--alter column + datatype -- Altera o conteúdo em uma coluna existente
--drop table -- Deleta toda uma tabela 

--//

-- DROP TABLE
--ROLLBACK

