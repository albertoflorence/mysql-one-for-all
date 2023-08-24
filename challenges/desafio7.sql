SELECT
  AR.nome AS artista,
  AL.nome AS album,
  COUNT(SA.artista_id) AS pessoas_seguidoras
FROM SpotifyClone.album AS AL
JOIN SpotifyClone.artista AS AR
  ON AL.artista_id = AR.id
JOIN SpotifyClone.seguindo_artista AS SA
  ON AR.id = SA.artista_id
GROUP BY AL.id
ORDER BY pessoas_seguidoras DESC, AR.nome, AL.nome;
