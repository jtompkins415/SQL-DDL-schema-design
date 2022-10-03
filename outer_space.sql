-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  galaxy  INT REFERENCES galaxies ON DELETE CASCADE,
  moons INT[] REFERENCES moons ON DELETE CASCADE
);

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  main_star TEXT NOT NULL,
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  rotates_around INT REFERENCES planets ON DELETE CASCADE
);

INSERT INTO planets
  (name, orbital_period_in_years, galaxy, moons)
VALUES
  ('Earth', 1.00, 1, '{5}'),
  ('Mars', 1.88, 1, '{2,4}'),
  ('Venus', 0.62, 1,'{}'),
  ('Neptune', 164.8, 1, '{1,4}'),
  ('Proxima Centauri b', 0.03, 1,'{}'),
  ('Gliese 876 b', 0.23, 1,'{}');

INSERT INTO galaxies (name, main_star)
VALUES
('Milky Way', 'The Sun');

INSERT INTO moons (name, rotates_around)
VALUES
('Naiad', 4),
('Deimos', 2),
('Triton', 4),
('Phobos', 2),
('The Moon', 1);
