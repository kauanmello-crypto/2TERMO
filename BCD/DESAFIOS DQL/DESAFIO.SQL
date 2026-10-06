-- Active: 1788267989775@@127.0.0.1@3306@smartcoffee_dml_kauan

-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: KAUAN RODRIGO DE MELLO
-- Turma: DEVEI - CASTELLO           Data: 06/10/2026

-- ============================================================

USE smartcoffee_dml_kauan;


-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT * FROM cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome, cidade, email FROM cliente;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade FROM cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT NOME_PRODUTO, PRECO 
FROM PRODUTO
ORDER BY PRECO ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT NOME_PRODUTO, PRECO
FROM PRODUTO
ORDER BY PRECO DESC
LIMIT 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT NOME_PRODUTO, PRECO
FROM PRODUTO
WHERE PRECO BETWEEN 8.00 AND 15.00;

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT NOME, CIDADE
FROM CLIENTE
WHERE CIDADE IN ('Limeira', 'Americana');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT NOME_PRODUTO, PRECO
FROM PRODUTO
WHERE NOME_PRODUTO LIKE '%Café%';

-- 9. Liste os clientes que não informaram telefone.
SELECT NOME, TELEFONE
FROM cliente
WHERE TELEFONE IS NOT NULL;

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT ID_PEDIDO, DATA_PEDIDO, VALOR_TOTAL
FROM pedido
WHERE STATUS_PEDIDO = 'FINALIZADO' AND VALOR_TOTAL > 20.00
ORDER BY VALOR_TOTAL DESC;

-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS TOTAL_PRODUTOS
FROM PRODUTO;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT MIN(PRECO) AS MENORES_PRECOS,
       MAX(PRECO) AS MAIORES_PRECOS,
       AVG(PRECO) AS MEDIA_PRECOS
FROM PRODUTO;

-- 13. Informe quantos clientes existem em cada cidade.
SELECT CIDADE, COUNT(*) AS TOTAL_CLIENTES
FROM CLIENTE
GROUP BY CIDADE;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT CIDADE, COUNT(*) AS TOTAL_CLIENTES
FROM CLIENTE
GROUP BY CIDADE
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(VALOR_TOTAL) AS FATURAMENTO
FROM pedido
WHERE STATUS_PEDIDO = 'FINALIZADO';

-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.


-- 17. Liste cada produto acompanhado do nome de sua categoria.


-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.


-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.


-- 20. Liste apenas os clientes que nunca fizeram pedidos.


-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.


-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.


-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.


-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.


-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
--
-- Por que essa informação é útil?
--
-- Consulta:

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.


-- 2. Exiba apenas nome, cidade e e-mail dos clientes.


-- 3. Liste os nomes das cidades sem repetir valores.


-- 4. Liste todos os produtos em ordem crescente de preço.


-- 5. Mostre apenas os 5 produtos mais caros.


-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.


-- 7. Liste os clientes das cidades Limeira ou Americana.


-- 8. Localize os produtos cujo nome contém a palavra “Café”.


-- 9. Liste os clientes que não informaram telefone.


-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.


-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.


-- 12. Mostre menor preço, maior preço e preço médio dos produtos.


-- 13. Informe quantos clientes existem em cada cidade.


-- 14. Mostre somente as cidades que possuem dois ou mais clientes.


-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.


-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.


-- 17. Liste cada produto acompanhado do nome de sua categoria.


-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.


-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.


-- 20. Liste apenas os clientes que nunca fizeram pedidos.


-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.


-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.


-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.


-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.


-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
--
-- Por que essa informação é útil?
--
-- Consulta:

