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

INSERT INTO SpotifyClone.pessoa_usuaria (plano_id, nome, idade)
VALUES
    (1, 'João', 25),
    (2, 'Maria', 30),
    (1, 'Carlos', 28),
    (4, 'Ana', 22),
    (2, 'Pedro', 29),
    (3, 'Sofia', 24),
    (1, 'Luís', 27),
    (4, 'Mariana', 31),
    (2, 'Rafael', 26),
    (1, 'Beatriz', 23);

INSERT INTO SpotifyClone.artista (nome)
VALUES
    ('Artista X'),
    ('Artista Y'),
    ('Artista Z'),
    ('Artista A'),
    ('Artista B'),
    ('Artista C');

INSERT INTO SpotifyClone.album (artista_id, nome, ano_lancamento)
VALUES
    (1, 'Album 1', 2017),
    (2, 'Album 2', 2018),
    (3, 'Album 3', 2019),
    (4, 'Album 4', 2020),
    (5, 'Album 5', 2021),
    (6, 'Album 6', 2022),
    (1, 'Album 7', 2023),
    (2, 'Album 8', 2024);

INSERT INTO SpotifyClone.cancao (album_id, nome, duracao_segundos)
VALUES
    (1, 'Música A', 200),
    (2, 'Música B', 201),
    (3, 'Música C', 202),
    (4, 'Música D', 203),
    (5, 'Música E', 204),
    (6, 'Música F', 205),
    (7, 'Música G', 206),
    (8, 'Música H', 207),
    (1, 'Música I', 208),
    (2, 'Música J', 209);

INSERT INTO SpotifyClone.historico_reproducao (cancao_id, pessoa_usuaria_id, data_reproducao)
VALUES
    (1, 1, '2023-08-01'),
    (2, 2, '2023-08-02'),
    (3, 1, '2023-08-03'),
    (4, 3, '2023-08-04'),
    (5, 4, '2023-08-05'),
    (6, 5, '2023-08-06'),
    (7, 6, '2023-08-07'),
    (8, 7, '2023-08-08'),
    (9, 8, '2023-08-09'),
    (10, 9, '2023-08-10'),
    (1, 10, '2023-08-11'),
    (2, 1, '2023-08-12'),
    (3, 2, '2023-08-13'),
    (4, 7, '2023-08-14'),
    (10, 4, '2023-08-15'),
    (8, 5, '2023-08-16');

INSERT INTO SpotifyClone.seguindo_artista (pessoa_usuaria_id, artista_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 1),
    (3, 4),
    (4, 2),
    (4, 3),
    (5, 4),
    (5, 5),
    (6, 6),
    (7, 1),
    (8, 2),
    (9, 3),
    (10, 4);
