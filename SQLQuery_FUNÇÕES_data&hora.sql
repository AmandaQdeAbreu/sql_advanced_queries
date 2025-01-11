
/*
DATEADD: Somar ou reduzir dias, meses, anos, etc.. a uma data.
Exemplo: DATEADD(DAY,30,2024-03-01) --> Vai retornar 30 dias � frente.

DATEDIFF

DATEPART

GETDATE()
*/

-- Qual data ser� daqui a 10 dias?
SELECT GETDATE() AS DATA_HOJE, 
	   DATEADD(DY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS;

-- Qual dia foi 48 dias atr�s?
SELECT GETDATE() AS DATA_HOJE, 
	   DATEADD(DY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS,
	   DATEADD(DY, -48, GETDATE()) AS DATA_48_DIAS_ATRAS;

-- Quantos dias se passaram desde o primeiro dia do ano?
SELECT GETDATE() AS DATA_HOJE, 
	   DATEADD(DY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS,
	   DATEADD(DY, -48, GETDATE()) AS DATA_48_DIAS_ATRAS,
	   DATEDIFF (DAY,'2024-01-01', GETDATE()) AS QTD_DIAS ;

SELECT GETDATE() DATA_HOJE, DATEPART(DAY, GETDATE()) AS DATA_DE_HOJE;

-- PARA VER SE UMA DATA � V�LIDA
SELECT ISDATE('2020-02-29') -- 1 PARA V�LIDA, ERRO PARA N�O V�LIDA


/*Como seria a consulta que retornasse o nome do cliente e sua data de nascimento por extenso dia, dia da semana,
m�s e ano?

Dica: Mais uma fun��o de data que voc� deve pesquisar na documenta��o. Chama-se DATENAME. 
Use ela concatenando com o nome do cliente.

*/

SELECT GETDATE(), DATENAME(MONTH, GETDATE()) AS M�S_EM_TEXTO,
				  DATENAME(YEAR, GETDATE()) AS ANO_EM_TEXTO,
				  DATENAME(DAY, GETDATE()) AS DIA_EM_TEXTO;

SELECT * FROM TABELA_DE_CLIENTES;

SELECT NOME + ' Nasceu em ' + 
DATENAME(WEEKDAY,DATA_DE_NASCIMENTO) + ', ' +
DATENAME(DAY, DATA_DE_NASCIMENTO) + ' de ' +
DATENAME(MONTH, DATA_DE_NASCIMENTO) + ' de ' +
DATENAME(YEAR, DATA_DE_NASCIMENTO) AS DATA_EXTENSO
FROM TABELA_DE_CLIENTES;




