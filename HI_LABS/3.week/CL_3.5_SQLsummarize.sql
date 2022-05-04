#order by
SELECT 
    *
FROM
    trans
WHERE
    k_symbol = 'UROK' AND operation <> ' '
ORDER BY date DESC , amount DESC; #create a partition

#LIKE '%' string match - wildcard
SELECT 
    *
FROM
    district
WHERE
    A2 LIKE 'K%'; #starts with k
    
SELECT 
    *
FROM
    district
WHERE
    A2 LIKE '%u%' OR A2 LIKE 'U%';

SELECT 
    A2
FROM
    district
WHERE
    A2 REGEXP '[u]';
    
SELECT 
    A2
FROM
    district
WHERE
    A2 REGEXP '[uxy]'; -- looking for u x y anywhere

SELECT * FROM district
WHERE A2 REGEXP 'pra?'; -- these characters anywhere in this order

SELECT * FROM district
WHERE A2 REGEXP '[:digit:]'; -- looking for a number

SELECT * FROM district
WHERE A2 REGEXP '[be|ae]'; -- either be or ae

#group by --> it comes after where --> it allows to aggregate the data by... something
select * from loan;

select sum(amount), duration from loan
group by duration, status;

-- summarize orders by account
select account_id, count(order_id) as noorders,
round(sum(amount), 2) as total
from bank.order
group by account_id
having count(order_id) >1 -- with group by you need to use 'having' because 'where' is executed before the group by
order by count(order_id) DESC;

SELECT * FROM district
WHERE A2 LIKE '_____'; #5 underscores -> 5 characters


#window functions - aggregation - but you don't want a summary table
use bank;    
select count(account_id) from account
group by district_id; #I will have as many rows as many districts
    
select *, avg(amount) OVER() as avg_amount
from loan
where duration = 12;

#partition by
select *, avg(amount) OVER(partition by duration) as avgbydur
from loan;

select *, round(avg(amount)OVER(partition by duration),0) as avgbydur
from loan;

select *, round(avg(amount)OVER(partition by status,duration),0) as avgbystatdur
from loan;

select account_id,
date,
amount,
sum(amount)OVER(partition by account_id order by date) #the order by date specify that is a cumulative sum
as running_sum
from trans;