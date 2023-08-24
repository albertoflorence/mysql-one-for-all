SELECT COUNT(*) as musicas_no_historico
FROM SpotifyClone.historico_reproducao AS HR
JOIN SpotifyClone.pessoa_usuaria AS PU
  ON HR.pessoa_usuaria_id = PU.id
WHERE  PU.nome = "Barbara Liskov";
