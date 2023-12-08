--ATRAVÉS DO LEAD É POSSÍVEL CRIAR UMA RELAÇÃO ENTRE UMA LINHA E A OU AS LINHAS ABAIXO A MESMA [LAG(COLUNA, QUANTIDADE LINHAS ABAIXO)]
WITH CTE AS (
              SELECT 
                    EXTRACT(YEAR FROM DATNAS) AS ANO,
                    COUNT(*) AS QNT_NASCIDOS
                FROM SCHEMA.TABELA
                GROUP BY EXTRACT(YEAR FROM DATNAS)
                ORDER BY EXTRACT(YEAR FROM DATNAS)
), CTE2 AS (
		SELECT 
		    ANO,
		    QNT_NASCIDOS,
		    LEAD(ANO, 1) OVER (ORDER BY ANO) AS PROXIMO_ANO,
		    LEAD(QNT_NASCIDOS, 1) OVER (ORDER BY ANO) AS QNT_PROXIMO
		FROM CTE
	)	
		SELECT 
			ANO||' - '||QNT_NASCIDOS AS ANO_NASCIDOS,
			PROXIMO_ANO|| ' - '||QNT_PROXIMO AS ANO_NASCIDOS_PROX,
			QNT_NASCIDOS - QNT_PROXIMO AS DIF_PROXIMO_ANO
	        FROM CTE2
