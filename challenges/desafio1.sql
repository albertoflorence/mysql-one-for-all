DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plano (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    valor DECIMAL(5,2)
) engine = InnoDB;

CREATE TABLE SpotifyClone.pessoa_usuaria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    plano_id INT,
    nome VARCHAR(255),
    idade INT,
    FOREIGN KEY (plano_id) REFERENCES plano(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artista (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
) engine = InnoDB;

CREATE TABLE SpotifyClone.album (
    id INT PRIMARY KEY AUTO_INCREMENT,
    artista_id INT,
    nome VARCHAR(255),
    ano_lancamento INT,
    FOREIGN KEY (artista_id) REFERENCES artista(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    album_id INT,
    nome VARCHAR(255),
    duracao_segundos INT,
    FOREIGN KEY (album_id) REFERENCES album(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico_reproducao (
    cancao_id INT,
    pessoa_usuaria_id INT,
    data_reproducao DATE,
    FOREIGN KEY (cancao_id) REFERENCES cancao(id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria(id),
    PRIMARY KEY (pessoa_usuaria_id, cancao_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguindo_artista (
    pessoa_usuaria_id INT,
    artista_id INT,
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria(id),
    FOREIGN KEY (artista_id) REFERENCES artista(id),
    PRIMARY KEY (pessoa_usuaria_id, artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plano (tipo, valor)
VALUES
    ('Plano Básico', 15.00),
    ('Plano Premium', 30.00),
    ('Plano Família', 40.00),
    ('Plano Master', 60.00);

INSERT INTO SpotifyClone.plano (tipo, valor)
VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

INSERT INTO SpotifyClone.pessoa_usuaria (plano_id, nome, idade)
VALUES
  (1, 'Barbara Liskov', 82),
  (1, 'Robert Cecil Martin', 58),
  (2, 'Ada Lovelace', 37),
  (2, 'Martin Fowler', 46),
  (2, 'Sandi Metz', 58),
  (3, 'Paulo Freire', 19),
  (3, 'Bell Hooks', 26),
  (4, 'Christopher Alexander', 85),
  (4, 'Judith Butler', 45),
  (4, 'Jorge Amado', 58);

INSERT INTO SpotifyClone.artista (nome)
VALUES
    ('Beyoncé'),
    ('Elis Regina'),
    ('Queen'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

INSERT INTO SpotifyClone.album (artista_id, nome, ano_lancamento)
VALUES
    (1, 'Renaissance', 2022),
    (3, 'Jazz', 1978),
    (3, 'Hot Space', 1982),
    (2, 'Falso Brilhante', 1998),
    (2, 'Vento de Maio', 2001),
    (4, 'QVVJFA?', 2003),
    (5, 'Somewhere Far Beyond', 2007),
    (6, 'I Put A Spell On You', 2012);

INSERT INTO SpotifyClone.cancao (album_id, nome, duracao_segundos)
VALUES
    (1, "BREAK MY SOUL", 279),
    (1, "VIRGO'S GROOVE", 369),
    (1, "ALIEN SUPERSTAR", 116),
    (2, "Don't Stop Me Now", 203),
    (3, "Under Pressure", 152),
    (4, "Como Nossos Pais", 105),
    (5, "O Medo de Amar é o Medo de Ser Livre", 207),
    (6, "Samba em Paris", 267),
    (7, "The Bard's Song", 244),
    (8, "Feeling Good", 100);

INSERT INTO SpotifyClone.historico_reproducao (cancao_id, pessoa_usuaria_id, data_reproducao)
VALUES
    (8, 1, '2022-02-28 10:45:55'),
    (2, 1, '2020-05-02 05:30:35'),
    (10, 1, '2020-03-06 11:22:33'),
    (10, 2, '2022-08-05 08:05:17'),
    (7, 2, '2020-01-02 07:40:33'),
    (10, 3, '2020-11-13 16:55:13'),
    (2, 3, '2020-12-05 18:38:30'),
    (8, 4, '2021-08-15 17:10:10'),
    (8, 5, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (7, 6, '2017-01-24 00:31:17'),
    (1, 6, '2017-10-12 12:35:20'),
    (4, 7, '2011-12-15 22:30:49'),
    (4, 8, '2019-06-05 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (3, 10, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.seguindo_artista (pessoa_usuaria_id, artista_id)
VALUES
    (1, 1),
    (1, 3),
    (1, 2),
    (2, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (7, 6),
    (7, 3),
    (8, 2),
    (9, 3),
    (10, 3);
