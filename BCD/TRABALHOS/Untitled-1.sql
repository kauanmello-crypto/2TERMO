-- Active: 1788267989775@@127.0.0.1@3306@banco_dados
CREATE DATABASE smartcoffee_kauan

use smartcoffee_kauan

CREATE TABLE Delivery (
ID_Delivery int primary key auto_increment PRIMARY KEY,
endereco_entrega varchar(30),
taxa_entrega varchar(30),
status_entrega varchar(37) not null,
data_hora_saida varchar(30)
)

CREATE TABLE Funcionarios (
ID_Funcionarios int primary key auto_increment PRIMARY KEY,
nome varchar(37) not null,
CPF varchar(11) not null,
cargo int not null,
Salario int not null,
data_admissao varchar(30) not null
)

CREATE TABLE Produtos (
ID_Produtos int primary key auto_increment PRIMARY KEY,
nome int not null,
descrisao date not null,
preco_unitario varchar(20),
categoria varchar(50)
)

CREATE TABLE Clientes (
    ID_Clientes INT AUTO_INCREMENT PRIMARY KEY,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    Nome VARCHAR(37) NOT NULL,
    Telefone VARCHAR(20),
    email VARCHAR(35),
    Data_cadastro DATETIME
);

CREATE TABLE prog_fedelidade (
    ID_Programa_Fedelidade INT AUTO_INCREMENT PRIMARY KEY,
    saldo_pontos INT,
    desconto DECIMAL(10, 2),
    data_ultima_atualizacao DATETIME,
    nivel_de_fedelidade INT
);



CREATE TABLE Pedidos (
    ID_Pedidos INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    status VARCHAR(30),
    tipo_pedido VARCHAR(50),
    valor_total DECIMAL(10, 2),
    ID_Delivery INT,
    FOREIGN KEY (ID_Delivery) REFERENCES Delivery (ID_Delivery)
);

CREATE TABLE Pagamentos (
    ID_Pagamentos INT AUTO_INCREMENT PRIMARY KEY,
    forma_de_pagamento VARCHAR(30),
    Parcelas INT,
    Valor_pago DECIMAL(10, 2),
    Quem_Pagou VARCHAR(37)
);

CREATE TABLE estoque (
ID_insumo int primary key auto_increment PRIMARY KEY,
Validade datetime,
quantidade_minima varchar(50),
unidade_medida int,
Quantidade_atual int,
nome_insumo varchar(50)
);

CREATE TABLE entrega (
ID_Delivery int ,
ID_Funcionarios int ,
FOREIGN KEY(ID_Delivery) REFERENCES Delivery (ID_Delivery),
FOREIGN KEY(ID_Funcionarios) REFERENCES Funcionarios (ID_Funcionarios)
);

CREATE TABLE consome (
ID_Produtos int ,
ID_insumo int ,
FOREIGN KEY(ID_Produtos) REFERENCES Produtos (ID_Produtos)
);

CREATE TABLE realiza (
    ID_Pedidos INT,
    ID_Pagamentos INT,
    ID_Clientes INT,
    ID_Programa_Fedelidade INT,
    PRIMARY KEY (ID_Pedidos, ID_Pagamentos, ID_Clientes),
    FOREIGN KEY (ID_Pedidos) REFERENCES Pedidos (ID_Pedidos),
    FOREIGN KEY (ID_Pagamentos) REFERENCES Pagamentos (ID_Pagamentos),
    FOREIGN KEY (ID_Clientes) REFERENCES Clientes (ID_Clientes),
    FOREIGN KEY (ID_Programa_Fedelidade) REFERENCES prog_fedelidade (ID_Programa_Fedelidade)
);

CREATE TABLE atende (
ID_Funcionarios int,
ID_Pedidos int,
ID_Pagamentos int,
FOREIGN KEY (ID_Funcionarios) REFERENCES Funcionarios (ID_Funcionarios),
FOREIGN KEY (ID_Pedidos) REFERENCES Pedidos (ID_Pedidos),
FOREIGN KEY (ID_Pagamentos) REFERENCES Pagamentos (ID_Pagamentos)
);

CREATE TABLE contem (
ID_Produtos int,
ID_Pedidos int,
ID_Pagamentos int,
FOREIGN KEY (ID_Produtos) REFERENCES Produtos (ID_Produtos),
FOREIGN KEY (ID_Pedidos) REFERENCES Pedidos (ID_Pedidos),
FOREIGN KEY (ID_Pagamentos) REFERENCES Pagamentos (ID_Pagamentos)
);
