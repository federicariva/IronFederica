#Get all the data from tables actor, film and customer.
Select * from sakila.actor;
Select * from sakila.film;
select * from sakila.customer;

#Get film titles.
Select title from sakila.film;

#Get unique list of film languages under the alias language. 
#Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
SELECT DISTINCT
    name AS language
FROM
    language;

#5.1 Find out how many stores does the company have?
SELECT 
    COUNT(DISTINCT store_id)
FROM
    store;

#5.2 Find out how many employees staff does the company have?
SELECT 
    COUNT(DISTINCT staff_id)
FROM
    staff;

#5.3 Return a list of employee first names only?
SELECT DISTINCT
    first_name
FROM
    staff;
