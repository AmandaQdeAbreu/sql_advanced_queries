/*Para utilizar o GROUP BY � necess�rio que haja pelo menos uma fun��o de agrega��o 
(SUM, AVG, MAX ou MIN) no SELECT, e o GROUP BY vai chamar sempre a coluna categ�rica.*/


--Exemplos de consultas desse tipo:

SELECT ESTADO, SUM(VOLUME_DE_COMPRA) AS TOTAL_VOLUME_DE_COMPRA
FROM TABELA_DE_CLIENTES
GROUP BY ESTADO
ORDER BY TOTAL_VOLUME_DE_COMPRA DESC;

SELECT CIDADE, AVG(IDADE) AS M�DIA_IDADE
FROM TABELA_DE_CLIENTES
GROUP BY CIDADE
ORDER BY M�DIA_IDADE DESC;

SELECT CIDADE, SUM(VOLUME_DE_COMPRA) AS TOTAL_VOLUME_DE_COMPRA, SUM(LIMITE_DE_CREDITO) AS CREDITO
FROM TABELA_DE_CLIENTES
GROUP BY CIDADE;

SELECT CIDADE, AVG(VOLUME_DE_COMPRA) AS MEDIA_VOLUME_DE_COMPRA, SUM(LIMITE_DE_CREDITO) AS TOTAL_CREDITO
FROM TABELA_DE_CLIENTES
GROUP BY CIDADE;

--- Para ontas o n�mero de linhas usamos o COUNT(*)

SELECT CIDADE, COUNT(*) AS NUM_DE_CLIENTES
FROM TABELA_DE_CLIENTES
GROUP BY CIDADE;

SELECT EMBALAGEM, COUNT(*) AS NUM_DE_PRODUTOS
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'LARANJA'
GROUP BY EMBALAGEM;

---  Quantas vendas foram feitas com quantidade igual a 99 litros para o produto '1101035'?

SELECT * FROM ITENS_NOTAS_FISCAIS;

SELECT COUNT(*) AS [TOTAL VENDAS]
FROM ITENS_NOTAS_FISCAIS
WHERE CODIGO_DO_PRODUTO = '1101035' AND QUANTIDADE = 99;

--- Filtros utilizando o HAVING. Utilizando envolvendo agrega��es.

SELECT * FROM TABELA_DE_CLIENTES;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS CREDITO
FROM TABELA_DE_CLIENTES
GROUP BY ESTADO;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS CREDITO
FROM TABELA_DE_CLIENTES
GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) > 900000;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAX, MIN(PRECO_DE_LISTA) AS PRECO_MIN
FROM TABELA_DE_PRODUTOS
GROUP BY EMBALAGEM;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAX, MIN(PRECO_DE_LISTA) AS PRECO_MIN
FROM TABELA_DE_PRODUTOS
WHERE PRECO_DE_LISTA >= 10
GROUP BY EMBALAGEM;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAX, MIN(PRECO_DE_LISTA) AS PRECO_MIN
FROM TABELA_DE_PRODUTOS
WHERE PRECO_DE_LISTA >= 10
GROUP BY EMBALAGEM
HAVING MAX(PRECO_DE_LISTA) >= 20;

-- Verifique as quantidades totais de vendas de cada produto e ordene do maior para o menor.

SELECT *
FROM ITENS_NOTAS_FISCAIS;

SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS QUANTIDADE_TOTAL
FROM ITENS_NOTAS_FISCAIS
GROUP BY CODIGO_DO_PRODUTO
HAVING SUM(QUANTIDADE) > 394000
ORDER BY QUANTIDADE_TOTAL DESC;

/*SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS QUANTIDADE FROM ITENS_NOTAS_FISCAIS 
GROUP BY CODIGO_DO_PRODUTO ORDER BY SUM(QUANTIDADE) DESC;*/




