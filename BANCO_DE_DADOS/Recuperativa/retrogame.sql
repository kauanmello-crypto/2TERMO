-- Active: 1794920623279@@127.0.0.1@3308@recuperativa_retrogame_kauan
DROP DATABASE IF EXISTS RECUPERATIVA_RETROGAME_KAUAN;

CREATE DATABASE IF NOT EXISTS RECUPERATIVA_RETROGAME_KAUAN; -- CRIANDO A PASTA

USE recuperativa_retrogame_kauan;

CREATE TABLE CLIENTE (
    ID_CLIENTE INT AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(120) NOT NULL UNIQUE,
    TELEFONE VARCHAR(20),
    ATIVO BOOLEAN DEFAULT TRUE,

    CONSTRAINT PK_ID_CLIENTE PRIMARY KEY (ID_CLIENTE),
    CONSTRAINT UQ_EMAIL UNIQUE (EMAIL)
);

CREATE TABLE CATEGORIA (
    ID_CATEGORIA INT PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO VARCHAR(80) NOT NULL,
    CONSTRAINT UQ_CATEGORIA_DESCRICAO UNIQUE (DESCRICAO)
);

CREATE TABLE PLATAFORMA (
    ID_PLATAFORMA  INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(80) NOT NULL UNIQUE,
    CONSTRAINT UQ_PLATAFORMA_NOME UNIQUE (NOME)
);

CREATE TABLE IF NOT EXISTS JOGO (
    ID_JOGO INT AUTO_INCREMENT PRIMARY KEY,
    TITULO VARCHAR(150) NOT NULL,
    CODIGO VARCHAR(15) NOT NULL UNIQUE,
    ANO_LANCAMENTO INT NOT NULL,
    -- CORRIGIDO: >= 0 para permitir estoque menor que 5 nos inserts e updates
    QUANTIDADE_DISPONIVEL INT DEFAULT 5 CHECK (QUANTIDADE_DISPONIVEL >= 0),
    ID_CATEGORIA INT,
    ID_PLATAFORMA INT,

    CONSTRAINT FK_CATEGORIA FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA (ID_CATEGORIA),
    CONSTRAINT FK_PLATAFORMA FOREIGN KEY (ID_PLATAFORMA) REFERENCES PLATAFORMA (ID_PLATAFORMA)
);

ALTER TABLE JOGO ADD DESENVOLVEDORA VARCHAR(100);

CREATE TABLE LOCACAO (
    id_locacao INT AUTO_INCREMENT PRIMARY KEY,
    data_retirada DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL,
    status_locacao VARCHAR(20) NOT NULL DEFAULT 'ABERTA',
    id_cliente INT NOT NULL,
    id_jogo INT NOT NULL, 
    CONSTRAINT chk_status_locacao CHECK (status_locacao IN ('ABERTA', 'DEVOLVIDA', 'ATRASADA')),
    CONSTRAINT fk_locacao_cliente FOREIGN KEY (id_cliente) 
        REFERENCES CLIENTE(id_cliente)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_locacao_jogo FOREIGN KEY (id_jogo) 
        REFERENCES JOGO(id_jogo)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- FASE 2
INSERT INTO cliente (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('GABRIEL','GABRIEL@EMAIL.COM','19 99999 9991',TRUE),
('IGOR','IGOR@EMAIL.COM','19 99999 9992',TRUE),
('MANUELA', 'MANUELA@EMAIL.COM', NULL, TRUE),
('RIZZO', 'RIZZO@EMAIL.COM', '19 99999 9993', TRUE);

INSERT INTO PLATAFORMA (nome) VALUES
('Xbox'),
('Nintendo'),
('PlayStation 1'),
('PlayStation 2');

INSERT INTO CATEGORIA (descricao) VALUES
('Ação'),
('HORROR'),
('Corrida'); 

INSERT INTO JOGO (titulo, desenvolvedora, codigo, ano_lancamento, quantidade_disponivel, id_plataforma, id_categoria) VALUES
('Super Mario World', 'Nintendo EAD', 'SNES-001', 1990, 5, 1, 1),
('Chrono Trigger', 'Square', 'SNES-002', 1995, 2, 1, 2),
('Final Fantasy VII', 'Square', 'PS1-001', 1997, 3, 2, 2),
('Sonic the Hedgehog 2', 'Sonic Team', 'MD-001', 1992, 4, 4, 1),
('God of War II', 'Santa Monica Studio', 'PS2-001', 2007, 3, 3, 3),
-- CORRIGIDO: id_categoria alterado de 4 para 3 (só existem 3 categorias cadastradas)
('Gran Turismo 4', 'Polyphony Digital', 'PS2-002', 2004, 1, 3, 3);

INSERT INTO LOCACAO (data_retirada, data_prevista, status_locacao, id_cliente, id_jogo) VALUES
('2026-11-10 14:30:00', '2026-11-17', 'ABERTA', 1, 1), 
('2026-11-12 10:15:00', '2026-11-19', 'ABERTA', 2, 3), 
('2026-11-14 16:00:00', '2026-11-21', 'ABERTA', 1, 5); 

UPDATE JOGO SET quantidade_disponivel = quantidade_disponivel - 1 WHERE id_jogo IN (1, 3, 5);

SELECT * FROM LOCACAO;
SELECT id_jogo, titulo, quantidade_disponivel FROM JOGO;

SELECT id_cliente, nome, email, telefone FROM CLIENTE WHERE id_cliente = 3;

UPDATE CLIENTE 
SET telefone = '19 99999 9992 ' 
WHERE id_cliente = 3;

SELECT id_cliente, nome, telefone FROM CLIENTE WHERE id_cliente = 3;

UPDATE JOGO
SET quantidade_disponivel = quantidade_disponivel + 2 
WHERE ano_lancamento >= 2000;

SELECT id_jogo, titulo, ano_lancamento, quantidade_disponivel FROM JOGO WHERE ano_lancamento >= 2000;

INSERT INTO CLIENTE (nome, email, telefone) VALUES ('Cliente Temporário', 'temp@email.com', '(19) 90000-0000');
SELECT * FROM CLIENTE WHERE email = 'temp@email.com';

DELETE FROM CLIENTE WHERE email = 'temp@email.com';



-- FASE 3

SELECT titulo, ano_lancamento, QUANTIDADE_DISPONIVEL
FROM jogo;

SELECT * 
FROM jogo 
WHERE QUANTIDADE_DISPONIVEL > 2 
ORDER BY QUANTIDADE_DISPONIVEL DESC;


SELECT * 
FROM jogo
WHERE titulo LIKE '%IGOR%';

SELECT * 
FROM jogo
WHERE ano_lancamento BETWEEN 1990 AND 2005;

SELECT 
    COUNT(QUANTIDADE_DISPONIVEL) AS total_jogo_cadastrados,
    SUM(QUANTIDADE_DISPONIVEL) AS soma_total_estoque,
    AVG(QUANTIDADE_DISPONIVEL) AS media_estoque,
    MIN(QUANTIDADE_DISPONIVEL) AS menor_estoque,
    MAX(QUANTIDADE_DISPONIVEL) AS maior_estoque
FROM jogo;


SELECT 
    l.id_locacao, 
    c.nome AS nome_cliente, 
    j.titulo AS titulo_jogo, 
    l.data_retirada, 
    l.status_locacao
FROM locacao l
INNER JOIN cliente c ON l.id_cliente = c.id_cliente
INNER JOIN jogo j ON l.id_jogo = j.id_jogo;


SELECT 
    l.id_locacao, 
    c.nome AS nome_cliente, 
    j.titulo AS titulo_jogo, 
    l.data_retirada, 
    l.status_locacao
FROM locacao l
INNER JOIN cliente c ON l.id_cliente = c.id_cliente
INNER JOIN jogo j ON l.id_jogo = j.id_jogo
WHERE l.status_locacao = 'ABERTA';


SELECT 
    c.nome AS nome_cliente, 
    COUNT(l.id_locacao) AS quantidade_locacoes
FROM cliente c
INNER JOIN locacao l ON c.id_cliente = l.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY quantidade_locacoes DESC;

SELECT 
    c.nome AS nome_cliente, 
    COUNT(l.id_locacao) AS quantidade_locacao
FROM cliente c
LEFT JOIN locacao l ON c.id_cliente = l.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY quantidade_locacao DESC;