
CREATE TABLE Fornecedor (
id_Pornecedor int auto_increment primary key PRIMARY KEY,
razao_social varchar(100) not null
)

CREATE TABLE Produto (
id_Produto int auto_increment primary key PRIMARY KEY,
nome_produto varchar(100) not null
)

CREATE TABLE item_Produto (
id_Produto int ,
id_fornecedor int ,
quantidade no null,
observacao text(300),
id_item int auto_crement primary key,
FOREIGN KEY(id_Produto) REFERENCES Produto (id_Produto)

