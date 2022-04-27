#Select all the actors with the first name "Scarlett".
SELECT 
    first_name
FROM
    actor
WHERE
    first_name = 'Scarlett';

#How many films (movies) are available for rent and how many films have been rented?
#available for rent
SELECT count(*) from film;

#how many films have been rented?
SELECT count(*) from rental;

SELECT 
    COUNT(DISTINCT title)
FROM
    film
WHERE
    rental_duration > 0;

#What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT 
    MAX(length) AS max_duration, MIN(length) AS min_duration
FROM
    film;

#What's the average movie duration expressed in format (hours, minutes)?
SELECT 
    DATE_FORMAT(SEC_TO_TIME(AVG(length) * 60), '%h:%i')
FROM
    film;
    
SELECT 
    FLOOR(AVG(length) / 60) AS hours,
    ROUND(AVG(length) % 60) AS minutes
FROM
    film;

#How many distinct (different) actors' last names are there?
SELECT 
    COUNT(DISTINCT last_name)
FROM
    actor;

#Since how many days has the company been operating (check DATEDIFF() function)?
SELECT 
    DATEDIFF(CURDATE(), MIN(rental_date))
FROM
    rental;

#Show rental info with additional columns month and weekday. Get 20 results.
SELECT 
    *,
    MONTH(rental_date) AS month_rental,
    DAYNAME(rental_date) AS weekday_rental,
    MONTH(return_date) AS month_return,
    DAYNAME(return_date) AS weekday_return
FROM
    rental
    limit 20;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT 
    *,
    CASE DAYOFWEEK(rental_date)
        WHEN '1' THEN 'weekend'
        WHEN '7' THEN 'weekend'
        ELSE 'workday'
    END AS day_type
FROM
    rental;
    
SELECT 
    *,
    CASE 
        WHEN DAYOFWEEK(rental_date) 
        in ('1', '7') THEN 'weekend'
        ELSE 'workday'
    END AS day_type
FROM
    rental;
    
#How many rentals were in the last month of activity?
SELECT 
    max(rental_date)
FROM
    rental;

SELECT 
    COUNT(rental_id)
FROM
    rental
WHERE
    rental_date > '2006-01-15';
    
 #only one step
SELECT COUNT(*)
FROM rental
WHERE rental_date 
>=(SELECT MAX(rental_date) - INTERVAL 30 DAY FROM
            rental);
    