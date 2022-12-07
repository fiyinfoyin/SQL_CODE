SELECT *
FROM DBO.movie_data$

--insert values where there are nulls in Movie Title column
SELECT *
FROM DBO.movie_data$
WHERE [Movie Title] IS NULL

UPDATE movie_data$
SET [Movie Title] = 42
WHERE [Budget ]=40000000.00 AND Revenue=97500000.00

UPDATE movie_data$
SET [Movie Title] = 71
WHERE [Budget ]=8100000.00 AND Revenue=2900000.00

--Create a column for year and update it
ALTER TABLE movie_data$
ADD Release_year int

UPDATE movie_data$
SET Release_year = DATEPART(YEAR,[Release Date])

--create a column for profit or loss
ALTER TABLE movie_data$
ADD Earnings int
 
UPDATE movie_data$
SET Earnings
= (Revenue-Budget)
(
SELECT *,
CASE
	WHEN Earnings>0 THEN 'Profit'
	WHEN Earnings<0 THEN 'Loss'
	ELSE 'Breakeven'
END AS Earning_statement
FROM DBO.movie_data$
)

--rank movies by genre
SeLECT 
[Movie Title],
Genre,
Revenue,
DENSE_RANK() OVER(PARTITION BY Genre ORDER BY Revenue DESC) AS Ranking
FROM DBO.movie_data$

--rank movies by year
SELECT
[Movie Title],
Revenue,
Release_year,
Genre,
DENSE_RANK() OVER(PARTITION BY Release_year ORDER BY Revenue DESC) AS rank_by_year
FROM DBO.movie_data$







