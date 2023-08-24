SELECT
  AR.nome AS artista, AL.nome AS album
FROM SpotifyClone.artista AS AR
JOIN SpotifyClone.album AS AL
  ON AR.id = AL.artista_id
WHERE AR.nome = 'Elis Regina';
