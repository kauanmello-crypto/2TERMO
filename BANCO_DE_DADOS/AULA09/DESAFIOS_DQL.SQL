-- Active: 1788267989775@@127.0.0.1@3306@smartcoffee_dml_kauan
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL

USE smartcoffee_dml_KAUAN;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
select * from cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
select nome, cidade, email from cliente;

-- 3. Liste os nomes das cidades sem repetir valores.
select distinct cidade from cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.
select * from produto order by preco asc;

-- 5. Mostre apenas os 5 produtos mais caros.
select * from produto order by preco desc limit 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
select * from produto where preco between 8 and 15;

-- 7. Liste os clientes das cidades Limeira ou Americana.
select * from cliente where cidade in ('Limeira', 'Americana');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
select * from produto where nome like '%Café%';

-- 9. Liste os clientes que não informaram telefone.
select * from cliente where telefone is null;

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
select * from pedido where status = 'FINALIZADO' and valor_total > 20 order by valor_total desc;

-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
select count(*) as total_produtos from produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.

select min(preco) as menor_preco, max(preco) as maior_preco, avg(preco) as preco_medio from produto;
-- 13. Informe quantos clientes existem em cada cidade.

select cidade, count(*) as total_clientes from cliente group by cidade;
-- 14. Mostre somente as cidades que possuem dois ou mais clientes.

select cidade, count(*) as total_clientes from cliente group by cidade having count(*) >= 2;
-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.

-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.

select p.id_pedido, p.data, c.nome as nome_cliente, p.status, p.valor_total 
from pedido p join cliente c on p.id_cliente = c.id_cliente;
-- 17. Liste cada produto acompanhado do nome de sua categoria.
select pr.id_produto, pr.nome as nome_produto, c.nome as nome_categoria 
from produto pr join categoria c on pr.id_categoria = c.id_categoria;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.
select i.id_pedido, p.nome as nome_produto, i.quantidade, i.preco_unitario, (i.quantidade * i.preco_unitario) as subtotal 
from item_pedido i join produto p on i.id_produto = p.id_produto;

-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.

select c.id_cliente, c.nome, p.id_pedido from cliente c left join pedido p on c.id_cliente = p.id_cliente;
-- 20. Liste apenas os clientes que nunca fizeram pedidos.


-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.
select c.id_cliente, c.nome, count(p.id_pedido) as total_pedidos, sum(p.valor_total) as total_gasto
from cliente c left join pedido p on c.id_cliente = p.id_cliente and p.status = 'FINALIZADO'
group by c.id_cliente, c.nome;

-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.

select c.id_categoria, c.nome as nome_categoria, count(p.id_produto) as total_produtos, avg(p.preco) as preco_medio
from categoria c join produto p on c.id_categoria = p.id_categoria
group by c.id_categoria, c.nome;
-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.
select * from produto where preco > (select avg(preco) from produto);

-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.
select nome, preco, case 
    when preco < 10 then 'Econômico'
    when preco between 10 and 20 then 'Intermediário'
    else 'Premium'
end as faixa_preco
from produto;

-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
--
-- Por que essa informação é útil?
--
-- Consulta: