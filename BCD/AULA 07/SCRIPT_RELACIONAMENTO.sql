CREATE DATABASE CASTELLO_RELACIONAMENTOS;
USE CASTELLO_RELACIONAMENTOS;

CREATE TABLE PRODUTOS (
    ID_PRODUTO INT AUTO_INCREMENT PRIMARY KEY,
    NOME_PRODUTO VARCHAR(100) NOT NULL
);





CREATE TABLE ESTOQUE (
    ID_ESTOQUE INT AUTO_INCREMENT PRIMARY KEY,
    ID_PRODUTO INT NOT NULL UNIQUE,
    QUANTIDADE INT NOT NULL,
    FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTOS(ID_PRODUTO)
);

CREATE TABLE CLIENTES (
    ID_CLIENTE INT AUTO_INCREMENT PRIMARY KEY,
    NOME_CLIENTE VARCHAR(60) NOT NULL
);;

CREATE TABLE PEDIDOS (
    ID_PEDIDO INT AUTO_INCREMENT PRIMARY KEY,
    DATA_PEDIDO DATETIME NOT NULL,
    ID_CLIENTE INT NOT NULL,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES (ID_CLIENTE)
);



CREATE TABLE FORNECEDORES (
    ID_FORNECEDOR INT AUTO_INCREMENT PRIMARY KEY,
    NOME_FORNECEDOR VARCHAR(60) NOT NULL
);



CREATE TABLE FORNECEDOR_PRODUTO (
    ID_FORNECEDOR INT NOT NULL,
    ID_PRODUTO INT NOT NULL,
    PRIMARY KEY (ID_FORNECEDOR, ID_PRODUTO),
    FOREIGN KEY (ID_FORNECEDOR) REFERENCES FORNECEDORES(ID_FORNECEDOR),
    FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTOS(ID_PRODUTO)
);

SELECT * FROM PRODUTOS;

INSERT INTO PRODUTOS (NOME_PRODUTO) VALUES ('camiseta');
INSERT INTO PRODUTOS (NOME_PRODUTO) VALUES ('blusa');

-- Desafios cardionalidades
-- Questao 1 Uma categoria pode possuir vários produtos. Cada produto pertence a apenas uma categoria.


-- CATEGORIA -- PERTENCE -- PRODUTO
    1,N                   1,N

-- 2. Um funcionário pode registrar vários pedidos. Cada pedido é registrado por um funcionário.

FUNCIONARIO -- REGISTRA -- PEDIDOS 
    1,N                      1,1

-- 3. Um fornecedor comercializa vários produtos, e o mesmo produto pode ser comprado de vários fornecedores.
-- FORNECEDOR -- COMERCIALIZA -- PRODUTOS
    1,N                         1,N

-- 4. Uma mesa pode existir sem nenhuma reserva futura. Uma reserva deve estar vinculada a uma mesa.
-- MESA -- RESERVA -- CLIENTE 
    O,N                  1,1

-- 5. Um pedido possui vários itens. Um item de pedido pertence a um único pedido.
-- PEDIDOS -- POSSUI -- ITENS
    1,N                   1,1