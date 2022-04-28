#Using the rental table, find out how many rentals were processed by each employee.
SELECT 
    staff_id, COUNT(rental_id)
FROM
    rental
GROUP BY staff_id;

#Using the film table, find out how many films were released.
SELECT 
    COUNT(DISTINCT film_id)
FROM
    film;

#Using the film table, find out how many films there are of each rating.
-- Sort the results in descending order of the number of films.
SELECT 
    rating, COUNT(film_id) AS filmno
FROM
    film
GROUP BY rating
ORDER BY filmno DESC;

#Which kind of movies (rating) have a mean duration of more than two hours?
select rating, avg(length) from film
group by rating
having avg(length) > 120;
