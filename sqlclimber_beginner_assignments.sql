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

SELECT *
FROM Country c
WHERE c.EuropeUnionMember = 1 AND c.CurrencyCode != 'EUR'


-- #17): Multiple simple conditions 2
-- Return all columns for countries whose capital is Amsterdam, Paris, or Madrid.

SELECT *
FROM Country c
WHERE c.Capital IN ('Amsterdam','Paris','Madrid')


-- #18): Multiple simple conditions 3
/*
    Return all columns for countries in either of these population ranges:
    - From 10 million to 20 million, including both limits.
    - From 44 million to 55 million, including both limits.

*/

SELECT * 
FROM Country c
WHERE c.Population BETWEEN 10000000 AND 20000000 OR c.Population BETWEEN 44000000 AND 55000000

/*
The solution's condition is much better-organized, like 
WHERE (c.Population >= 10000000 AND c.Population <= 20000000)
   OR (c.Population >= 44000000 AND c.Population <= 55000000)
but doesn't use "BETWEEN", because it's about to be introduced...
*/

-- #19): Condition BETWEEN 1
/*
    Return all columns for countries in either of these population ranges:
    - From 10 million to 20 million.
    - From 44 million to 55 million.

*/

SELECT * 
FROM Country c
WHERE c.Population BETWEEN 10000000 AND 20000000 OR c.Population BETWEEN 44000000 AND 55000000


-- #20): Condition BETWEEN 2
-- Return all columns for countries whose population is not between 15 million and 55 million.

SELECT *
FROM Country c
WHERE c.population NOT BETWEEN 15000000 AND 55000000


-- #21): Condition LIKE 1
-- Return all columns for countries whose capital starts with the letter A.

SELECT *
FROM Country c
WHERE c.Capital LIKE 'A%'


-- #22): Condition LIKE 2
-- Return all columns for countries whose capital ends with the letter e.

SELECT *
FROM Country c
WHERE c.Capital LIKE '%e'


-- #23): Condition LIKE 3
-- Return all columns for countries whose capital contains the letter a

SELECT *
FROM Country c
WHERE c.capital LIKE '%a%'


-- #24): Condition NULL 1
-- Return all columns for countries that have no CurrencyCode VALUE

SELECT *
FROM Country c
WHERE CurrencyCode IS NULL

-- #25): Condition NULL 2
-- Return all columns for countries that have a CurrencyCode value 

SELECT *
FROM Country c 
WHERE CurrencyCode IS NOT NULL


-- #26): Condition NULL 3
/*
    Return all columns for countries that do not use the euro.

    Include countries whose CurrencyCode is different from EUR
    and countries that have no CurrencyCode value.

*/

SELECT *
FROM Country c 
WHERE c.CurrencyCode != 'EUR' OR CurrencyCode IS NULL


-- #27): Multiple condition 1
/*
    Select countries that match all of the following conditions:
    - They are members of the European Union.
    - Their population is between 25 million and 100 million.
    - They use the euro.

    Return all columns and use BETWEEN for the population range.
*/

SELECT *
FROM Country c
WHERE 
	c.EuropeUnionMember = 1
    AND c.Population BETWEEN 25000000 AND 100000000
    AND c.CurrencyCode = 'EUR'


-- #28): Multiple condition 2
/*
    Return all columns for countries that meet at least one condition:
    - They have no CurrencyCode value.
    - Their CurrencyCode is different from EUR.

*/

SELECT *
FROM Country c 
WHERE c.CurrencyCode != 'EUR' OR c.CurrencyCode IS NULL


-- #29): Multiple condition 3
/*
    Return all columns for countries that meet at least one condition:
    - They are not members of the European Union.
    - Their name contains more than one word.

*/

SELECT *
FROM Country c 
WHERE c.EuropeUnionMember != 1 OR TRIM(c.Name) LIKE '% %'


-- #30): Select variables
/*
    The variables @CountryName and @Capital are already declared below.

    Your task:
    Return their values as a one-row result with these columns:
    - CountryName containing the value of @CountryName
    - Capital containing the value of @Capital

DECLARE @CountryName NVARCHAR(100) = 'France'
DECLARE @Capital NVARCHAR(100) = 'Paris'
*/

SELECT @CountryName as CountryName, @Capital as Capital


-- #31): Set variables 1
/*
    The variables @CountryName and @Capital are declared without values.

    Your task:
    - Set @CountryName to New Zealand.
    - Set @Capital to Wellington.

DECLARE @CountryName NVARCHAR(100)
DECLARE @Capital NVARCHAR(100)
*/

SET @CountryName = 'New Zealand'
SET @Capital = 'Wellington'


-- #32): Set variables 2
/*

    Four variables containing country names are declared below.

    Your task:
    Set @CountryNameCsv to all four country names separated by commas.

    Required format: {country 1},{country 2},{country 3},{country 4}

DECLARE @CountryName1 NVARCHAR(100) = 'Germany'
DECLARE @CountryName2 NVARCHAR(100) = 'France'
DECLARE @CountryName3 NVARCHAR(100) = 'Italy'
DECLARE @CountryName4 NVARCHAR(100) = 'Spain'
DECLARE @CountryNameCsv NVARCHAR(100)
*/

SET @CountryNameCsv = @CountryName1 + ',' + @CountryName2 + ',' + @CountryName3 + ',' + @CountryName4


-- #33): Set variables 3
/*
    The length and width of a rectangle are declared below.

    Your task:
    - Calculate the area and set @RectangleArea to the result.
    - Calculate the perimeter and set @RectanglePerimeter to the result.

DECLARE @RectangleLength INT = 12 
DECLARE @RectangleWidth INT = 5

DECLARE @RectangleArea INT
DECLARE @RectanglePerimeter INT
*/

SET @RectangleArea = @RectangleLength*@RectangleWidth
SET @RectanglePerimeter = (@RectangleLength*2)+(@RectangleWidth*2)


-- #34): Use Variables 1
/*
    The variable @Capital is declared below.

    Your task:
    Return all columns for the country whose Capital matches the value of @Capital.

DECLARE @Capital NVARCHAR(100) = 'Madrid'
*/

SELECT *
FROM Country c
WHERE c.Capital = @Capital


-- #35): Use variables 2
/*
    The variables @MinimalPopulation and @MaximumPopulation are declared below.

    Your task:
    Return all columns for countries whose Population is between these two variable values.

DECLARE @MinimalPopulation INT = 10000000
DECLARE @MaximumPopulation INT = 30000000
*/

SELECT * 
FROM Country c
WHERE c.Population BETWEEN @MinimalPopulation AND @MaximumPopulation


-- #36): Use variables 3
/*
    @CountryId contains the Id of a country. The other variables are declared without values.

    Your task:
    Find the country whose Id matches @CountryId and set:
    - @CountryName to its Name
    - @Capital to its Capital
    - @Population to its Population

DECLARE @CountryId INT = 9
DECLARE @CountryName NVARCHAR(100)
DECLARE @Capital NVARCHAR(100)
DECLARE @Population INT
*/

SET @CountryName = (SELECT c.Name FROM Country c WHERE c.Id = @CountryId)
SET @Capital = (SELECT c.Capital FROM Country c WHERE c.Id = @CountryId)
SET @Population = (SELECT c.Population FROM Country c WHERE c.Id = @CountryId)

-- I like their solution more

SELECT
    @CountryName = c.Name
   ,@Capital = c.Capital
   ,@Population = c.Population
FROM Country c
WHERE c.Id = @CountryId


-- #37): Declare variable 1
/*
    Your task:
    Declare @Capital with the data type NVARCHAR(100) and set it to Wellington.

    The value is selected at the end of the script so that your declaration can be checked.

*/

DECLARE @Capital NVARCHAR(100) = 'Wellington'


-- #38): Declare Variable 2
/*
    Your task:
    - Declare @TouristAttraction as NVARCHAR(100) and set it to @Value1.
    - Declare @Description as NVARCHAR(500) and set it to @Value2.
DECLARE @Value1 NVARCHAR(1000) = 'Machu Picchu'
DECLARE @Value2 NVARCHAR(1000) = 'Machu Picchu is an Incan citadel set high in the Andes Mountains in Peru, above the Urubamba River valley. Built in the 15th century and later abandoned, it’s renowned for its sophisticated dry-stone walls that fuse huge blocks without the use of mortar, intriguing buildings that play on astronomical alignments and panoramic views. Its exact former use remains a mystery.'
*/

DECLARE @TouristAttraction NVARCHAR(100) = @Value1
DECLARE @Description NVARCHAR(500) = @Value2


-- #39): Declare Variable 3
/*
    The maximum length of a text data type is important. A value may be shortened if the
    destination variable is too small.

    Your task:
    - Declare @Description500 as NVARCHAR(500) and set it to @Description.
    - Declare @Description100 as NVARCHAR(100) and set it to @Description.
    - Declare @Description20 as NVARCHAR(20) and set it to @Description.

DECLARE @Description NVARCHAR(1000) = 'Machu Picchu is an Incan citadel set high in the Andes Mountains in Peru, above the Urubamba River valley. Built in the 15th century and later abandoned, it’s renowned for its sophisticated dry-stone walls that fuse huge blocks without the use of mortar, intriguing buildings that play on astronomical alignments and panoramic views. Its exact former use remains a mystery.'
*/

DECLARE @Description500 NVARCHAR(500) = @Description
DECLARE @Description100 NVARCHAR(100) = @Description
DECLARE @Description20 NVARCHAR(20) = @Description



-- #40): Declare Variable 4
/*
    Your task:
    - Declare @DecimalScale8 as DECIMAL(18,8) and set it to @DecimalScale16.
    - Declare @DecimalScale4 as DECIMAL(18,4) and set it to @DecimalScale16.
    - Declare @DecimalScale2 as DECIMAL(18,2) and set it to @DecimalScale16.

DECLARE @DecimalScale16 DECIMAL(18,16) = PI()
*/
DECLARE @DecimalScale8 DECIMAL(18,8) = @DecimalScale16
DECLARE @DecimalScale4 DECIMAL(18,4) = @DecimalScale16
DECLARE @DecimalScale2 DECIMAL(18,2) = @DecimalScale16


-- #41): Select the first N records
/*
    The variable @TopCountries is declared below.

    Your task:
    Return the first N rows from the Country table, where N is the value of @TopCountries.

DECLARE @TopCountries INT = 7
*/

SELECT TOP (@TopCountries) * 
FROM Country c


-- #42): Print variables 1
/*
    The variables @CountryName and @Capital are declared below.

    Your task:
    Print three messages in this format:
    These are printed values:
    {country name}
    {capital}

DECLARE @CountryName NVARCHAR(100) = 'France'
DECLARE @Capital NVARCHAR(100) = 'Paris'
*/

PRINT 'These are printed values:'
PRINT @CountryName
PRINT @Capital