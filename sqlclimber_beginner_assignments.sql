/* 
these come from https://www.sqlclimber.com/assignments/beginner 
they have data and a compiler integrated in their site so some parts might not translate well here
but I'll do my best to preserve important intermediaries and my solutions in this document all the same :D
*/

-- #1): Select all columns 
-- Return all columns and all rows from the Country table.

SELECT * from Country 


-- #2): Select specified columns 1
-- Return the Name and Capital columns from the Country table.

Select Name, Capital FROM Country

-- in their suggestion they suggest a format like this:

SELECT 
	Name
	,Capital
FROM Country 

-- #3): Select specified columns 2
-- Return the Name and Description columns from the TouristAttraction table.

SELECT
	Name
	,Description
FROM TouristAttraction

-- #4): Table alias
-- Return the Name and Capital columns from the Country table. Use c as the alias for the Country table.

SELECT c.Name, c.Capital 
FROM Country as c

-- or should I say

SELECT 
	c.Name
	,c.Capital 
FROM Country as c 

-- and I see in their solution that you can actually omit the "as" as well for 

SELECT 
	c.Name
	,c.Capital
FROM Country c


-- #5): Column alias 1
/*
    Return these columns from the Country table:
    - Name with the alias CountryName
    - Capital without changing its name
    - CurrencyCode with the alias Currency

    Use c as the alias for the Country table.
*/

SELECT
	c.Name as CountryName
    ,c.Capital
    ,c.CurrencyCode as Currency
FROM Country c

-- in their solution I see another alternative alias syntax

SELECT
	CountryName = c.Name
	,c.Capital
	,Currency = c.CurrencyCode
FROM Country c

-- #6): Column alias 2
/*
    Return these columns from the Country table:
    - Name with the alias Country name
    - Capital without changing its name
    - CurrencyCode with the alias Currency code

    Use c as the alias for the Country table.

*/

SELECT
	"Country name" = c.Name
    ,c.Capital
    ,"Currency code" = c.CurrencyCode
FROM Country c

-- #7): Records order 1
-- Return the Name column from the Country table. Sort the rows by Name in ascending order.

SELECT
	Name
FROM
	Country
ORDER BY Name ASC

-- #8): Records order 2
-- Return the Name and Capital columns from the Country table. Sort the rows by Capital in descending order.

SELECT
	Name
    ,Capital
FROM 
	Country
ORDER BY Capital DESC

-- #9): Records order 3
/*
    Return the Name, EuropeUnionMember, and Population columns from the Country table.

    First, sort the rows by EuropeUnionMember in descending order.
    Then sort rows with the same EuropeUnionMember value by Population in descending order.
*/

SELECT
	Name
    ,EuropeUnionMember
    ,Population
FROM Country
ORDER BY EuropeUnionMember DESC, Population DESC

-- #10): Select the first 5 records
-- Return all columns for the five countries with the smallest population.

SELECT TOP 5 *	
FROM Country
ORDER BY Population ASC

-- I see there's some disagreement across SQL frameworks as to whether this is a "LIMIT" or a "TOP n"


-- #11): Simple condition 1
-- Return all columns for countries whose Capital is Madrid.

SELECT *
FROM Country c
WHERE c.Capital = 'Madrid'

-- #12): Simple condition 2
-- Return all columns for countries with a population greater than 50 million.

SELECT *
FROM Country c
WHERE c.Population > 50000000

-- #13): Simple condition 3
-- Return all columns for countries whose Id is not equal to 2.

SELECT * 
FROM Country c
WHERE c.Id != 2

-- #14): Simple condition 4
-- Return all columns for countries whose Id is less than or equal to 3.

SELECT *
FROM Country c
WHERE c.Id <= 3

-- #15): Simple condition 5
-- Return all columns for countries with a population greater than or equal to 44 million.

SELECT *
FROM Country c
WHERE c.Population >= 44000000

 
-- #16): Multiple simple conditions 1
/*
	Return all columns for countries that meet both conditions:
    - They are members of the European Union.
    - They do not use the euro.
*/