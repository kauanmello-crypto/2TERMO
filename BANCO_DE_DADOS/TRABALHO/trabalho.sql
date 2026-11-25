-- Active: 1794920623279@@127.0.0.1@3308@trabalho_oficina_mecanica_kauan
DROP DATABASE IF EXISTS TRABALHO_OFICINA_MECANICA_kauan;
CREATE DATABASE IF NOT EXISTS TRABALHO_OFICINA_MECANICA_kauan;

USE TRABALHO_OFICINA_MECANICA_kauan;

-- DDL
CREATE TABLE clientes (
    id_cliente  INT PRIMARY KEY,
    nome        VARCHAR(100) NOT NULL,
    telefone    VARCHAR(15)  NOT NULL,
    email       VARCHAR(100) NOT NULL UNIQUE,
    endereco    VARCHAR(100) NOT NULL
);


CREATE TABLE fornecedor (
    id_fornecedor INT PRIMARY KEY,
    nome          VARCHAR(100),
    cnpj          VARCHAR(18) NOT NULL,
    telefone      VARCHAR(20) NOT NULL
);

CREATE TABLE veiculos (
    id_veiculo  INT PRIMARY KEY,
    placa       VARCHAR(10) NOT NULL UNIQUE,
    marca       VARCHAR(50),
    modelo      VARCHAR(60) NOT NULL,
    ano         DATE NOT NULL,
    id_cliente  INT,
    CONSTRAINT fk_veiculos_clientes
        FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);
CREATE TABLE pecas (
    id_pecas       INT PRIMARY KEY,
    nome           VARCHAR(50) NOT NULL,
    estoque        INT NOT NULL,
    preco_unitario DECIMAL(10,2),
    id_fornecedor  INT NOT NULL,
    CONSTRAINT fk_pecas_fornecedor
        FOREIGN KEY (id_fornecedor) REFERENCES fornecedor (id_fornecedor)
);


CREATE TABLE servicos (
    id_servicos   INT PRIMARY KEY,
    id_veiculo    INT NOT NULL,
    data_entrada  DATETIME NOT NULL,
    descricao     VARCHAR(500),
    mao_obra      DECIMAL(10,2) NOT NULL,
    status        VARCHAR(20) NOT NULL,
    CONSTRAINT fk_servicos_veiculos
        FOREIGN KEY (id_veiculo) REFERENCES veiculos (id_veiculo)
);


CREATE TABLE pagamentos (
    id_pagamento    INT PRIMARY KEY,
    id_servicos     INT NOT NULL,
    data_pagamento  DATETIME NOT NULL,
    valor           DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(20) NOT NULL,
    CONSTRAINT fk_pagamentos_servicos
        FOREIGN KEY (id_servicos) REFERENCES servicos (id_servicos)
);

CREATE TABLE utiliza (
    id_servicos    INT NOT NULL,
    id_pecas       INT NOT NULL,
    quantidade     DECIMAL(10,2),
    preco_unitario DECIMAL(10,2),
    PRIMARY KEY (id_servicos, id_pecas),
    CONSTRAINT fk_utiliza_servicos
        FOREIGN KEY (id_servicos) REFERENCES servicos (id_servicos),
    CONSTRAINT fk_utiliza_pecas
        FOREIGN KEY (id_pecas) REFERENCES pecas (id_pecas)
);

-- DML

INSERT INTO clientes (id_cliente, nome, telefone, email, endereco) VALUES
(1, 'Carlos Eduardo Silva',  '(19) 99111-1111', 'carlos.silva@email.com',  'Rua das Flores, 120'),
(2, 'Mariana Souza Lima',    '(19) 99222-2222', 'mariana.lima@email.com',  'Av. Brasil, 850'),
(3, 'Joao Pedro Santos',     '(19) 99333-3333', 'joao.santos@email.com',   'Rua Sete de Setembro, 45'),
(4, 'Fernanda Oliveira',     '(19) 99444-4444', 'fernanda.oli@email.com',  'Rua XV de Novembro, 300'),
(5, 'Ricardo Almeida',       '(19) 99555-5555', 'ricardo.almeida@email.com', 'Av. Norte-Sul, 1500'),
(6, 'Aline Cardoso Prado',   '(19) 98666-6666', 'aline.prado@email.com',   'Rua Paraiba, 88'),
(7, 'Gustavo Pereira Lopes', '(19) 98777-7777', 'gustavo.lopes@email.com', 'Av. Amazonas, 430'),
(8, 'Renata Campos Vieira',  '(19) 98888-8888', 'renata.vieira@email.com', 'Rua Ceara, 215'),
(9, 'Felipe Araujo Teixeira','(19) 98999-9999', 'felipe.teixeira@email.com','Rua Pernambuco, 640'),
(10,'Larissa Moreira Duarte','(19) 97111-0000', 'larissa.duarte@email.com', 'Av. Sao Paulo, 1750');


INSERT INTO fornecedor (id_fornecedor, nome, cnpj, telefone) VALUES
(1, 'Auto Pecas Campinas',     '12.345.678/0001-90', '(19) 3234-1000'),
(2, 'Distribuidora Freios SP', '23.456.789/0001-01', '(11) 3456-2000'),
(3, 'Baterias Moura Brasil',   '34.567.890/0001-12', '(19) 3345-3000'),
(4, 'Mecanica Pecas Premium',  '45.111.222/0001-33', '(19) 3111-4000'),
(5, 'Eletro Auto Faiscas',     '56.222.333/0001-44', '(19) 3222-5000'),
(6, 'Rodas e Pneus Campinas',  '67.333.444/0001-55', '(19) 3333-6000'),
(7, 'Lubrificantes Brasil Oil','78.444.555/0001-66', '(11) 3444-7000'),
(8, 'Embreagens Sul',          '89.555.666/0001-77', '(11) 3555-8000'),
(9, 'Escapamentos Sul',        '90.666.777/0001-88', '(19) 3666-9000'),
(10,'Radiadores Cooltech',     '01.777.888/0001-99', '(19) 3777-1000');


INSERT INTO veiculos (id_veiculo, placa, marca, modelo, ano, id_cliente) VALUES
(1, 'ABC1D23', 'Volkswagen', 'Gol 1.0',        '2018-01-01', 1),
(2, 'DEF4G56', 'Fiat',       'Argo Drive',     '2020-01-01', 2),
(3, 'GHI7J89', 'Chevrolet',  'Onix LT',        '2019-01-01', 3),
(4, 'JKL0M12', 'Toyota',     'Corolla XEi',    '2017-01-01', 4),
(5, 'MNO3P45', 'Honda',      'Civic EXL',      '2021-01-01', 5),
(6, 'RST2U34', 'Fiat',       'Mobi Like',      '2020-01-01', 6),
(7, 'VWX5Y67', 'Chevrolet',  'Tracker Premier','2022-01-01', 7),
(8, 'ZAB8C90', 'Volkswagen', 'T-Cross Comfortline','2021-01-01', 8),
(9, 'DEF1G23', 'Hyundai',    'Creta Pulse',    '2023-01-01', 9),
(10,'HIJ4K56', 'Toyota',     'Yaris XL',       '2019-01-01', 10);


INSERT INTO pecas (id_pecas, nome, estoque, preco_unitario, id_fornecedor) VALUES
(1, 'Filtro de oleo',         50,  25.90, 1),
(2, 'Oleo 5W30 1L',          120,  32.50, 1),
(3, 'Pastilha de freio',      40,  89.90, 2),
(4, 'Correia dentada',        15, 120.00, 2),
(5, 'Bateria 60Ah',           10, 420.00, 3),
(6, 'Filtro de ar',           35,  38.00, 1),
(7, 'Vela de ignicao',        80,  18.50, 4),
(8, 'Lampada de farol H7',    60,  29.90, 5),
(9, 'Pneu aro 15',            24, 380.00, 6),
(10,'Oleo sintetico 5W40 1L', 90,  41.00, 7);


INSERT INTO servicos (id_servicos, id_veiculo, data_entrada, descricao, mao_obra, status) VALUES
(1,  1,  '2026-11-03 08:30:00', 'Troca de oleo e filtro de oleo',           80.00,  'Em andamento'),
(2,  2,  '2026-11-05 09:00:00', 'Substituicao das pastilhas de freio',      150.00, 'Aguardando'),
(3,  3,  '2026-11-18 10:15:00', 'Revisao completa',                         300.00, 'Em andamento'),
(4,  4,  '2026-11-10 13:45:00', 'Troca da correia dentada',                 250.00, 'Aguardando'),
(5,  5,  '2026-11-24 15:00:00', 'Troca de bateria',                          60.00, 'Concluido'),
(6,  6,  '2026-11-12 08:00:00', 'Troca do filtro de ar e velas de ignicao',  90.00, 'Em andamento'),
(7,  7,  '2026-11-15 14:20:00', 'Substituicao de lampada do farol',          40.00, 'Concluido'),
(8,  8,  '2026-11-20 09:30:00', 'Troca de pneus e balanceamento',           120.00, 'Concluido'),
(9,  9,  '2026-11-22 11:00:00', 'Troca de oleo sintetico',                   85.00, 'Concluido'),
(10, 10, '2026-11-25 16:10:00', 'Revisao do sistema de ignicao e freios',   220.00, 'Concluido');

INSERT INTO pagamentos (id_pagamento, id_servicos, data_pagamento, valor, forma_pagamento) VALUES
(1, 1, '2026-11-03 11:00:00', 235.90, 'PIX'),
(2, 2, '2026-11-05 12:30:00', 239.90, 'Cartao de credito'),
(3, 4, '2026-11-10 17:00:00', 370.00, 'Dinheiro'),
(4, 3, '2026-11-18 10:30:00', 200.00, 'Cartao de debito');


INSERT INTO utiliza (id_servicos, id_pecas, quantidade, preco_unitario) VALUES
(1, 1, 1.00,  25.90),
(1, 2, 4.00,  32.50),
(2, 3, 1.00,  89.90),
(3, 1, 1.00,  25.90),
(3, 2, 4.00,  32.50),
(3, 6, 1.00,  38.00),
(4, 4, 1.00, 120.00),
(5, 5, 1.00, 420.00);


-- DQL
SELECT id_cliente, nome, telefone, email, endereco
FROM clientes
ORDER BY nome;


SELECT id_cliente, nome, telefone
FROM clientes
WHERE nome LIKE '%Silva%';


SELECT c.id_cliente, c.nome, COUNT(v.id_veiculo) AS qtd_veiculos
FROM clientes c
LEFT JOIN veiculos v ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY qtd_veiculos DESC, c.nome;


SELECT id_fornecedor, nome, cnpj, telefone
FROM fornecedor
ORDER BY nome;


SELECT f.id_fornecedor, f.nome, COUNT(p.id_pecas) AS qtd_pecas
FROM fornecedor f
LEFT JOIN pecas p ON p.id_fornecedor = f.id_fornecedor
GROUP BY f.id_fornecedor, f.nome
ORDER BY qtd_pecas DESC;


SELECT v.id_veiculo, v.placa, v.marca, v.modelo, YEAR(v.ano) AS ano_fabricacao,
       c.nome AS proprietario
FROM veiculos v
LEFT JOIN clientes c ON c.id_cliente = v.id_cliente
ORDER BY v.marca, v.modelo;


SELECT placa, marca, modelo
FROM veiculos
WHERE marca = 'Toyota';


SELECT v.placa, v.modelo, s.id_servicos, s.data_entrada, s.descricao, s.status
FROM veiculos v
JOIN servicos s ON s.id_veiculo = v.id_veiculo
ORDER BY v.placa, s.data_entrada;


SELECT p.id_pecas, p.nome AS peca, p.estoque, p.preco_unitario,
       f.nome AS fornecedor
FROM pecas p
JOIN fornecedor f ON f.id_fornecedor = p.id_fornecedor
ORDER BY p.nome;


SELECT id_pecas, nome, estoque
FROM pecas
WHERE estoque < 20
ORDER BY estoque;

SELECT nome, estoque, preco_unitario,
       (estoque * preco_unitario) AS valor_em_estoque
FROM pecas
ORDER BY valor_em_estoque DESC;


SELECT s.id_servicos, s.data_entrada, s.descricao, s.status, s.mao_obra,
       v.placa, v.modelo, c.nome AS cliente
FROM servicos s
JOIN veiculos v ON v.id_veiculo = s.id_veiculo
LEFT JOIN clientes c ON c.id_cliente = v.id_cliente
ORDER BY s.data_entrada DESC;


SELECT status, COUNT(*) AS qtd_servicos
FROM servicos
GROUP BY status;


SELECT id_servicos, id_veiculo, data_entrada, descricao, status
FROM servicos
WHERE status <> 'Concluido'
ORDER BY data_entrada;


SELECT pg.id_pagamento, pg.data_pagamento, pg.valor, pg.forma_pagamento,
       s.descricao AS servico, c.nome AS cliente
FROM pagamentos pg
JOIN servicos s ON s.id_servicos = pg.id_servicos
JOIN veiculos v ON v.id_veiculo = s.id_veiculo
LEFT JOIN clientes c ON c.id_cliente = v.id_cliente
ORDER BY pg.data_pagamento;


SELECT forma_pagamento, COUNT(*) AS qtd, SUM(valor) AS total_recebido
FROM pagamentos
GROUP BY forma_pagamento
ORDER BY total_recebido DESC;


SELECT s.id_servicos, s.descricao, s.status
FROM servicos s
LEFT JOIN pagamentos pg ON pg.id_servicos = s.id_servicos
WHERE pg.id_pagamento IS NULL;


SELECT s.id_servicos, s.descricao, p.nome AS peca,
       u.quantidade, u.preco_unitario,
       (u.quantidade * u.preco_unitario) AS subtotal
FROM utiliza u
JOIN servicos s ON s.id_servicos = u.id_servicos
JOIN pecas p ON p.id_pecas = u.id_pecas
ORDER BY s.id_servicos, p.nome;

SELECT p.nome AS peca, SUM(u.quantidade) AS total_utilizado
FROM utiliza u
JOIN pecas p ON p.id_pecas = u.id_pecas
GROUP BY p.id_pecas, p.nome
ORDER BY total_utilizado DESC;


SELECT s.id_servicos, s.descricao, s.status,
       s.mao_obra,
       COALESCE(pc.total_pecas, 0)                   AS total_pecas,
       s.mao_obra + COALESCE(pc.total_pecas, 0)      AS total_servico,
       COALESCE(pg.total_pago, 0)                    AS total_pago,
       s.mao_obra + COALESCE(pc.total_pecas, 0)
- COALESCE(pg.total_pago, 0)                AS saldo_devedor
FROM servicos s
LEFT JOIN (
    SELECT id_servicos, SUM(quantidade * preco_unitario) AS total_pecas
    FROM utiliza
    GROUP BY id_servicos
) pc ON pc.id_servicos = s.id_servicos
LEFT JOIN (
    SELECT id_servicos, SUM(valor) AS total_pago
    FROM pagamentos
    GROUP BY id_servicos
) pg ON pg.id_servicos = s.id_servicos
ORDER BY s.id_servicos;


SELECT c.nome, COALESCE(SUM(pg.valor), 0) AS total_pago
FROM clientes c
LEFT JOIN veiculos v ON v.id_cliente = c.id_cliente
LEFT JOIN servicos s ON s.id_veiculo = v.id_veiculo
LEFT JOIN pagamentos pg ON pg.id_servicos = s.id_servicos
GROUP BY c.id_cliente, c.nome
ORDER BY total_pago DESC;


SELECT SUM(valor) AS faturamento_novembro
FROM pagamentos
WHERE data_pagamento >= '2026-11-01'
  AND data_pagamento <  '2026-12-01';


SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT @@autocommit AS autocommit;

START TRANSACTION;

INSERT INTO clientes (id_cliente, nome, telefone, email, endereco)
VALUES (11, 'Patricia Gomes', '(19) 99666-6666', 'patricia.gomes@email.com', 'Rua das Palmeiras, 77');

INSERT INTO veiculos (id_veiculo, placa, marca, modelo, ano, id_cliente)
VALUES (11, 'PQR6S78', 'Hyundai', 'HB20 Comfort', '2022-01-01', 11);

COMMIT;


SELECT c.nome, v.placa, v.modelo
FROM clientes c
JOIN veiculos v ON v.id_cliente = c.id_cliente
WHERE c.id_cliente = 11;


START TRANSACTION;

INSERT INTO fornecedor (id_fornecedor, nome, cnpj, telefone)
VALUES (11, 'Suspensao e Cia', '45.678.901/0001-23', '(19) 3456-4000');

INSERT INTO pecas (id_pecas, nome, estoque, preco_unitario, id_fornecedor)
VALUES (11, 'Amortecedor dianteiro', 12, 210.00, 11);

COMMIT;


START TRANSACTION;

INSERT INTO servicos (id_servicos, id_veiculo, data_entrada, descricao, mao_obra, status)
VALUES (11, 11, '2026-11-25 09:00:00', 'Troca de oleo e filtro de oleo', 80.00, 'Em andamento');

INSERT INTO utiliza (id_servicos, id_pecas, quantidade, preco_unitario) VALUES
(11, 1, 1.00, 25.90),
(11, 2, 4.00, 32.50);

UPDATE pecas SET estoque = estoque - 1 WHERE id_pecas = 1 AND estoque >= 1;
UPDATE pecas SET estoque = estoque - 4 WHERE id_pecas = 2 AND estoque >= 4;

SELECT id_pecas, nome, estoque FROM pecas WHERE id_pecas IN (1, 2);

COMMIT;

START TRANSACTION;

INSERT INTO servicos (id_servicos, id_veiculo, data_entrada, descricao, mao_obra, status)
VALUES (12, 1, '2026-11-25 10:30:00', 'Troca de pastilhas e filtro de ar', 150.00, 'Em andamento');

INSERT INTO utiliza (id_servicos, id_pecas, quantidade, preco_unitario)
VALUES (12, 3, 1.00, 89.90);

SAVEPOINT sp_pastilha;

INSERT INTO utiliza (id_servicos, id_pecas, quantidade, preco_unitario)
VALUES (12, 4, 1.00, 120.00);

ROLLBACK TO SAVEPOINT sp_pastilha;

INSERT INTO utiliza (id_servicos, id_pecas, quantidade, preco_unitario)
VALUES (12, 6, 1.00, 38.00);

UPDATE pecas SET estoque = estoque - 1 WHERE id_pecas IN (3, 6) AND estoque >= 1;

RELEASE SAVEPOINT sp_pastilha;

COMMIT;


SELECT s.id_servicos, p.nome AS peca, u.quantidade
FROM utiliza u
JOIN servicos s ON s.id_servicos = u.id_servicos
JOIN pecas p ON p.id_pecas = u.id_pecas
WHERE s.id_servicos = 12;


START TRANSACTION;

INSERT INTO pagamentos (id_pagamento, id_servicos, data_pagamento, valor, forma_pagamento)
VALUES (5, 3, '2026-11-25 14:00:00', 293.90, 'Cartao de credito');

UPDATE servicos SET status = 'Concluido' WHERE id_servicos = 3;

ROLLBACK;

SELECT id_servicos, status FROM servicos WHERE id_servicos = 3;
SELECT * FROM pagamentos WHERE id_pagamento = 5;

START TRANSACTION;

INSERT INTO pagamentos (id_pagamento, id_servicos, data_pagamento, valor, forma_pagamento)
VALUES (5, 3, '2026-11-25 14:10:00', 293.90, 'PIX');

UPDATE servicos SET status = 'Concluido' WHERE id_servicos = 3;

COMMIT;

-- Conferencia
SELECT s.id_servicos, s.status, SUM(pg.valor) AS total_pago
FROM servicos s
JOIN pagamentos pg ON pg.id_servicos = s.id_servicos
WHERE s.id_servicos = 3
GROUP BY s.id_servicos, s.status;

SET autocommit = 0;

UPDATE servicos SET status = 'Concluido' WHERE id_servicos = 6;

COMMIT;

SET autocommit = 1;