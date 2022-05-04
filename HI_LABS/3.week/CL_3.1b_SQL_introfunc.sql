#SELECT * FROM bank.account;
SELECT *
FROM bank.account;
    #example of query
SELECT * 
from bank.trans;
use bank; #to select bank as a default database
select account_id as id, amount as amnt, balance as bal #specifiy cols or * #select
, amount-balance as difference #arbitrary sum
from trans #from
#order by amnt #order by #default order is ASCENDING
order by amnt DESC #type DESC for descending order
limit 10; #pick top 10

Select count(*) from trans; #count the number of records (rows) in the table
Select count(distinct account_id) from trans;
Select count(distinct account_id) as countofaccts; # to count only the first repetition of every id

select distinct operation from trans; #unique values
select count(distinct operation) from trans; #count unique values


#operator + - * /
# =  (<> or !=) = different  <= >=

#from the bank loan, get loan_id and amount in thousands
select loan_id, amount/1000 as amountk from loan; 

#only loans where status is A or B
select * from loan
where status = 'A' or status = 'B'; #either A or B

select * from loan
where status not IN ('A', 'B'); #is not either A or B

select * from loan
where status <> 'B' AND status!='A'; #is neither A or B

#lets add an AND to our WHERE
#status is B and amount is >100000
select * from loan
where status = 'B' AND amount > 100000
order by amount DESC;

#duration less or equal than 24 months
select * from loan
where duration<= 24
order by duration DESC;

#the biggest loan amount
select max(amount), min(amount) from loan;

#average order amount
select round(avg(amount),2) from bank.order;

select ceil(avg(amount)) from bank.order;

select floor(avg(amount)) from bank.order;

#useful string functions LOWER, UPPER, LENGTH, CONCAT, LEFT, RIGHT, LTRIM, RTRIM
#ltrim, rtrim -> they trim all the white spaces from the left or from the right
select A2, LEFT(A2,5) from district;

#dates convert(int, date), substring_index(), date_format(%Y)
select *, convert(account.date,date) as mydate from bank.account;
select *, convert(substring_index(issued,' ',1),date) 
from bank.card;
select *, date_format(convert(loan.date,date),'%d/%m/%y') as newdate
from bank.loan;

#nulls: is null()


#case - we have done in tableau -loan table
select *,
	case status
		when 'A' then 'ciao'
		when 'B' then 'hello'
        when 'C' then 'hola'
        else 'hoi'
        end as description
from bank.loan;

