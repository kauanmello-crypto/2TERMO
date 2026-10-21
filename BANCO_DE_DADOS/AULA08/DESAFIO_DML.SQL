-- Active: 1788267989775@@127.0.0.1@3306@smartcoffee_dml_kauan
-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML

USE smartcoffee_dml_kauan;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.
insert into cliente (nome, email, telefone, cidade) values
('João Silva', 'joao.silva@email.com', '11999999999', 'São Paulo'),
('Maria Oliveira', 'maria.oliveira@email.com', '11888888888', 'Campinas');


-- 2. Cadastre a categoria 'Especiais da Casa'.
insert into categoria (nome) values ('Especiais da Casa');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
set @id_categoria = (select id_categoria from categoria where nome = 'Especiais da Casa');
insert into produto (nome, preco, id_categoria) values
('Café Expresso', 12.00, @id_categoria),
('Café com Leite', 15.00, @id_categoria),
('Capuccino', 18.00, @id_categoria);

-- 4. Cadastre um terceiro cliente sem telefone.

insert into cliente (nome, email, cidade) values
('Carlos Pereira', 'carlos.pereira@email.com', 'São Paulo');
-- 5. Crie um novo pedido para um dos clientes cadastrados.
insert into pedido (id_cliente, data, status, valor_total) values
((select id_cliente from cliente where nome = 'João Silva'), now(), 'PENDENTE', 0.00);

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
insert into item_pedido (id_pedido, id_produto, quantidade, preco_unitario) values
(LAST_INSERT_ID(), (select id_produto from produto where nome = 'Café Expresso'), 2, 12.00),
(LAST_INSERT_ID(), (select id_produto from produto where nome = 'Café com Leite'), 1, 15.00);

-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:


-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
insert into cliente (nome, email, telefone, cidade) values
('Ana Souza', 'ana.souza@email.com', '11777777777', 'São Paulo');

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.

insert into categoria (nome) values ('Especiais da Casa');
-- 10. Altere o status do pedido criado para 'PREPARANDO'.
insert in ADDto pedido (id_cliente, data, status, valor_total) values
((select id_cliente from cliente where nome = 'João Silva'), now(), 'PENDENTE', 0.00);

-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).
insert into item_pedido (id_pedido, id_produto, quantidade, preco_unitario) values
(LAST_INSERT_ID(), (select id_produto from produto where nome = 'Café Expresso'), 2, 12.00),
(LAST_INSERT_ID(), (select id_produto from produto where nome = 'Café com Leite'), 1, 15.00);

-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).
insert into cliente (nome, email, telefone, cidade) values
('Pedro Lima', 'pedro.lima@email.com', '11888888888', 'São Paulo');

-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.
delete from cliente where nome = 'Pedro Lima';

-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:
delete from cliente where nome = 'João Silva';

-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.

-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS
-- Execute uma tentativa por vez. Depois deixe o comando problemático comentado.

-- 17. Tente inserir um produto com id_categoria = 9999.
-- Qual restrição impediu a operação?


-- 18. Tente cadastrar um cliente usando 'ana@email.com'.
-- Qual restrição impediu a operação?


-- 19. Tente criar um pedido com id_cliente = 9999.
-- Qual restrição impediu a operação?


-- 20. Escreva em comentários a diferença entre os três erros anteriores.


-- PARTE E - DESAFIO COMPLETO COM TRANSAÇÃO

-- 21. Inicie uma transação.


-- 22. Dentro dela, cadastre um cliente, um pedido e dois itens relacionados.


-- 23. Faça uma consulta com JOIN comprovando que os registros existem
--     enquanto a transação está aberta.


-- 24. Execute ROLLBACK e depois use SELECT para provar que o cadastro foi desfeito.


-- 25. Repita o processo com novos dados e finalize usando COMMIT.
--     Depois consulte os registros persistidos.


-- DESAFIO EXTRA
-- 26. Escolha uma situação realista do SmartCoffee que exija INSERT + UPDATE
--     ou UPDATE + DELETE lógico. Descreva a regra de negócio e implemente.