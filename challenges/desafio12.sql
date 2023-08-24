SELECT
  AR.nome as artista,
  CASE
    WHEN COUNT(CF.cancao_id) >= 5 THEN 'A'
    WHEN COUNT(CF.cancao_id) BETWEEN 3 AND 4 THEN 'B'
    WHEN COUNT(CF.cancao_id) BETWEEN 1 AND 2 THEN 'C'
    ELSE '-'
  END
  AS ranking
FROM SpotifyClone.artista AS AR
JOIN SpotifyClone.album AS AL ON AL.artista_id = AR.id
JOIN SpotifyClone.cancao AS C ON C.album_id = AL.id
LEFT JOIN SpotifyClone.cancoes_favoritas AS CF ON CF.cancao_id = C.id
GROUP BY AR.nome
ORDER BY CASE WHEN ranking = '-' THEN 1 else 0 END, ranking, artista;
