                                       /* PROJECT 1 */
-- 1.Create new schema as ecommerce.
-- solution -- 
create database ECOMMERCE;

-- 2.Import .csv file users_data into MySQL.
-- solution --

-- step 1 create database 
-- step 2 open my sql and import users_data csv.file
-- step 3 click the table of database and right click on the table then click import wizard after that import the csv.file
-- step 4 after completion of process then we can use the database
use ECOMMERCE;

-- 3.Run SQL command to see the structure of table.
-- solution --
desc users_data;

-- 4.Run SQL command to select first 100 rows of the database.

select * from users_data limit 100;

-- 5.How many distinct values exist in table for field country and language.
-- solution --
select * from users_data;
select count(distinct country) distinct_country,count(distinct language) distinct_language from users_data;

-- 6.Check whether male users are having maximum followers or female users.
-- solution --
select gender,max(socialNbFollowers) from users_data group by gender;

-- 7.Calculate the total users those
-- a.Uses Profile Picture in their Profile
-- b.Uses Application for Ecommerce platform
-- c.Uses Android app
-- d.Uses ios app
-- solution -- 
select count(hasprofilepicture) hasprofilepicture from users_data where hasprofilepicture='true';
select count(hasanyapp) hasanyapp from users_data where hasanyapp='True';
select count(hasandroidapp) hasandroidapp from users_data where hasandroidapp='True';
select count(hasiosapp) hasiosapp from users_data where hasiosapp='True';

-- 8.Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers.
-- solution--

select count(productsBought) productsBought,country from users_data where productsBought!=0 group by country order by count(productsBought) desc;

-- 9.Calculate the sum number of sellers for each country and sort the result in ascending order of total number of sellers.
-- solution--

select avg(productsSold) productsSold,country from users_data where productsSold!=0 group by country order by count(productsSold) asc;

-- 10.Display name of top 10 countries having maximum products pass rate.
-- solution--

select distinct(country) country ,max(productspassrate) from users_data group by country order by  max(productspassrate) desc limit 10;

-- 11.Calculate the number of users on an ecommerce platform for different language choices.
-- solution --

select count(hasanyapp) number_of_users ,language from users_data where hasanyapp= 'true' group by language;

-- 12.Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform.
-- solution --

select sum(productswished) productswished,sum(socialproductsliked) socialproductsliked from users_data where gender = "F" and hasanyapp='true';

-- 13.Check the choice of male users about being seller or buyer.
-- solution--

SELECT COUNT(productssold) productssold FROM users_data WHERE gender = 'M' AND productsSold != 0 UNION SELECT COUNT(productsBought) productsbought FROM users_data WHERE gender = 'M' AND productsBought != 0;
-- 14.Which country is having maximum number of buyers?
-- solution -- 

SELECT productsbought, country FROM users_data WHERE productsbought = (SELECT MAX(productsbought) FROM users_data) GROUP BY country;
-- 15.List the name of 10 countries having zero number of sellers.
-- solution --

select distinct(country),productsSold from users_data where productsSold = 0 limit 10;

-- 16.Display record of top 110 users who have used ecommerce platform recently.
-- solution --

select * from users_data  where hasanyapp='true'order by seniority desc limit 110; 

-- 17.Calculate the number of female users those who have not logged in since last 100 days.
-- solution --

select count(type) number_of_female_users from users_data where gender='F'and dayssincelastlogin >=100;

-- 18.Display the number of female users of each country at ecommerce platform.
-- solution --

select count(type) number_of_female_users ,country from users_data where hasanyapp= 'true' and gender='F' group by country;

-- 19.Display the number of male users of each country at ecommerce platform.
-- solution --

select count(type) number_of_male_users ,country from users_data where hasanyapp='true'and gender='M' group by country;

-- 20.Calculate the average number of products sold and bought on ecommerce platform by male users for each country.
-- solution --

select country,avg(productsSold) product_sold ,avg(productsBought) product_bought  from users_data where gender="M" and hasanyapp = 'true' group by country;


                                         /* *****END***** */ 