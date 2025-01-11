SELECT * FROM TABELA_DE_PRODUTOS;

SELECT * 
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga' AND TAMANHO = '470 ml';

SELECT * 
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga' OR TAMANHO = '470 ml';

SELECT * 
FROM TABELA_DE_PRODUTOS
WHERE NOT (SABOR = 'Manga' AND TAMANHO = '470 ml');

SELECT * 
FROM TABELA_DE_PRODUTOS
WHERE NOT (SABOR = 'Manga' OR TAMANHO = '470 ml')

SELECT * 
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga' OR SABOR = 'Laranja' OR SABOR = 'Melancia';

--- Simplificando a consulta de cima utilizando o in:
SELECT * 
FROM TABELA_DE_PRODUTOS
WHERE SABOR in ('Manga','Laranja','Melancia');

SELECT * 
FROM TABELA_DE_PRODUTOS
WHERE (SABOR in ('Manga','Laranja','Melancia')) AND TAMANHO = '1 Litro';

SELECT *
FROM TABELA_DE_CLIENTES
WHERE CIDADE in ('Rio de Janeiro', 'Sao Paulo');

SELECT *
FROM TABELA_DE_CLIENTES
WHERE CIDADE in ('Rio de Janeiro', 'Sao Paulo') AND IDADE >= 20;

SELECT *
FROM TABELA_DE_CLIENTES
WHERE CIDADE in ('Rio de Janeiro', 'Sao Paulo') AND (IDADE >= 20 AND IDADE <=25);

-- Podemos utlizar o BETWEEN para verificar um intervalo de n�meros simplificando o filtro de cima:
SELECT *
FROM TABELA_DE_CLIENTES
WHERE CIDADE in ('Rio de Janeiro', 'Sao Paulo') AND (IDADE BETWEEN 20 AND 25);



