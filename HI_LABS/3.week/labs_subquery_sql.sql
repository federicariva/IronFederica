#Labs 2 subquery
-- How many copies of the film Hunchback Impossible exist in the inventory system?
select count(inventory_id) from inventory
where film_id = (select film_id from film
where title = 'Hunchback Impossible');

#List all films whose length is longer than the average of all the films.
select * from film
where length > (select avg(length) from film);

#Use subqueries to display all actors who appear in the film Alone Trip.
select actor_id, a.first_name, a.last_name from film_actor
left join actor a
using(actor_id)
where film_id = (select film_id from film
where title = 'Alone Trip');

-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
-- Identify all movies categorized as family films.
select film_id, f.title from film_category
left join film f
using (film_id)
where category_id = (select category_id from category
where name = 'family');

-- Get name and email from customers from Canada using subqueries. 
-- Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys,
-- that will help you get the relevant information.

select first_name, last_name, email from customer
where address_id in (select address_id from address 
where city_id in (select city_id from city 
where country_id = (select country_id from country
where country = 'Canada')));

select first_name, last_name, email from country
inner join city using (country_id)
inner join address a using (city_id)
inner join customer using (address_id)
where country = 'Canada';

#solution with a view
Create view custloc;


-- Which are films starred by the most prolific actor? 
-- Most prolific actor is defined as the actor that has acted in the most number of films. 
-- First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

#get the number of film for each actor
select actor_id, count(distinct film_id) as numoffi from film_actor
group by actor_id;

#get the actor id with the max number of films
select actor_id
from (select actor_id, count(distinct film_id) as numoffi 
from film_actor
group by actor_id
order by numoffi desc
limit 1) as q1;

#get the film_id of the most prolific actor
select film_id from film_actor
where actor_id = (select actor_id
from (select actor_id, count(distinct film_id) as numoffi 
from film_actor
group by actor_id
order by numoffi desc
limit 1) as q1);

#get the titles of the films of the most prolific actor
select title from film
where film_id in (select film_id from film_actor
where actor_id = (select actor_id
from (select actor_id, count(distinct film_id) as numoffi 
from film_actor
group by actor_id
order by numoffi desc
limit 1) as q1));

-- Films rented by most profitable customer. 
-- You can use the customer table and payment table to find 
-- the most profitable customer ie the customer that has made the largest sum of payments
select title from film
join inventory using (film_id)
join rental using (inventory_id)
where customer_id = (
select customer_id from
(select customer_id, sum(amount) from payment
group by customer_id
order by sum(amount) desc
limit 1) pc); 

-- Get the client_id and the total_amount_spent of those clients who spent more than the average 
-- of the total_amount spent by each client.

#total_amount spent by each client
select sum(amount) as total_amount
from payment 
group by customer_id;

#average of the total_amount spent by each client
select avg(total_amount) from
(select sum(amount) as total_amount
from payment 
group by customer_id) as mean;

#client_id and the total_amount_spent 
select customer_id, sum(amount) as total_amount
from payment 
group by customer_id having total_amount > 
(select avg(total_amount) from
(select sum(amount) as total_amount from payment 
group by customer_id) as mean);
