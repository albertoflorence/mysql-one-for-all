SELECT
  P.nome AS pessoa_usuaria,
  COUNT(H.pessoa_usuaria_id) AS musicas_ouvidas,
  SUM(ROUND(C.duracao_segundos / 60, 2)) AS total_minutos
FROM SpotifyClone.pessoa_usuaria AS P
JOIN SpotifyClone.historico_reproducao AS H
ON P.id = H.pessoa_usuaria_id
JOIN SpotifyClone.cancao as C
ON H.cancao_id = C.id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;
