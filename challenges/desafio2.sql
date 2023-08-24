SELECT
  (SELECT COUNT(id) FROM SpotifyClone.cancao) AS cancoes,
  (SELECT COUNT(id) FROM SpotifyClone.album) AS albuns,
  (SELECT COUNT(id) FROM SpotifyClone.artista) AS artistas;
