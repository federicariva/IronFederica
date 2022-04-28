#Get transactions in the first 15 days of 1993
Select * from trans
where date>'921231' and date<'930116'
order by date;

#Find the different values from the field A2 that start with the letter 'M'
Select * from district
where A2 LIKE 'M%';

#Find the different values from the field A2 that start with the letter 'M'
Select * from district
where A2 LIKE '%M';

#get the total revenue using the column amount from the table payment. Display as total-revenue
use sakila;
select sum(amount) as Total_revenue from payment; 

#Get the total revenue by customer_id sorted by total benefit in descending order.
use sakila;
select customer_id, sum(amount) as revenue_by_customer from payment
group by customer_id
order by revenue_by_customer DESC;

SET GLOBAL sql_mode = 'ONLY_FULL_GROUP_BY';
SELECT @@GLOBAL.sql_mode;

#Create a query to show for each rating the average movie length (displayed as Mean_length). 
-- Sort the results in descending order of Mean_length. group by

use sakila;
select distinct rating from film;
select rating, avg(length) as Mean_length from film
group by rating
order by Mean_length desc;

-- Create a query to show for each movie the following data (in this order):
#rating
#title
#length
#mean length by rating displayed as Mean_length_by_rating
#ranking displayed as Ranking (showing from the longest to the shortest movie within the same rating).
#This means sorting the results by rating and descending order of movie length.

select rating,
title,
length,
avg(length)OVER(partition by rating) as Mean_length_by_rating,
rank() OVER(partition by rating order by length DESC) as Ranking
from film;

select rating,
title,
length,
avg(length)OVER(partition by rating) as Mean_length_by_rating,
dense_rank() OVER(partition by rating order by length DESC) as Ranking
from film;

