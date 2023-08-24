SELECT
  MIN(ROUND(PL.valor, 2)) AS faturamento_minimo,
  MAX(ROUND(PL.valor, 2)) AS faturamento_maximo,
  CAST(AVG(ROUND(PL.valor, 2)) AS DECIMAL(10, 2)) AS faturamento_medio,
  SUM(ROUND(PL.valor , 2)) AS faturamento_total
FROM SpotifyClone.plano AS PL
JOIN SpotifyClone.pessoa_usuaria AS PU
  ON PL.id = PU.plano_id
