DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams (
    id SERIAL,
    team_name TEXT NOT NULL PRIMARY KEY,
    wins INT CHECK (wins >= 0),
    draws INT CHECK (draws >=0),
    loses INT CHECK (loses >=0)
);

CREATE TABLE players (
    id SERIAL,
    player_name TEXT NOT NULL PRIMARY KEY,
    plays_for TEXT REFERENCES teams(team_name) ON DELETE SET NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    referee_name TEXT NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1_name TEXT REFERENCES teams(team_name),
    team2_name TEXT REFERENCES teams(team_name),
    match_score TEXT,
    refereed_by INT REFERENCES referees 
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    match_id INT REFERENCES matches,
    scored_by TEXT REFERENCES players(player_name)
);


-- TEAMS

INSERT INTO teams (team_name, wins, draws, loses)
VALUES
('Liverpool F.C.', 28, 8, 3),
('Manchester City F.C.', 29, 6, 3),
('Manchester United F.C.', 16, 10, 12),
('Chelsea', 21, 11, 6),
('Tottenham', 22, 5, 11),
('Arsenal', 22, 3, 13);

-- PLAYERS

INSERT INTO players (player_name, plays_for)
VALUES
('Erling Haaland', 'Manchester City F.C.'),
('Cristiano Ronaldo', 'Manchester United F.C.'),
('Darwin Nunez', 'Liverpool F.C.'),
('Raheem Sterling', 'Chelsea'),
('Kevin De Bruyne', 'Manchester City F.C.'),
('Gabriel Jesus', 'Arsenal');

-- REFEREES

INSERT INTO referees (referee_name)
VALUES
('Todd McClaren'),
('Bob Macaffey'),
('Lisa McCready'),
('Joey Milagro'),
('Loren Hilltop'),
('Jane Walgrove');

-- MATCHES

INSERT INTO matches (team1_name, team2_name, match_score, refereed_by)
VALUES
('Chelsea', 'Tottenham', '2-2', 1),
('Manchester City F.C.', 'Liverpool F.C.', '4-1', 4),
('Chelsea', 'Manchester City F.C.', '1-0', 2),
('Arsenal', 'Manchester City F.C.', '0-5', 6),
('Arsenal', 'Tottenham', '3-1', 3);

-- GOALS

INSERT INTO goals (match_id, scored_by)
VALUES
(2, 'Darwin Nunez'),
(3, 'Kevin De Bruyne'),
(5, 'Gabriel Jesus');