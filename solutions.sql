-- 1. SELECT basics

-- 1. Show the population of Germany.
SELECT population 
FROM world
WHERE name = 'Germany';

-- 2. Show the name and population for Sweden, Norway and Denmark.
SELECT name, population 
FROM world
WHERE name IN ('Sweden', 'Norway','Denmark');

-- 3. Show the country and area for countries with an area between 200,000 and 250,000.
SELECT name, area 
FROM world
WHERE area BETWEEN 200000 AND 250000;


-- 2. SELECT name

-- 1. Find the country that start with "Y".
SELECT name
FROM world
WHERE name LIKE 'Y%';

-- 2. Find the countries that end with "y".
SELECT name 
FROM world
WHERE name LIKE '%y';

-- 3. Find the countries that contain the letter "x".
SELECT name 
FROM world
WHERE name LIKE '%x%';

-- 4. Find the countries that end with "land".
SELECT name 
FROM world
WHERE name LIKE '%land';

-- 5. Find the countries that start with "C" and end with "ia".
SELECT name 
FROM world
WHERE name LIKE 'C%' AND name LIKE '%ia';

-- 6. Find the country that has "oo" in the name.
SELECT name 
FROM world
WHERE name LIKE '%oo%';

-- 7. Find the countries that have three or more "a" in the name.
SELECT name 
FROM world
WHERE name LIKE '%a%a%a%';

-- 8. Find the countries that have "t" as the second character.
SELECT name 
FROM world
WHERE name LIKE '_t%';

-- 9. Find the countries that have two "o" characters separated by two others.
SELECT name 
FROM world
WHERE name LIKE '%o__o%';

-- 10. Find the countries that have exactly four characters.
SELECT name 
FROM world
WHERE name LIKE '____';

-- 11. Find the country where the name is the capital city.
SELECT name
FROM world
WHERE name = capital;

-- 12. Find the country where the capital is the country plus "City".
SELECT name
FROM world
WHERE capital = CONCAT(name, ' City');

-- 13. Find the capital and the name where the capital includes the name of the country.
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT('%', name, '%');

-- 14. Find the capital and the name where the capital is an extension of name of the country.
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT(name, '_%');

-- 15. Show the name and the extension where the capital is an extension of name of the country. 
-- (For Monaco-Ville the name is Monaco and the extension is -Ville.)
SELECT name, REPLACE(capital, name, '')
FROM world
WHERE capital LIKE CONCAT(name,'_%');


-- 3. SELECT from world

-- 1. Show the name, continent and population of all countries.
SELECT name, continent, population 
FROM world;

-- 2. Show the name for the countries that have a population of at least 200 million.
SELECT name 
FROM world
WHERE population >= 200000000;

-- 3. Show the name and per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population
FROM world
WHERE population >= 200000000;

-- 4. Show the name and population in millions for the countries of the continent South America. 
SELECT name, population/1000000
FROM world
WHERE continent = 'South America';

-- 5. Show the name and population for France, Germany, Italy.
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

-- 6. Show the countries which have a name that includes the word "United".
SELECT name
FROM world
WHERE name LIKE '%United%';

-- 7. Show the countries that are big by area (more than 3 million) or big by population (more than 250 million). 
-- Show name, population and area.
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

-- 8. Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. 
-- Show name, population and area.
SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population <250000000) 
OR (area < 3000000 AND population > 250000000);

-- 9. For South America show population in millions and GDP in billions (round both to 2 decimal places).
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';

-- 10. Show per-capita GDP for the trillion dollar countries to the nearest 1000.
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000;

-- 11. Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital 
FROM world 
WHERE LEN(name) = LEN(capital);

-- 12. Show the name and the capital where the first letters of each match. 
-- Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)) 
AND name <> capital;

-- 13. Find the country that has all the vowels and no spaces in its name.
SELECT name
FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %';


-- 4. SELECT from nobel

-- 1. Display Nobel prizes for 1950.
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

-- 2. Show who won the 1962 prize for Literature.
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature';

-- 3. Show the year and subject that won Albert Einstein his prize.
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

-- 4. Give the name of the Peace winners since the year 2000, including 2000.
SELECT winner
FROM nobel
WHERE subject = 'Peace'
AND yr >= 2000;

-- 5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT *
FROM nobel
WHERE subject = 'Literature'
AND yr BETWEEN 1980 AND 1989;

-- 6. Show all details of the presidential winners: Theodore Roosevelt, Woodrow Wilson, Jimmy Carter, Barack Obama.
SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

-- 7. Show the winners with first name John.
SELECT winner
FROM nobel
WHERE winner LIKE 'John %';

-- 8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT *
FROM nobel
WHERE (subject = 'Physics' AND yr = 1980)
OR (subject = 'Chemistry' AND yr = 1984);

-- 9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine.
SELECT *
FROM nobel
WHERE yr = 1980 
AND subject NOT IN ('Chemistry', 'Medicine');

-- 10. Show year, subject, and name of people who won a Medicine prize before 1910 (not including 1910) 
-- together with winners of a Literature prize after 2004 (including 2004).
SELECT *
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910)
OR (subject = 'Literature' AND yr >= 2004);

-- 11. Find all details of the prize won by Peter Grünberg.
SELECT *
FROM nobel
WHERE winner = 'Peter Grünberg';

-- 12. Find all details of the prize won by Eugene O'Neill.
SELECT *
FROM nobel
WHERE winner = 'Eugene O''Neill';

-- 13. List the winners, year and subject where the winner starts with Sir. 
-- Show the the most recent first, then by name order.
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir %'
ORDER BY yr DESC, winner;

-- 14. Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY 
CASE WHEN subject IN ('Physics', 'Chemistry') THEN 1 ELSE 0 END, 
subject, winner;


-- 5. SELECT within SELECT

-- 1. List each country name where the population is larger than that of Russia.
SELECT name 
FROM world
WHERE population > (SELECT population 
                    FROM world
                    WHERE name = 'Russia');

-- 2. Show the countries in Europe with a per capita GDP greater than United Kingdom's.
SELECT name 
FROM world
WHERE continent = 'Europe'
AND gdp/population > (SELECT gdp/population
                      FROM world
                      WHERE name = 'United Kingdom');

-- 3. List the name and continent of countries in the continents containing either Argentina or Australia. 
-- Order by name of the country.
SELECT name, continent
FROM world
WHERE continent IN (SELECT continent 
                    FROM world 
                    WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;

-- 4. Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population
FROM world
WHERE population > (SELECT population 
                    FROM world 
                    WHERE name = 'Canada')
AND population < (SELECT population 
                  FROM world 
                  WHERE name = 'Poland');

-- 5. Show the name and the population of each country in Europe. 
-- Show the population as a percentage of the population of Germany.
SELECT name, 
       CONCAT(CAST(ROUND(population/(SELECT population
                                     FROM world 
                                     WHERE name = 'Germany')
                         *100, 0) AS int), '%') AS percentage
FROM world
WHERE continent = 'Europe';

-- 6. Which countries have a GDP greater than every country in Europe? 
SELECT name
FROM world
WHERE gdp > (SELECT MAX(gdp) 
             FROM world 
             WHERE continent = 'Europe');

-- 7. Find the largest country (by area) in each continent, show the continent, the name and the area.
SELECT continent, name, area
FROM world
WHERE area IN (SELECT MAX(area) 
               FROM world 
               GROUP BY continent);

-- 8. List each continent and the name of the country that comes first alphabetically.
SELECT continent, name
FROM world
WHERE name IN (SELECT MIN(name) 
               FROM world 
               GROUP BY continent);

-- 9. Find the continents where all countries have a population <= 25,000,000. 
-- Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population
FROM world AS x
WHERE 25000000 >= ALL(SELECT population 
                      FROM world AS y 
                      WHERE x.continent = y.continent 
                      AND population IS NOT NULL);

-- 10. Some countries have populations more than three times that of any of their neighbours (in the same continent). 
-- Give the countries and continents.
SELECT name, continent 
FROM world AS x 
WHERE population > ALL(SELECT population*3 
                       FROM world AS y 
                       WHERE y.continent = x.continent 
                       AND y.name <> x.name);


-- 6. SUM and COUNT

-- 1. Show the total population of the world.
SELECT SUM(population)
FROM world;

-- 2. List all the continents.
SELECT DISTINCT continent
FROM world;

-- 3. Show the total GDP of Africa.
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';

-- 4. How many countries have an area of at least 1,000,000?
SELECT COUNT(name)
FROM world
WHERE area >= 1000000;

-- 5. What is the total population of Estonia, Latvia, and Lithuania?
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 6. For each continent show the continent and number of countries.
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

-- 7. For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

-- 8. List the continents that have a total population of at least 100 million.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;


-- 7. JOIN

-- 1. Show the matchid and player name for all goals scored by Germany (teamid = "GER").
SELECT matchid, player
FROM goal 
WHERE teamid = 'GER';

-- 2. Show id, stadium, team1, team2 for game 1012.
SELECT id, stadium, team1, team2
FROM game
WHERE id = '1012';

-- 3. Show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
FROM game 
JOIN goal ON game.id = goal.matchid
WHERE teamid = 'GER';

-- 4. Show the team1, team2 and player for every goal scored by player called Mario.
SELECT team1, team2, player
FROM game 
JOIN goal ON game.id = goal.matchid
WHERE player LIKE 'Mario%';

-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes (gtime <= 10).
SELECT player, teamid, coach, gtime
FROM goal 
JOIN eteam ON goal.teamid = eteam.id
WHERE gtime <= 10;

-- 6. List the dates of the matches and the name of the team in which Fernando Santos was the team1 coach.
SELECT mdate, teamname
FROM game 
JOIN eteam ON game.team1 = eteam.id
WHERE coach = 'Fernando Santos';

-- 7. List the player for every goal scored in a game where the stadium was "National Stadium, Warsaw".
SELECT player
FROM game 
JOIN goal ON game.id = goal.matchid
WHERE stadium = 'National Stadium, Warsaw';

-- 8. Show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
FROM goal
JOIN game ON goal.matchid = game.id
WHERE teamid <> 'GER' AND (team1 = 'GER' OR team2 = 'GER');

-- 9. Show teamname and the total number of goals scored.
SELECT teamname, COUNT(*)
FROM goal
JOIN eteam ON goal.teamid = eteam.id
GROUP BY teamname;

-- 10. Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(*)
FROM game
JOIN goal ON game.id = goal.matchid
GROUP BY stadium;

-- 11. For every match involving "POL", show the matchid, date and the number of goals scored.
SELECT matchid, mdate, COUNT(*)
FROM game
JOIN goal ON game.id = goal.matchid
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY matchid, mdate;

-- 12. For every match where "GER" scored, show matchid, match date and the number of goals scored by "GER".
SELECT matchid, mdate, COUNT(*)
FROM game
JOIN goal ON game.id = goal.matchid
WHERE teamid = 'GER'
GROUP BY matchid, mdate;

-- 13. List every match with the goals scored by each team as shown.
SELECT mdate, team1, SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1, 
       team2, SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
FROM game
LEFT JOIN goal ON game.id = goal.matchid
GROUP BY mdate, matchid, team1, team2;


-- 8. More JOIN

-- 1. List the films where the yr is 1962. Show id and title.
SELECT id, title
FROM movie
WHERE yr = '1962';

-- 2. When was Citizen Kane released?
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

-- 3. List all of the Star Trek movies, include the id, title and yr 
-- (all of these movies include the words Star Trek in the title). Order results by year.
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- 4. What's the id for actor Glenn Close?
SELECT id
FROM actor
WHERE name = 'Glenn Close';

-- 5. What's the id of the film Casablanca?
SELECT id
FROM movie
WHERE title = 'Casablanca';

-- 6. Obtain the cast list for Casablanca.
SELECT name
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE movieid = (SELECT id 
                 FROM movie 
                 WHERE title = 'Casablanca');

-- 7. Obtain the cast list for the film Alien.
SELECT name
FROM movie, actor, casting
WHERE title = 'Alien'
AND actor.id = casting.actorid
AND casting.movieid = movie.id;

-- 8. List the films in which Harrison Ford has appeared.
SELECT title
FROM movie, actor, casting
WHERE name = 'Harrison Ford'
AND actor.id = casting.actorid
AND casting.movieid = movie.id;

-- 9. List the films in which Harrison Ford has appeared but not in the starring role. 
-- (The ord field indicates the position of the actor. If ord = 1 then the actor is in the starring role.)
SELECT title
FROM movie, actor, casting
WHERE name = 'Harrison Ford'
AND actor.id = casting.actorid
AND casting.movieid = movie.id
AND ord <> '1';

-- 10. List the films together with the leading star for all 1962 films.
SELECT title, name
FROM movie, actor, casting
WHERE yr = '1962'
AND actor.id = casting.actorid
AND casting.movieid = movie.id
AND ord = 1;

-- 11. Which were the busiest years for Rock Hudson? 
-- Show the year and the number of movies he made each year for any year in which he made more than two movies.
SELECT yr, COUNT(title)
FROM movie
JOIN actor ON movie.id = actor.id
JOIN casting ON movie.id = casting.movieid
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

-- 12. List the film title and the leading actor for all of the films Julie Andrews played in.
SELECT title, name
FROM movie, actor, casting
WHERE movie.id IN (SELECT movie.id
                FROM movie, actor, casting 
                WHERE name = 'Julie Andrews'
                AND actor.id = casting.actorid
                AND casting.movieid = movie.id)
AND actor.id = casting.actorid
AND casting.movieid = movie.id
AND ord = 1;

-- 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT name
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE ord = 1
GROUP BY name
HAVING COUNT(name) >= 15;

-- 14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, COUNT(actorid)
FROM movie, casting
WHERE yr = '1978'
AND casting.movieid = movie.id
GROUP BY title
ORDER BY 2 DESC, 1;

-- 15. List all the people who have worked with Art Garfunkel.
SELECT DISTINCT name
FROM actor, casting
WHERE actor.id = casting.actorid
AND name <> 'Art Garfunkel'
AND movieid IN (SELECT movieid
                FROM actor, casting
                WHERE name = 'Art Garfunkel'
                AND actor.id = casting.actorid);


-- 9. Using NULL

-- 1. List the teachers who have NULL for their department.
SELECT name
FROM teacher
WHERE dept IS NULL;

-- 2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name
FROM teacher 
INNER JOIN dept ON (teacher.dept = dept.id);

-- 3. Use a different JOIN so that all teachers are listed.
SELECT teacher.name, dept.name
FROM teacher 
LEFT JOIN dept ON (teacher.dept = dept.id);

-- 4. Use a different JOIN so that all departments are listed.
SELECT teacher.name, dept.name
FROM teacher 
RIGHT JOIN dept ON (teacher.dept = dept.id);

-- 5. Use COALESCE to print the mobile number. Use the number "07986 444 2266" if there is no number given. 
-- Show teacher name and mobile number.
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

-- 6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. 
-- Use the string "None" where there is no department.
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

-- 7. Use COUNT to show the number of teachers and the number of mobile phones.
SELECT COUNT(name), COUNT(mobile)
FROM teacher;

-- 8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. 
-- Use a RIGHT JOIN to ensure that the Engineering department is listed.
SELECT dept.name, COUNT(teacher.name)
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;

-- 9. Use CASE to show the name of each teacher followed by "Sci" if the teacher is in dept 1 or 2 and "Art" otherwise.
SELECT name, (CASE WHEN dept IN ('1', '2') THEN 'Sci' ELSE 'Art' END)
FROM teacher;

-- 10. Use CASE to show the name of each teacher followed by "Sci" if the teacher is in dept 1 or 2, 
-- show "Art" if the teacher's dept is 3 and "None" otherwise.
SELECT name, CASE WHEN dept IN (1,2) 
THEN 'Sci'
WHEN dept = 3 
THEN 'Art'
ELSE 'None' END
FROM teacher;


-- 10. Window function

-- 1. Show the lastName, party and votes for the constituency "S14000024" in 2017.
SELECT lastName, party, votes
FROM ge
WHERE constituency = 'S14000024'
AND yr = '2017'
ORDER BY votes DESC;

-- 2. Show the party, votes and RANK for constituency "S14000024" in 2017. List the output by party.
SELECT party, votes, RANK() OVER(ORDER BY votes DESC)
FROM ge
WHERE constituency = 'S14000024'
AND yr = '2017'
ORDER BY party;

-- 3. Use PARTITION to show the ranking of each party in "S14000021" in each year. Include yr, party, votes and ranking.
SELECT yr, party, votes, RANK() OVER(PARTITION BY yr ORDER BY votes DESC)
FROM ge
WHERE constituency = 'S14000021'
ORDER BY party, yr, votes;

-- 4. Use PARTITION BY constituency to show the ranking of each party in Edinburgh in 2017. 
-- Order your results so the winners are shown first, then ordered by constituency.
SELECT constituency, party, votes, RANK() OVER(PARTITION BY constituency ORDER BY votes DESC)
FROM ge
WHERE yr = '2017'
AND constituency BETWEEN 'S14000021' AND 'S14000026'
ORDER BY 4, 1;

-- 5. Show the parties that won for each Edinburgh constituency in 2017.
SELECT constituency, party
FROM (SELECT constituency, party, 
      RANK() OVER(PARTITION BY constituency ORDER BY votes DESC) AS rank 
      FROM ge WHERE yr = '2017' 
      AND constituency BETWEEN 'S14000021' AND 'S14000026') AS ge_rank
WHERE rank = '1';

-- 6. Show how many seats each party won in Scotland in 2017. (Scottish constituencies start with "S".)
SELECT party, COUNT(*)
FROM (SELECT party, RANK() OVER(PARTITION BY constituency ORDER BY votes DESC) AS rank 
      FROM ge 
      WHERE yr = '2017' 
      AND constituency LIKE 'S%') AS ge_rank
WHERE rank = '1'
GROUP BY party;


-- 11. Self JOIN

-- 1. How many stops are in the database?
SELECT COUNT(*) 
FROM stops;

-- 2. Find the id value for the stop "Craiglockhart".
SELECT id 
FROM stops 
WHERE name = 'Craiglockhart';

-- 3. Give the id and the name for the stops on the "4" "LRT" service.
SELECT id, name 
FROM stops, route
WHERE stops.id = route.stop
AND num = '4'
AND company = 'LRT';

-- 4. The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). 
-- Run the query and notice the two services that link these stops have a count of 2. 
-- Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route 
WHERE stop = '149' OR stop = '53'
GROUP BY company, num
HAVING COUNT(*) = 2;

-- 5. Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, 
-- without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a 
JOIN route b ON (a.company = b.company AND a.num = b.num)
WHERE a.stop = '53' 
AND b.stop = '149';

-- 6. The query shown is similar to the previous one, however by joining two copies of the stops table 
-- we can refer to stops by name rather than by number. 
-- Change the query so that the services between Craiglockhart and London Road are shown.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a 
  JOIN route b ON (a.company = b.company AND a.num = b.num)
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart'
  AND stopb.name = 'London Road';

-- 7. Give a list of all the services which connect stops 115 and 137 ("Haymarket" and "Leith").
SELECT DISTINCT R1.company, R1.num
FROM route R1, route R2
WHERE R1.num = R2.num 
  AND R1.company = R2.company
  AND R1.stop = '115' 
  AND R2.stop = '137';

-- 8. Give a list of the services which connect the stops "Craiglockhart" and "Tollcross".
SELECT R1.company, R1.num
FROM route R1, route R2, stops S1, stops S2
WHERE R1.num = R2.num 
  AND R1.company = R2.company
  AND R1.stop = S1.id 
  AND R2.stop = S2.id
  AND S1.name = 'Craiglockhart'
  AND S2.name = 'Tollcross';

-- 9. Give a distinct list of the stops which may be reached from "Craiglockhart" by taking one bus, 
-- including "Craiglockhart" itself, offered by the LRT company. Include the company and bus no. of the relevant services.
SELECT DISTINCT S2.name, R2.company, R2.num
FROM stops S1, stops S2, route R1, route R2
WHERE S1.name = 'Craiglockhart'
  AND S1.id = R1.stop
  AND R1.company = R2.company 
  AND R1.num = R2.num
  AND R2.stop = S2.id;
