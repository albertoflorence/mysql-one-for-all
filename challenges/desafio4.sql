SELECT
  nome AS pessoa_usuaria,
  CASE WHEN YEAR(MAX(H.data_reproducao)) >= 2021
    THEN 'Ativa'
    ELSE 'Inativa'
    END
  AS status_pessoa_usuaria
FROM SpotifyClone.pessoa_usuaria AS P
JOIN SpotifyClone.historico_reproducao AS H
  ON P.id = H.pessoa_usuaria_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;
