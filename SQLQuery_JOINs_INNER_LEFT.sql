SELECT * FROM TABELA_DE_VENDEDORES;
SELECT * FROM NOTAS_FISCAIS;

/* INNER JOIN: Une duas tabelas a partir da intersec��o, ou seja, devolve apenas o que existe nas duas
e descarta o restante.*/

-- Juntando as tabelas de Vendedores e de Notas Fiscais;

--1� contando o n�mero de notas fiscais por vendedor para saber quanto cada um vendeu:
SELECT MATRICULA, COUNT(*) AS NUMERO_NOTAS
FROM NOTAS_FISCAIS
GROUP BY MATRICULA;

-- Quantas vendas cada vendedor efetuou mostrando o nome de cada vendedor:
SELECT N.MATRICULA, NOME, COUNT(*) AS NUMERO_NOTAS
FROM TABELA_DE_VENDEDORES AS V -- a boa pr�tica diz que a tabela superior deve ser escrita primeiro.
INNER JOIN NOTAS_FISCAIS AS N ON N.MATRICULA = V.MATRICULA
GROUP BY N.MATRICULA, NOME;


/*Juntanto a tabela de produtos com a de Itens Notas Fiscais. Altere o c�digo abaixo para aparecer
tamb�m o nome do produto:*/

SELECT * FROM TABELA_DE_PRODUTOS;
SELECT * FROM ITENS_NOTAS_FISCAIS;


SELECT I.CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, SUM(I.QUANTIDADE) AS QUANTIDADE 
FROM TABELA_DE_PRODUTOS AS P 
INNER JOIN ITENS_NOTAS_FISCAIS AS I ON I.CODIGO_DO_PRODUTO = P.CODIGO_DO_PRODUTO
GROUP BY I.CODIGO_DO_PRODUTO, NOME_DO_PRODUTO
HAVING SUM(I.QUANTIDADE) > 394000 
ORDER BY SUM(I.QUANTIDADE) DESC;

/*
LEFT JOIN: Junta toda a informa��o contida na tabela da esquerda (primeira tabela inserida, logo ap�s o FROM)
com as informa��es da intersec��o da tabela da direita (inserida ap�s o comando LEFT JOIN).

RIGHT JOIN: Junta toda a informa��o contida na tabela da direita (primeira tabela inserida, logo ap�s o 
comando RIGHT JOIN)com as informa��es da intersec��o da tabela da esquerda (inserida ap�s o comando FROM).

UNION / FULL JOIN: Retorna todas as informa��es das duas tabelas.

CROSS JOIN: Retorna uma analise combinat�ria de todas as informa�es das duas tabelas, ou seja,
pega a primeira linha da tabela da esquerda e cruzar com todas as linhas da tabela da direita. O resultado ser�
uma tabela bem extensa. N�o h� a necessidade de utilizar o comando ON.

*/

-- Praticando LEFT JOIN:

SELECT DISTINCT
C.CPF AS CPF_DO_CADASTRO,
C.NOME AS NOME_DO_CLIENTE,
N.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES C
INNER JOIN NOTAS_FISCAIS N ON N. CPF = C.CPF;

SELECT COUNT(*)
FROM TABELA_DE_CLIENTES;

-- Incluindo um cliente novo:
INSERT INTO TABELA_DE_CLIENTES
([CPF], [NOME], [ENDERECO_1], [ENDERECO_2], [BAIRRO], [CIDADE], [ESTADO], [CEP], [DATA_DE_NASCIMENTO], [IDADE], 
[GENERO], [LIMITE_DE_CREDITO],[VOLUME_DE_COMPRA], [PRIMEIRA_COMPRA])
VALUES
('23412632331', 'Juliana Silva', 'R. Tamandai', '', 'Bangu', 'Rio de Janiro', 'RJ', '23400000',
'1989-02-04', 33, 'F', 180000, 24500, 0); 

SELECT COUNT(*)
FROM TABELA_DE_CLIENTES;

SELECT DISTINCT
C.CPF AS CPF_DO_CADASTRO,
C.NOME AS NOME_DO_CLIENTE,
N.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES C
INNER JOIN NOTAS_FISCAIS N ON N. CPF = C.CPF;

-- Identificando o cliente que n�o efetuou nenhuma compra:
SELECT DISTINCT
C.CPF AS CPF_DO_CADASTRO,
C.NOME AS NOME_DO_CLIENTE,
N.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES C
LEFT JOIN NOTAS_FISCAIS N ON N. CPF = C.CPF
WHERE N.CPF IS NULL;
