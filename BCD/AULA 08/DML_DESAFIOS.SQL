-- Active: 1788267989775@@127.0.0.1@3306@smartcoffee_dml_kauan

------------------------ PARTE A ------------------------
---------------------------------------------------------

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('leticia ', 'leticia@email.com', '19999999999', 'Piracicaba', TRUE),
('Kauan R', 'Kauan@email.com', '19999999988', 'Estatos Unidos', TRUE);

SET @cliente = LAST_INSERT_ID();

INSERT INTO categoria (nome) VALUES ('Especiais da Casa');






SET @categoria = LAST_INSERT_ID();

