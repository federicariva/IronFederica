-- LABS JOIN
-- Write a query to display for each store its store ID, city and country.
use sakila;
select store_id, ct.city, co.country from store
left join address ad
using(address_id)
left join city ct
using (city_id)
left join country co
using (country_id);

#Write a query to display how much benefit amount, in dollars, each store brought in.
select s.store_id, sum(p.amount) from payment p
left join staff s
using (staff_id)
group by s.store_id;

#What is the average running time of films by category?
select fc.category_id, avg(length) from film
inner join film_category fc
using (film_id)
group by fc.category_id;

-- Which film categories are longest on average?
select fc.category_id, avg(length) from film
inner join film_category fc
using (film_id)
group by fc.category_id
order by avg(length) desc
limit 3;

-- Display the most frequently rented movies in descending order.
select * from rental;
select f.title, count(rental_id) as freq_rent from rental
join inventory iv
using (inventory_id)
join film f
using(film_id)
group by f.title
order by freq_rent desc;