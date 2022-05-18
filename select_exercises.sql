use albums_db;
--  How many rows are in the albums table?
select count(*) as count from albums;
-- The count is 31

-- How many unique artist names are in the albums table?
select count( distinct artist) as art
from albums;
-- 23 distinct artists

-- What is the primary key for the albums table?
show create table albums;
-- Primary key is. 'id'
-- 'CREATE TABLE `albums` (
--   `id` int unsigned NOT NULL AUTO_INCREMENT,
--   `artist` varchar(240) DEFAULT NULL,
--   `name` varchar(240) NOT NULL,
--   `release_date` int DEFAULT NULL,
--   `sales` float DEFAULT NULL,
--   `genre` varchar(240) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1'

-- What is the oldest release date for any album in the albums table? What is the most recent release date?
select * from albums order by release_date asc;
-- The beatles sgt peppers date 1967

select * from albums order by release_date desc;
-- Adele 21 date 2011


-- The name of all albums by Pink Floyd
select * from albums where artist = "Pink Floyd";
-- dark side of the moon and the wall

-- The year Sgt. Pepper's Lonely Hearts Club Band was released
select * from albums where name = "Sgt. Pepper's Lonely Hearts Club Band";
-- 1967

-- The genre for the album Nevermind
select * from albums where name = "Nevermind";
-- Grunge Alternative

-- Which albums were released in the 1990s
select * from albums where release_date > 1989 and release_date < 2000;
-- id 5,12,13,14.19,21,22,26,27,28,30

-- Which albums had less than 20 million certified sales
select * from albums where sales < 20;
-- ID 9,11,15,17, 19 ,21, 22, 23, 24, 25, 26, 28, 29

-- All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
select * from albums where genre = "Rock";
-- id 15, 20, 23, 24, 30 - ?becuase "hard rock" is one string and is not breaking it up 
