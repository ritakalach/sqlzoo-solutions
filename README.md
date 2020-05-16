# SQLZOO Solutions
Practice SQL exercises. Solutions to [SQLZOO Tutorials](https://sqlzoo.net) posted May 2020.

## Sections
* [0 SELECT basics](#0-select-basics)
* [1 SELECT name](#1-select-name)
* [2 SELECT from World](#2-select-from-world)
* [3 SELECT from Nobel](#3-select-from-nobel)
* [4 SELECT within SELECT](#4-select-within-select)
* [5 SUM and COUNT](#5-sum-and-count)
* [6 JOIN](#6-join)
* [7 More JOIN operations](#7-more-join-operations)
* [8 Using Null](#8-using-null)
* [8+ Numeric Examples](#8-numeric-examples)
* [9- Window function](#9--window-function)
* [9+ COVID 19](#9-covid-19)
* [9 Self join](#9-self-join)
* [10 Tutorial Quizzes](#10-tutorial-quizzes)
* [11 Tutorial Student Records](#11-tutorial-student-records)
* [12 Tutorial DDL](#12-tutorial-ddl)

## [0 SELECT basics](https://sqlzoo.net/wiki/SELECT_basics)
<img src="world_table.png" height = 200>

1. Show the population of Germany.
```sql
SELECT population 
FROM world
WHERE name = 'Germany';
```
2. Show the name and population for Sweden, Norway and Denmark.
```sql
SELECT name, population 
FROM world
WHERE name IN ('Sweden', 'Norway','Denmark');
```
3. Show the country and area for countries with an area between 200,000 and 250,000.
```sql
SELECT name, area 
FROM world
WHERE area BETWEEN 200000 AND 250000;
```
## [1 SELECT name](https://sqlzoo.net/wiki/SELECT_names)
1. Find the country that start with "Y".
```sql
SELECT name
FROM world
WHERE name LIKE 'Y%';
```
2. Find the countries that end with "y".
```sql
SELECT name 
FROM world
WHERE name LIKE '%y';
```
3. Find the countries that contain the letter "x".
```sql
SELECT name 
FROM world
WHERE name LIKE '%x%';
```
4. Find the countries that end with "land".
```sql
SELECT name 
FROM world
WHERE name LIKE '%land';
```
5. Find the countries that start with "C" and end with "ia".
```sql
SELECT name 
FROM world
WHERE name LIKE 'C%' AND name LIKE '%ia';
```
6. Find the country that has "oo" in the name.
```sql
SELECT name 
FROM world
WHERE name LIKE '%oo%';
```
7. Find the countries that have three or more "a" in the name.
```sql
SELECT name 
FROM world
WHERE name LIKE '%a%a%a%';
```
8. Find the countries that have "t" as the second character.
```sql
SELECT name 
FROM world
WHERE name LIKE '_t%';
```
9. Find the countries that have two "o" characters separated by two others.
```sql
SELECT name 
FROM world
WHERE name LIKE '%o__o%';
```
10. Find the countries that have exactly four characters.
```sql
SELECT name 
FROM world
WHERE name LIKE '____';
```
11. Find the country where the name is the capital city.
```sql
SELECT name
FROM world
WHERE name = capital;
```
12. Find the country where the capital is the country plus "City".
```sql
SELECT name
FROM world
WHERE capital = CONCAT(name, ' City');
```
13. Find the capital and the name where the capital includes the name of the country.
```sql
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT('%', name, '%');
```
14. Find the capital and the name where the capital is an extension of name of the country.
```sql
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT(name, '_%');
```
15. Show the name and the extension where the capital is an extension of name of the country. (For Monaco-Ville the name is Monaco and the extension is -Ville.)
```sql
SELECT name, REPLACE(capital, name, '')
FROM world
WHERE capital LIKE CONCAT(name,'_%');
```
## [2 SELECT from World](https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial)
1. Show the name, continent and population of all countries.
```sql
SELECT name, continent, population 
FROM world;
```
2. Show the name for the countries that have a population of at least 200 million.
```sql
SELECT name 
FROM world
WHERE population >= 200000000;
```
3. Show the name and per capita GDP for those countries with a population of at least 200 million.
```sql
SELECT name, gdp/population
FROM world
WHERE population >= 200000000;
```
4. Show the name and population in millions for the countries of the continent South America. 
```sql
SELECT name, population/1000000
FROM world
WHERE continent = 'South America';
```
5. Show the name and population for France, Germany, Italy.
```sql
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');
```
6. Show the countries which have a name that includes the word "United".
```sql
SELECT name
FROM world
WHERE name LIKE '%United%';
```
7. Show the countries that are big by area (more than 3 million) or big by population (more than 250 million). Show name, population and area.
```sql
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;
```
8. Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
```sql
SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population <250000000) 
OR (area < 3000000 AND population > 250000000);
```
9. For South America show population in millions and GDP in billions (round both to 2 decimal places).
```sql
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';
```
10. Show per-capita GDP for the trillion dollar countries to the nearest 1000.
```sql
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000;
```
11. Show the name and capital where the name and the capital have the same number of characters.
```sql
SELECT name, capital 
FROM world 
WHERE LEN(name) = LEN(capital);
```
12. Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
```sql
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)) 
AND name <> capital;
```
13. Find the country that has all the vowels and no spaces in its name.
```sql
SELECT name
FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %';
```

## [3 SELECT from Nobel](https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial)
## [4 SELECT within SELECT](https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial)
## [5 SUM and COUNT](https://sqlzoo.net/wiki/SUM_and_COUNT)
## [6 JOIN](https://sqlzoo.net/wiki/The_JOIN_operation)
## [7 More JOIN operations](https://sqlzoo.net/wiki/More_JOIN_operations)
## [8 Using Null](https://sqlzoo.net/wiki/Using_Null)
## [8+ Numeric Examples](https://sqlzoo.net/wiki/NSS_Tutorial)
## [9- Window function](https://sqlzoo.net/wiki/Window_functions)
## [9+ COVID 19](https://sqlzoo.net/wiki/Window_LAG)
## [9 Self join](https://sqlzoo.net/wiki/Self_join)
## [10 Tutorial Quizzes](https://sqlzoo.net/wiki/Tutorial_Quizzes)
## [11 Tutorial Student Records](https://sqlzoo.net/wiki/DDL_Student_Records)
## [12 Tutorial DDL](https://sqlzoo.net/wiki/DDL_General_Election)
