SELECT
  AL.nome AS album,
  COUNT(AL.nome) AS favoritadas
FROM SpotifyClone.cancoes_favoritas AS CF
JOIN SpotifyClone.cancao AS C ON C.id = CF.cancao_id
JOIN SpotifyClone.album AS AL ON AL.id = C.album_id
GROUP BY AL.nome
ORDER BY favoritadas DESC, album
LIMIT 3;
