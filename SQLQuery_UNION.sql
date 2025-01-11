/*
UNION: Comando utilizado para unir horizontalmente duas consultas.
Apresenta apenas valores unicos, aplicando o distinct automaticamente.

UNION ALL: Não aplica o distinct sobre o resultado.

Requisitos para utilizar o UNION:
1. O número de campos na primeira consulta deve ser igual ao número de campos na segunda consulta;
2. O tipo dos campos das consultas devem ser iguals.
*/


-- Quantos bairros diferentes nos temos na tabela de clientes?
SELECT DISTINCT BAIRRO
FROM TABELA_DE_CLIENTES;
-- 12 bairros relacionados com clientes.

-- Quantos bairros diferentes nos temos na tabela de vendedores?
SELECT DISTINCT BAIRRO
FROM TABELA_DE_VENDEDORES;
-- 4 bairros relacionados com vendedores.

-- Unindo as duas consultas para retornar valores únicos:
SELECT BAIRRO
FROM TABELA_DE_CLIENTES
UNION
SELECT BAIRRO
FROM TABELA_DE_VENDEDORES;

-- Unindo as duas consultas para retornar todos os valores:
SELECT BAIRRO
FROM TABELA_DE_CLIENTES
UNION ALL
SELECT BAIRRO
FROM TABELA_DE_VENDEDORES;

-- Inserindo uma constante para identificar a tabela original dos resultados:

SELECT BAIRRO, 'Cliente' AS ORIGEM
FROM TABELA_DE_CLIENTES
UNION ALL
SELECT BAIRRO, 'Vendedores' AS ORIGEM
FROM TABELA_DE_VENDEDORES;

