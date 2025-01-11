
/*SUBQUERY: Uma consulta dentro dentro de outra consulta separada por parenteses. Deve sempre conter
um ALIAS para renomear a consulta principal*/

-- Trazer as informações da tabela de vendedores apenas dos bairros que exista na tabela de clientes.

-- Podemos fazer em duas consultas, assim:
--> 1º visualizar os bairros existentes na tabela de vendedores:
SELECT DISTINCT BAIRRO
FROM TABELA_DE_VENDEDORES;

--> 2º preparar a consulta após saber os bairros existentes na tabela de vendedores:

SELECT * 
FROM TABELA_DE_CLIENTES
WHERE BAIRRO IN ('Copacabana', 'Jardins', 'Santo Amaro', 'Tijuca');

-- OU utilizar uma subquery no IN para verificar o resultado em uma única consulta:
SELECT * 
FROM TABELA_DE_CLIENTES
WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES);


-- Liste os sabores dos produtos que são selecionados na consulta abaixo:

/*SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;*/

SELECT DISTINCT SABOR 
FROM TABELA_DE_PRODUTOS
WHERE CODIGO_DO_PRODUTO IN (SELECT INF.CODIGO_DO_PRODUTO
							FROM ITENS_NOTAS_FISCAIS  INF
							INNER JOIN TABELA_DE_PRODUTOS TP ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
							GROUP BY INF.CODIGO_DO_PRODUTO
							HAVING SUM(INF.QUANTIDADE) > 394000);


