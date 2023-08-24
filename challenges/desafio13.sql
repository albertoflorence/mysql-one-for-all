SELECT
  CASE
    WHEN P.idade <= 30 THEN 'Até 30 anos'
    WHEN P.idade BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
    WHEN P.idade > 60 THEN 'Maior de 60 anos'
  END AS faixa_etaria,
  COUNT(DISTINCT P.id) as total_pessoas_usuarias,
  COUNT(CF.pessoa_usuaria_id) as total_favoritadas
FROM SpotifyClone.pessoa_usuaria AS P
LEFT JOIN SpotifyClone.cancoes_favoritas AS CF ON CF.pessoa_usuaria_id = P.id
GROUP BY faixa_etaria
ORDER BY CASE
          WHEN faixa_etaria = 'Até 30 anos' THEN 1
          WHEN faixa_etaria = 'Entre 31 e 60 anos' THEN 2
          ELSE 3
         END;
