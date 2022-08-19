-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  artist TEXT NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL,
  album_artist INT NOT NULL REFERENCES artists ON DELETE CASCADE,
  songs TEXT[] NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL,
  artists_produced INT[] REFERENCES artists ON DELETE CASCADE
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists INT[] REFERENCES artists,
  album TEXT REFERENCES albums,
  producers TEXT[] REFERENCES producers
);


INSERT INTO artists (artist)
VALUES
('Hanson'),
('Queen'),
('Mariah Cary'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay-Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny`s Child');

INSERT INTO albums (album_name, album_artist, songs, release_date)
VALUES
('Middle of Nowhere', 1, '{"MMMBop"}', '1997-04-15'),
('A Night at the Opera', 2, '{"Bohemian Rhapsody"}', '1975-10-31'),
('Daydream', 3, '{"One Sweet Day"}', '1995-11-14'),
('A Star is Born', 5, '{"Shallow"}', '2018-09-27'),
('Sliver Side Up', 7 , '{"How You Remind Me"}', '2001-08-21'),
('The Blueprint 3', 8, '{"New York State of Mind"}', '2009-10-20'),
('Prism', 10, '{"Dark Horse"}', '2013-12-17'),
('Hands All Over', 12, '{"Moves Like Jagger"}', '2011-06-21'),
('Let Go', 14, '{"Complicated"}', '2002-05-14'),
('The Writing`s on the Wall', 15, '{"Say My Name"}', '199-11-07');

INSERT INTO producers (producer_name, artists_produced)
VALUES
('Dust Brothers', {1}),
('Stephen Lironi' {1}),
('Roy Thomas Baker' {2}),
('Walter Afanasieff', {3,4}),
('Benjamin Rice', {5,6}),
('Rick Parshar', {7}),
('Al Shux', (8,9))
('Max Martin', {10,11}),
('Cirkut', {10,11}),
('Shellback', {12,13}),
('Benny Blanco', {12,13}),
('The Matrix', {14}),
('Darkchild', {15});


INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', {1}, 1, {1,2}),
  ('Bohemian Rhapsody', 355, '10-31-1975', {2}, 2, {3}),
  ('One Sweet Day', 282, '11-14-1995', {3,4}, 3, {4}),
  ('Shallow', 216, '09-27-2018', {5,6}, 4, {5}),
  ('How You Remind Me', 223, '08-21-2001', {7}, 5, {6}),
  ('New York State of Mind', 276, '10-20-2009', {8,9}, 6, {7}),
  ('Dark Horse', 215, '12-17-2013', {10,11}, 7, {8,9}),
  ('Moves Like Jagger', 201, '06-21-2011', {12,13}, 8, {10,11}),
  ('Complicated', 244, '05-14-2002', {14}, 9, {12}),
  ('Say My Name', 240, '11-07-1999', {15}, 10, {13});
