-- Active: 1788267989775@@127.0.0.1@3306@smartcoffee_dml_kauan
-- REVISAO DEDML - AULA 08

-- REVISAO DE INSERTS

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES 

('Kauan R', 'kauan@email.com', '19999999901', 'Limeira', TRUE),
('Laura C', 'laurac@email.com', '19999999902', 'Limeira', TRUE),
('Laura N', 'lauran@email.com', '19999999903', 'Limeira', TRUE),
('Laura R', 'laurar@email.com', '19999999904', 'Limeira', TRUE),
('Leornado B', 'leornadob@email.com', '19999999905', 'Limeira', TRUE),
('Leornado BT', 'leornadobt@email.com', '19999999906', 'Americana', TRUE),
('Lidia M', 'lidia@email.com', '19999999907', 'Belem', TRUE),
('Livia V', 'livia@email.com', NULL, 'lIMEIRA', TRUE ),
('Marcos V', 'marcos@email.com', '19999999908', 'Campo Mourao', TRUE),
('Nicolas N', 'nicolasn@email.com', '19999999909', 'Campo Mourao', FALSE),
('Nicolas f', 'nicolasf@email.com', '19999999910', 'Campinas', FALSE),
('Pablo H', 'pablo@email.com', '19999999911', 'Indaiatuba', FALSE),
('Shofie A', 'shofie@email.com', '19999999912', 'Campinas', FALSE),
('Vinicius H', 'vinicius@email.com', NULL, 'lIMEIRA', FALSE),
('Vitoria S', 'vitoria@email.com', '19999999913' , 'lIMEIRA', FALSE),
('Virginia S', 'virginia@email.com', NULL, 'Boston', FALSE);



INSERT INTO categoria  (nome_categoria) VALUES
('combo Especiais'), ('Nutella');


INSERT INTO pedido (data_pedido,status_pedido,valor_total,cliente_id) VALUES
(NOW(), 'Aberto', 0.00,43);

INSERT INTO PEDIDO (data_pedido,status_pedido,valor_total,cliente_id) VALUES
(NOW(), 'Aberto',0.00,43);

SET @pedido = LAST_INSERT_ID();

SELECT @pedido;

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido, 4, 2, 13.00, 'Nutella');




-- CONSULTAR PARA  OS DADOS NO BC
SELECT * FROM item_pedido;

SELECT * FROM cliente
where id_cliente = 43;

------------------------------------------------------------------------------------------------------

-- ATUALIZAR DADOS NO BC

UPDATE cliente
SET TELEFONE = '19999999901'
WHERE ID_CLIENTE = 23;

UPDATE cliente 
SET telefone = '19999999901',
    cidade = 'piracicaba',
    ativo = FALSE 
WHERE id_cliente = 18;  

------- TOMAR MUITO CUIDADO ---- NAO ESQUECER ----- DE COLOCAR O WHERE 
UPDATE cliente
SET ativo = FALSE;

UPDATE pedido
SET valor_total = 1.00;

--------------------------------------------------------------------------------------------------
-- DICAS DE OURO 
-- EXECUTAR O SELECT SEMPRE ANTES DE ATUALIZAR
-- SELECT * FROM TABELA_QUE_DESAJO;
--------------------------------------------------------------------------

-- CONDICIONAIS

UPDATE produto
SET preco = 
CASE 
    WHEN preco < 30 THEN preco * 1.50
    ELSE  preco * 1.25
END
WHERE ativo =  TRUE


UPDATE cliente 
SET telefone = NULL
WHERE id_cliente = 23;  

-- APAGANDO DADOS DO BC 
DELETE FROM cliente
WHERE id_cliente = 45;

-- EXCLUINDO DADOS  DE FORMA LOGICA
UPDATE cliente
SET ativo = FALSE 
WHERE id_cliente

--------------------------------------------------------------------

-- CADASTRANDO UM PROCEDIMENTO DE COMPRA
-- PASSO 1: ADICIONANDO UM NOVO CLIENTE
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Bruno M', 'Brunom@email.com', '19999999999', 'Piracicaba', TRUE);

SET @cliente = LAST_INSERT_ID();

-- PASSO 2: ADICIONANDO UM NOVO PEDIDO
INSERT INTO PEDIDO (data_pedido,status_pedido,valor_total,cliente_id) VALUES
(NOW(),'ABERTO',0.00,@cliente);
SET @pedido = LAST_INSERT_ID();

-- PASSO 3: ADICIONANDO ITENS AO PEDIDO
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido, 4, 2, 13.00, 'mel'),
(@pedido, 5, 1, 15.00,'');

-- PASSO 4: ATUALIZANDO O VALOR TOTAL DO PEDIDO
UPDATE pedido
SET valor_total = 22.00,
    status_pedido = 'preparando'
WHERE id_pedido = @pedido;

-- PASSO 5: REGISTRANDO PAGAMENTOS 
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido, 2, 22.00, NOW());

-- CONSULTAR DE FORMA COMPLETA
SELECT p.id_pedido,
       c.nome AS cliente,
       p.status_pedido,
       p.valor_total
FROM pedido p 
JOIN cliente c ON c.id_cliente  = p.cliente_id
WHERE p.id_pedido = @pedido;

SELECT * from cliente