## 1. Write a statement that from all your tables that selects all the values in the table.
SHOW tables;
SELECT 
    *
FROM
    playstation2_games_a_to_k;
SELECT 
    *
FROM
    playstation2_games_l_to_z;
SELECT 
    *
FROM
    vgsales;
## 2. Write a statement that from each of your tables that identifies 4 fields.
SELECT 
    name_title, platform, genre, publisher
FROM
    vgsales;

## 3. Write a statement from each of your tables that has a single where clause
SELECT 
    *
FROM
    vgsales
WHERE
    platform = 'PS2';
SELECT 
    *
FROM
    playstation2_games_a_to_k
WHERE
    Title = 'Crash Bandicoot: The Wrath of Cortex';
    
SELECT * FROM playstation2_games_l_to_z WHERE id = 2943;

## 4. Write a statement from each of your tables that has a IN statement with 1-3 different values

SELECT * FROM vgsales WHERE platform IN('PS', 'PS2','PS3');
SELECT * FROM playstation2_games_l_to_z WHERE Developer IN('Bandai','Namco Bandai Games','Atlus Co.');
SELECT * FROM playstation2_games_a_to_k WHERE Publisher IN('Agetec Inc.','Konami','Koei');

## Write a statement from each of your tables that includes an OR statement
SELECT 
    *
FROM
    vgsales
WHERE
    platform = 'Wii' OR platform = 'NES';
SELECT 
    *
FROM
    playstation2_games_a_to_k
WHERE
    Developer = 'Atlus Co.'
        OR Developer = 'Bandai';
SELECT 
    *
FROM
    playstation2_games_l_to_z
WHERE
    Publisher = 'Ubisoft'
        OR Publisher = 'EA Sports';
## Write a statement from each of your tables that includes an order by Ascending on 1/2 of the tables, and Descending on the other 1/2
SELECT 
    *
FROM
    vgsales
ORDER BY rank_id ASC , global_sales DESC;

SELECT 
    *
FROM
    playstation2_games_a_to_k
ORDER BY First_released ASC , Title DESC;

SELECT 
    *
FROM
    playstation2_games_l_to_z
ORDER BY First_released ASC , Title DESC;

## Write a statement from each of your tables that includes an district query for each of your table
SELECT 
    COUNT(DISTINCT publisher)
FROM
    vgsales;
SELECT 
    COUNT(*) AS DistinctTitles
FROM
    (SELECT DISTINCT
        Title
    FROM
        playstation2_games_a_to_k) AS DistinctTitles;
SELECT 
    COUNT(*) AS DistinctTitles
FROM
    (SELECT DISTINCT
        Title
    FROM
        playstation2_games_l_to_z) AS DistinctTitles;

## Write a statement from each of your tables that includes a AND statement
SELECT 
    *
FROM
    vgsales
WHERE
    platform = 'Wii' AND year_release = 2006;
SELECT * FROM playstation2_games_a_to_k where Publisher = 'Bandai' and JP = 'Released';
SELECT * FROM playstation2_games_l_to_z where Publisher = 'Capcom' and JP = 'Released';
## Write a statement from each of your tables that includes a between statement
SELECT 
    *
FROM
    vgsales
WHERE na_sales between 4000 and 2000;
SELECT * FROM playstation2_games_a_to_k where First_released between '2005-12-15JP' and JP = '2001-11-15JP';
SELECT * FROM playstation2_games_l_to_z where First_released between '2005-12-15JP' and JP = '2001-11-15JP';

## Write a statement from each of your tables that includes a like statement
SELECT * FROM playstation2_games_a_to_k where Title like 'a%';
SELECT * FROM playstation2_games_l_to_z where Title like 'n%';
SELECT * FROM vgsales where name_title like '%s';

## Write a statement from each of your tables that includes a Limit of 5 records
SELECT * FROM playstation2_games_a_to_k where Title like 'a%' limit 5;
SELECT * FROM playstation2_games_l_to_z where Title like 'n%' limit 5;
SELECT * FROM vgsales where name_title like '%s' limit 5;

## Write a statement from each of your tables that includes a NULL statement
SELECT rank_id, name_title, platform FROM vgsales where platform is null;
SELECT id, Title, Developer FROM playstation2_games_a_to_k where Title is null;
SELECT id, Title, Developer FROM playstation2_games_l_to_z where Title is null;

## Write a statement from each of your tables that includes a INNER JOIN
SELECT vgsales.rank_id, playstation2_games_a_to_k.Title
from vgsales
INNER JOIN playstation2_games_a_to_k on vgsales.rank_id = playstation2_games_a_to_k.Title;

SELECT vgsales.rank_id, playstation2_games_l_to_z.Title
from vgsales
INNER JOIN playstation2_games_l_to_z on vgsales.rank_id = playstation2_games_l_to_z.Title;
## Write a statement from each of your tables that includes a RIGHT JOIN
SELECT vgsales.rank_id, playstation2_games_a_to_k.Title
from vgsales
right JOIN playstation2_games_a_to_k on vgsales.rank_id = playstation2_games_a_to_k.Title;

SELECT vgsales.rank_id, playstation2_games_l_to_z.Title
from vgsales
right JOIN playstation2_games_l_to_z on vgsales.rank_id = playstation2_games_l_to_z.Title;
## Write a statement from each of your tables that includes a LEFT JOIN
SELECT vgsales.rank_id, playstation2_games_a_to_k.Title
from vgsales
left JOIN playstation2_games_a_to_k on vgsales.rank_id = playstation2_games_a_to_k.Title;

SELECT vgsales.rank_id, playstation2_games_l_to_z.Title
from vgsales
left JOIN playstation2_games_l_to_z on vgsales.rank_id = playstation2_games_l_to_z.Title;
## Write a statement from each of your tables that includes a UNION statement
SELECT platform from vgsales
UNION
SELECT Publisher from playstation2_games_a_to_k ORDER BY platform ASC;
SELECT platform from vgsales
UNION
SELECT Publisher from playstation2_games_l_to_z ORDER BY platform DESC;
## Write a statement from each of your tables that includes a Group by statement
SELECT SUM(global_sales), platform
from vgsales GROUP BY platform;
SELECT COUNT(JP), Developer
from playstation2_games_a_to_k GROUP BY Developer;
SELECT COUNT(JP), Developer
from playstation2_games_l_to_z GROUP BY Developer;