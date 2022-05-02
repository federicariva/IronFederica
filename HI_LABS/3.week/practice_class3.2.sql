-- How many clients per district? JOIN is about ROWS, not about columns
select A2 as district_name, A3 as region_name, count(distinct client_id) 
from district #left table
left join client #right table and join type
ON district.A1 = client.district_id #join clauses
-- using () if the fields are named the same
group by A2, A3;

-- how many loans and avg(amount) per account?
select a.account_id, a.date, count(l.loan_id), avg(l.amount), l.date
from loan l #left table
INNER JOIN account a #right table
USING(account_id) #join clause
group by a.account_id, a.date;

#Get a list of districts ordered by the number of clients (descending order). 
-- Name the columns as: District_name and Number_of_clients respectively. 
select A2 as District_name, count(distinct client_id) as Number_of_clients
from district
INNER JOIN client
ON district.A1 = client.district_id
group by A2
order by Number_of_clients desc;

#Get a list of regions ordered by the number of clients (descending order). 
-- Name the columns as: Region_name and Number_of_clients respectively.
select A3 as Region_name, count(distinct client_id) as Number_of_clients
from district
INNER JOIN client
ON district.A1 = client.district_id
group by A3
order by Number_of_clients desc;

#Get the number of accounts opened by district and year. 
-- Name the columns as: District_name, Year and Accounts_opened. Order the results by District_name and Year.
select A2 as District_name, date_format(date, '%Y') as Year, count(account_id) as Accounts_opened
from account
join district
on A1=district_id
group by A2, Year
order by A2, Year;

#example where left and right matters
select * from account
left join loan # --> you get null values
using (account_id);

select * from account
right join loan 
using (account_id);

select * from loan
left join account 
using (account_id);

Select d.A3 as region,
count(l.loan_id) as noofloans, 
count(c.client_id) as noofclients,
count(a.account_id) as noofaccounts
from loan l
inner join account a
using (account_id)
inner join disp dp
using (account_id)
inner join client c
using (client_id)
inner join district d
ON a.district_id = d.A1
where dp.type = 'OWNER'
group by A3;

#Extend the query below and list district_name, client_id, and account_id for those clients who are the owner of the account. 
-- Order the results by district_name:

select d.client_id, 
d.account_id,
A2 as district_name
from bank.disp as d
inner join bank.client as c
-- using(client_id)
on d.client_id = c.client_id
inner join bank.district as da
on da.A1 = c.district_id
where d.type = 'OWNER'
order by district_name;

select A2 as district_name,
c.client_id, 
d.account_id
from bank.disp as d
inner join bank.client as c
using(client_id)
#on d.client_id = c.client_id
inner join bank.district as da
on da.A1 = c.district_id
where d.type = 'OWNER'
order by district_name;

select * from district;
select * from account;
select * from disp;


-- 3.05.1 Keep working on the bank database.
-- Find out the average of the number of transactions by account. Hint: Compute first the number of transactions by account.
select * from trans;

select avg(trans_by_account) from 
(select count(distinct trans_id) as trans_by_account
from trans
group by account_id) as tba;

-- 3.05.2 Get a list of accounts from Central Bohemia using a subquery.
-- Rewrite the previous as a join query.
-- Discuss which method will be more efficient.


use bank;
select * from district;
select account_id from account
where district_id in (select a1 as district_id from district
where A3 = 'central Bohemia'); 

select account_id from account
join district
on account.district_id=district.A1
where A3 = 'central Bohemia';
