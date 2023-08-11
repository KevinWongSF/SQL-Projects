-- Table Creation --

CREATE TABLE credits
(person_id INT AUTO_INCREMENT PRIMARY KEY, 
id VARCHAR(100000),
name VARCHAR(100),
character VARCHAR(100),
role VARCHAR(100),
);

CREATE TABLE titles
(id INT AUTO_INCREMENT PRIMARY KEY, 
title  VARCHAR(1000),
description VARCHAR(10000)
release_year INT,
age_certification VARCHAR(1000),
runtime INT,
genres VARCHAR(100),
production_countries VARCHAR(100),
seasons VARCHAR(100),
imdb_id VARCHAR(100),
imdb_score DOUBLE,
imdb_votes DOUBLE,
tmdb_popularity DOUBLE,
tmdb_score DOUBLE);

-- Cleaning Data --

-- Removal of age_certification and seasons, because there are more than 80% null values

ALTER TABLE prime.video.title
DROP COLUMN age_certification

ALTER TABLE prime.video.title
DROP COLUMN seasons

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Checking for duplicates within the table -- 

SELECT  id, title, COUNT(*) as duplicate FROM titles
GROUP BY id, title 
HAVING duplicate > 1

-- Delete the duplicates using self-join  -- 

DELETE FROM prime_video.titles
WHERE id in(
	SELECT FROM titles AS t1
	JOIN titles AS t2 on 
	t1.id = t2.id AND t1.title = t2.title
	WHERE 
    t1.id<t2.id
    )
    
--------------------------------------------------------------------------------------------------------------------------------------------------

-- Check for Null values 

SELECT * FROM titles

SELECT * FROM credits
WHERE credits.character IS NULL OR credits.character = ''

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Standardizing the "type" Column to have lower case

SELECT UPPER(LEFT(type,1)) + SUBSTRING(type, 2, len(type)) FROM titles

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Clear all missing spaces between names -- 

SELECT trim(name) FROM credits

UPDATE prime_video.credits
SET name = trim(name) 

---------------------------------------------------------------------------------------------------------------------------------------------------

-- Filling the empty space with "UNKNOWN" if there is a null or missing value -- 

UPDATE prime_video.credits.character
SET character = 'UNKNOWN' 
WHERE character = ''

---------------------------------------------------------------------------------------------------------------------------------------------------