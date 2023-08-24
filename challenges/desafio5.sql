SELECT C.nome AS cancao, COUNT(C.id) AS reproducoes
FROM SpotifyClone.historico_reproducao AS H
JOIN SpotifyClone.cancao as C
  ON H.cancao_id = C.id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2
