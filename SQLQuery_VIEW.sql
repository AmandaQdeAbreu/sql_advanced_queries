
-- Uma view � uma tabela virtual que criamos para utilizar em outra consulta. Exemplo:

/*CREATE VIEW MEDIA_EMBALAGENS AS
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM TABELA_DE_PRODUTOS
GROUP BY EMBALAGEM;

-- VIEW criada:
SELECT * FROM MEDIA_EMBALAGENS;

-- Utilizando a view em uma consulta:
SELECT EMBALAGEM, PRECO_MEDIO
FROM MEDIA_EMBALAGENS
WHERE PRECO_MEDIO > 10;*/

-- Criando uma vis�o para a lista de quantidades totais:

CREATE VIEW QUANTIDADES_TOTAIS AS 
SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE 
FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO;

SELECT CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, QUANTIDADE
FROM QUANTIDADES_TOTAIS
WHERE QUANTIDADE > 394000
ORDER BY QUANTIDADE DESC;