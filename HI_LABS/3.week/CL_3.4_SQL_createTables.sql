-- DDL (definition) and DML (manipulate)
# create alter drop truncate rename update
drop database booksauthors;
create database booksauthors;
use booksauthors;

drop table if exists authors;
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT NOT NULL,
    authorname VARCHAR(30) DEFAULT NULL,
    country VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (author_id)
);

drop table if exists books;
CREATE TABLE books (
    book_id INT AUTO_INCREMENT NOT NULL,
    author_id INT NOT NULL,
    bookname VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (book_id),
    KEY idx_fk_author_id (author_id),
    CONSTRAINT fk_author_id FOREIGN KEY (author_id)
        REFERENCES authors (author_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- populate with data directory
insert into authors (authorname,country)
values ('Luis Sepulveda','Chile'),('Nick Hornby','USA'),
('Alessandro Baricco','Italy'),('Zero Calcare','Italy'),('Markus Zusak','Australia');

select * from authors;

insert into books (bookname, author_id)
values ('Patagonia express',1),('High Fidelity',2),
('Oceano mare',3),('Kobane Calling',4),('The book thief',5);

select * from books;

select bookname, authorname, country
from authors
inner join books
using(author_id);

select * from books
right join authors
using(author_id);

 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL 
 SECURITY DEFINER VIEW `sakila`.`sales_by_film_category` 
 AS select `c`.`name` AS `category`,sum(`p`.`amount`) 
 AS `total_sales` from (((((`sakila`.`payment` `p`
 join `sakila`.`rental` `r` on((`p`.`rental_id` = `r`.`rental_id`))) 
 join `sakila`.`inventory` `i` on((`r`.`inventory_id` = `i`.`inventory_id`))) 
 join `sakila`.`film` `f` on((`i`.`film_id` = `f`.`film_id`))) 
 join `sakila`.`film_category` `fc` on((`f`.`film_id` = `fc`.`film_id`))) 
 join `sakila`.`category` `c` on((`fc`.`category_id` = `c`.`category_id`))) 
 group by `c`.`name` order by `total_sales` desc;


-- create view that combines clients with their own loans, loan status
use bank;
CREATE VIEW clients_loans_combo AS
    SELECT 
        c.client_id,
        c.district_id,
        l.loan_id,
        l.status,
        dp.type,
        l.amount,
        l.duration,
        l.payments,
        l.date AS loan_date
    FROM
        client c
            INNER JOIN
        disp dp USING (client_id)
            INNER JOIN
        account a USING (account_id)
            INNER JOIN
        loan l USING (account_id)
    WHERE
        dp.type = 'OWNER';

-- Subquery = a query inside a query
-- step 2: outer query
-- step 1: inner query (always do it first and check if it works)
-- it can be: one value (=><), a column of values (IN), a table of values (subquery needs an alias)

SELECT 
    *
FROM
    loan
WHERE
    amount > (SELECT 
            AVG(amount)
        FROM
            loan); #inner query

#CTEs - we want to join x + y but x does not exist
-- transactions table - get the total amount for each account and any acc info
-- then draw on that table to get information
-- use that table to join to another table
