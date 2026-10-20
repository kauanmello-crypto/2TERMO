CREATE DATABASE Revisao_de_veiculos;
USE Revisao_de_veiculos;

create table clientes (
id_clientes INT auto_increment primary key,
telefone_cliente varchar(20) ,
endereco_clientes varchar(60) NOT NULL,
CPF_clientes varchar(16) NOT NULL,
nome_cliente VARCHAR(36) NOT NULL,
servicos_clientes varchar(100) 
);

create table veiculos (
id_veiculos INT auto_increment primary key,
cor_veiculo varchar(100) ,
nome_veiculo varchar(50) ,
ano_veiculo datetime NOT NULL,
tipo_veiculo VARCHAR(50) ,
marca_veiculo varchar(50) 
);

create table marcas (
id_marcas INT auto_increment primary key,
frequencia_marca varchar(30) ,
nome_marca varchar(40) NOT NULL,
marca_moto varchar(30) NOT NULL,
nome VARCHAR(37) NOT NULL,
marcas_carros varchar(30) NOT NULL
);

create table fornecedores (
id_fornecedores INT auto_increment primary key,
loja_hidraulica varchar(100) NOT NULL,
loja_pneus varchar(100) ,
loja_motores varchar(100),
loja_pecas varchar(100),
loja_ferramentais varchar(100) 
);

create table funcionarios (
id_funcionarios INT auto_increment primary key,
cargo_funcionarios varchar(10) NOT null,
nome_funcionarios varchar(36) NOT NULL,
turno_funcionarios varchar(10),
saidas_funcionarios datetime,
salario_funcionarios decimal
);


create table pecas (
id_pecas INT auto_increment primary key,
pecas_novas varchar(60) ,
pecas_usadas varchar(40) ,
pecas_quebradas varchar(30),
pecas_retificas VARCHAR(30) ,
pecas_2mao varchar(40)
);

create table nome_modelos (
id_modelos INT auto_increment primary key,
nome_modelo varchar(10) NOT NULL,
tamanho_modelo varchar(60) ,
ano_modelo datetime ,
cor_modelo VARCHAR(50) ,
fabricante_modelo varchar(60)
);

create table ordens_de_servicos (
id_ordens_de_servicos INT auto_increment primary key,
data_servicos datetime ,
mao_de_obra varchar(60) ,
horario_entrega datetime,
informacoes_servicos VARCHAR(60) ,
valor_apagar decimal
);

create table formas_pagamento (
id_pagamentos INT auto_increment primary key,
credito decimal NOT NULL ,
cheque decimal NOT NULL,
debito decimal NOT NULL,
dinheiro decimal NOT NULL,
pix decimal NOT NULL
);	

create table tipos_servicos (
id_servicos INT auto_increment primary key,
troca_oleos varchar(50) ,
pecas_servicos varchar(30) ,
trocas_bombas varchar(50),
revisao_servicos VARCHAR(30)
)