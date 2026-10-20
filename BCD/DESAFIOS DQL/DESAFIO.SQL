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
SELECT P.ID_PEDIDO, P.DATA_PEDIDO, C.NOME AS CLIENTE, P.STATUS_PEDIDO, P.VALOR_TOTAL
FROM PEDIDO AS P
JOIN CLIENTE AS C ON P.CLIENTE_ID = C.ID_CLIENTE;

-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT P.NOME_PRODUTO, C.NOME_CATEGORIA
FROM PRODUTO AS P
JOIN CATEGORIA AS C ON P.ID_CATEGORIA = C.ID_CATEGORIA;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.
SELECT I.ID_PEDIDO, P.NOME_PRODUTO, I.QUANTIDADE, I.PRECO_UNITARIO, (I.QUANTIDADE * I.PRECO_UNITARIO) AS SUBTOTAL
FROM ITEM_PEDIDO AS I
JOIN PRODUTO AS P ON I.ID_PRODUTO = P.ID_PRODUTO;

-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.
SELECT C.NOME, C.CIDADE, P.ID_PEDIDO
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P ON C.ID_CLIENTE = P.CLIENTE_ID;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.
SELECT C.NOME, C.CIDADE
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P ON C.ID_CLIENTE = P.CLIENTE_ID
WHERE P.CLIENTE_ID IS NULL;

-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.
SELECT C.NOME, COUNT(P.ID_PEDIDO) AS TOTAL_PEDIDOS, SUM(P.VALOR_TOTAL) AS TOTAL_GASTO
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P ON C.ID_CLIENTE = P.CLIENTE_ID
WHERE P.STATUS_PEDIDO = 'FINALIZADO'
GROUP BY C.NOME
ORDER BY TOTAL_GASTO DESC;

-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.
SELECT C.NOME_CATEGORIA, COUNT(P.ID_PRODUTO) AS QUANTIDADE_PRODUTOS, AVG(P.PRECO) AS PRECO_MEDIO
FROM CATEGORIA AS C
LEFT JOIN PRODUTO AS P ON C.ID_CATEGORIA = P.ID_CATEGORIA
GROUP BY C.NOME_CATEGORIA;

-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.
SELECT NOME_PRODUTO, PRECO
FROM PRODUTO
WHERE PRECO > (SELECT AVG(PRECO) FROM PRODUTO);

-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.
SELECT NOME_PRODUTO, PRECO, 
CASE 
WHEN PRECO < 8.00 THEN  'Economico'
WHEN PRECO <= 15.00 THEN 'Intermediario'
ELSE  'Premium'
END AS CLASSIFICACAO
FROM PRODUTO
ORDER BY PRECO;

-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
--  Qual é a classificação dos produtos vendidos em cada categoria e qual é o preço médio de cada classificação?
-- Por que essa informação é útil?
-- Saber a classificação dos produtos vendidos em cada categoria e o preço médio de cada classificação é útil para entender o posicionamento de 
--mercado dos produtos, identificar oportunidades de ajuste de preços, e auxiliar na tomada de decisões estratégicas de marketing e vendas.
-- Consulta: 

SELECT C.NOME_CATEGORIA, 
       CASE 
           WHEN P.PRECO < 8.00 THEN 'Economico'
           WHEN P.PRECO <= 15.00 THEN 'Intermediario'
           ELSE 'Premium'
       END AS CLASSIFICACAO,
       AVG(P.PRECO) AS PRECO_MEDIO
FROM CATEGORIA AS C
LEFT JOIN PRODUTO AS P ON C.ID_CATEGORIA = P.ID_CATEGORIA
GROUP BY C.NOME_CATEGORIA, CLASSIFICACAO;

