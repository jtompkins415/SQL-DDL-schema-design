DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    preferred_region INT REFERENCES regions ON DELETE CASCADE
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    post_text TEXT,
    user_id INT REFERENCES users ON DELETE CASCADE,
    user_location TEXT,
    region_id INT REFERENCES regions ON DELETE CASCADE
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL
);

CREATE TABLE categories_posts (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts ON DELETE CASCADE,
    category_id INT REFERENCES categories ON DELETE CASCADE
);

-- REGIONS

INSERT INTO regions (region_name)
VALUES
('San Francisco'),
('New York'),
('Sacramento'),
('Los Angeles');


-- USERS

INSERT INTO users (username, preferred_region)
VALUES
('scottie_pip32', 1),
('S00P3RJUAN31', 4),
('B1gTank_24', 3),
('H1SquAr3', 1),
('caitlinaterry', 2);

-- POSTS

INSERT INTO posts(title, post_text, user_id, user_location, region_id)
VALUES
('Ball is Life', 'dsjabfjaskbfg', 3, 'Land Park', 3),
('Have you ever done pottery', 'sagasgasg', 1, 'SOMA', 1),
('The Weather Outside is Weather', 'asfagdsagasg',4, 'Highland Park', 4),
('Do you still 2k', 'dsafagads', 3, 'Brooklyn', 2),
('Stadia or Amazon Game', 'adsgagewqrgq', 2, 'Bayview-Hunter`s Point', 1);

-- CATERGORIES

INSERT INTO categories (category_name)
VALUES
('Sports'),
('Weather'),
('Games'),
('Arts');

-- CATEGORIES_POSTS

INSERT INTO categories_posts (post_id, category_id)
VALUES
(1, 1),
(2, 4),
(1, 3),
(3, 3),
(3, 4),
(4, 3);

