-- Create Table -- 

CREATE TABLE credits
(Dates VARCHAR(100),
Category VARCHAR(100),
Descript VARCHAR(10000),
DayOfWeek VARCHAR(100),
PdDistrict VARCHAR(1000),
Resolution VARCHAR(10000),
Address VARCHAR(100),
X DOUBLE,
Y DOUBLE,
);

-- All differnt distinct crimes in database

SELECT COUNT(DISTINCT(Category)) FROM crime ;

---------------------------------------------------------------------------------------------------------------------------------------------------

-- THE most frequent crime in San Francisco

SELECT Category, COUNT(Category) AS occurance  FROM crime
GROUP BY category
ORDER BY occurance DESC 
LIMIT 1

---------------------------------------------------------------------------------------------------------------------------------------------------

-- WHICH day has the most crime

SELECT dayofweek, count(*) FROM crime
GROUP BY dayofweek

---------------------------------------------------------------------------------------------------------------------------------------------------

  -- Percentage of LARCENY/THEFT happening on day of week 

WITH a AS
(SELECT dayofweek, count(*) AS crime_on_day FROM crime
WHERE Category = 'LARCENY/THEFT'
GROUP BY dayofweek
)

SELECT dayofweek, crime_on_day/ (SELECT SUM(crime_on_day)FROM a) * 100 AS chance_of_crime FROM a
ORDER BY chance_of_crime DESC
    
    
---------------------------------------------------------------------------------------------------------------------------------------------------

  --  Percentage of crimes happening on the weekend
WITH a AS
(
SELECT SUM(CASE 
	WHEN DayOfWeek = 'Saturday' THEN 1
    WHEN DayOfWeek = 'Sunday' THEN 1 
    ELSE NULL 
    END)
    AS crimes_on_weekend
	FROM crime
)
    
SELECT crimes_on_weekend /(SELECT COUNT(*) FROM CRIME) * 100 AS Percentage_of_Crimes_on_Weekends FROM a

---------------------------------------------------------------------------------------------------------------------------------------------------

-- Rank the safest District with the least amount of THEFT

SELECT ROW_NUMBER() OVER(ORDER BY COUNT(*) ), pddistrict, COUNT(*) as theft FROM crime 
WHERE Category = 'LARCENY/THEFT'
GROUP BY pddistrict
ORDER BY theft ASC

---------------------------------------------------------------------------------------------------------------------------------------------------

-- Percentage of Crime in each District

WITH a AS
(SELECT pddistrict, count(*) AS crime_district FROM crime
GROUP BY pddistrict
)

SELECT pddistrict, crime_district/ (SELECT SUM(crime_district)FROM a) * 100 AS crime_in_district FROM a
ORDER BY pddistrict DESC

---------------------------------------------------------------------------------------------------------------------------------------------------

-- Creating a table for Longitude and Latitude for visual

SELECT Category, PdDistrict,X ,Y FROM CRIME
ORDER BY pddistrict ASC

---------------------------------------------------------------------------------------------------------------------------------------------------

 -- Progression of theft on a timeline
 
 SELECT DateConverted, COUNT(*) AS theft FROM crime
 WHERE Category = 'LARCENY/THEFT'
 GROUP BY dateconverted
 ORDER BY dateconverted ASC
 
 ------------------------------------------------------------------------------------------------------------------------------------------------
 
 -- Crime by Percentage( Crime percentage is greater than 1)

WITH a AS 
	(SELECT  category , COUNT(*) AS cateogry_crime FROM crime
	GROUP BY category)
    
SELECT category, cateogry_crime/(SELECT SUM(cateogry_crime) FROM a) * 100 AS percent_crime FROM a
HAVING percent_crime >= 1
ORDER BY percent_crime DESC

-- What percentage of crime is Theft

SELECT SUM(if(category = 'LARCENY/THEFT', 1, null)) / COUNT(category) AS TheftPercentage FROM crime

 ------------------------------------------------------------------------------------------------------------------------------------------------
 
 -- Because we want to order by the date and not the exact time, I will create a new column excluding the time
 
SELECT Dates, CONVERT(Dates, DATE) AS Converted_Date FROM crime

ALTER TABLE CRIME 
ADD DateConverted DATE;

UPDATE CRIME
SET DateConverted = CONVERT(Dates, DATE)

------------------------------------------------------------------------------------------------------------------------------------------------

--  Views to store data for later visualization

CREATE VIEW crime_likelihood_by_day AS 

WITH a AS
(SELECT dayofweek, count(*) AS crime_on_day FROM crime
GROUP BY dayofweek
)

SELECT dayofweek, crime_on_day/ (SELECT SUM(crime_on_day)FROM a) * 100 AS chance_of_crime FROM a
ORDER BY chance_of_crime DESC

------------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW map AS 

SELECT Category, PdDistrict,X ,Y FROM CRIME
ORDER BY pddistrict ASC

------------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW Theft_Frequency_by_day 

WITH a AS
(SELECT dayofweek, count(*) AS crime_on_day FROM crime
WHERE Category = 'LARCENY/THEFT'
GROUP BY dayofweek
)

SELECT dayofweek, crime_on_day/ (SELECT SUM(crime_on_day)FROM a) * 100 AS chance_of_crime FROM a
ORDER BY chance_of_crime DESC
