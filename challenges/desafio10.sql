CREATE TABLE SpotifyClone.cancoes_favoritas (
  pessoa_usuaria_id INT NOT NULL,
  cancao_id INT NOT NULL,
  FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.pessoa_usuaria(id),
  FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancao(id),
  PRIMARY KEY (pessoa_usuaria_id, cancao_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.cancoes_favoritas (pessoa_usuaria_id, cancao_id)
VALUES
  (1, 3),
  (1, 6),
  (1, 10),
  (2, 4),
  (3, 1),
  (3, 3),
  (4, 6),
  (4, 4),
  (5, 10),
  (5, 2),
  (8, 4),
  (9, 6),
  (10, 3);
