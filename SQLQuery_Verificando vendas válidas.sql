/* Verificando as vendas v�lidas.
Preciso verificar quais os clientes que ultrapassaram o volume de compras 
em determinado m�s.
*/

-- 1� Verificando o volume de compra real por cliente:
SELECT
N.CPF,
CONVERT(VARCHAR(7),N.DATA_VENDA, 120) AS MES_ANO,
SUM(I.QUANTIDADE) AS QUANTIDADE_TOTAL_POR_LITROS
FROM NOTAS_FISCAIS N
INNER JOIN ITENS_NOTAS_FISCAIS I ON I.NUMERO = N.NUMERO
GROUP BY N.CPF, CONVERT(VARCHAR(7),N.DATA_VENDA, 120);

--2� Comparando o volume de compra real com o estimado:
SELECT CPF, NOME, VOLUME_DE_COMPRA FROM TABELA_DE_CLIENTES;

SELECT
C.CPF,
C.NOME,
C.VOLUME_DE_COMPRA,
TV.MES_ANO,
TV.QUANTIDADE_TOTAL_POR_LITROS,
(CASE WHEN C.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL_POR_LITROS THEN 'Vendas V�lidas'
ELSE 'Vendas Inv�lidas' END) AS RESULTADO
FROM TABELA_DE_CLIENTES C
INNER JOIN (SELECT
            N.CPF,
			CONVERT(VARCHAR(7),N.DATA_VENDA, 120) AS MES_ANO,
			SUM(I.QUANTIDADE) AS QUANTIDADE_TOTAL_POR_LITROS
			FROM NOTAS_FISCAIS N
			INNER JOIN ITENS_NOTAS_FISCAIS I ON I.NUMERO = N.NUMERO
			GROUP BY N.CPF, CONVERT(VARCHAR(7),N.DATA_VENDA, 120)) TV 
ON TV.CPF = C.CPF
WHERE TV.MES_ANO = '2015-01';

-- Verificando as diferen�as entre o real e o estimado:
SELECT
C.CPF,
C.NOME,
C.VOLUME_DE_COMPRA,
TV.MES_ANO,
TV.QUANTIDADE_TOTAL_POR_LITROS,
(CASE WHEN C.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL_POR_LITROS THEN 'Vendas V�lidas'
ELSE 'Vendas Inv�lidas' END) AS RESULTADO,
ROUND((1 - (C.VOLUME_DE_COMPRA /TV.QUANTIDADE_TOTAL_POR_LITROS)) * 100,2) AS PERCENTUAL
FROM TABELA_DE_CLIENTES C
INNER JOIN (SELECT
            N.CPF,
			CONVERT(VARCHAR(7),N.DATA_VENDA, 120) AS MES_ANO,
			SUM(I.QUANTIDADE) AS QUANTIDADE_TOTAL_POR_LITROS
			FROM NOTAS_FISCAIS N
			INNER JOIN ITENS_NOTAS_FISCAIS I ON I.NUMERO = N.NUMERO
			GROUP BY N.CPF, CONVERT(VARCHAR(7),N.DATA_VENDA, 120)) TV 
ON TV.CPF = C.CPF
WHERE TV.MES_ANO = '2015-01' AND (C.VOLUME_DE_COMPRA - TV.QUANTIDADE_TOTAL_POR_LITROS) < 0;