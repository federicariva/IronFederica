#3.02 Activity 01

#Select districts and salaries (from the district table) where salary is greater than 10000.
#Return columns as district_name and average_salary.
select A2 as district, A11 as avg_salary from bank.district
where A11>10000;

#Select those loans whose contracts finished and were not paid. 
#Hint: You should be looking at the loan column and you will need the extended case study information to tell you which value of status is required.
Select * from bank.loan
where status = 'B'
order by loan_id;

#Select cards of type junior. Return just the first 10 in your query.
select * from bank.card
where type = 'junior'
limit 10;

#Select those loans whose contract is finished and not paid back. 
#Return the debt value from the status you identified in the last activity, together with loan id and account id.
Select loan_id, account_id, amount-payments as debt from bank.loan
where status = 'B'
order by loan_id;

#Calculate the urban population for all districts. 
#Hint: You are looking for the number of inhabitants and the % of urban inhabitants in each district. 
#Return columns as district_name and urban_population.
#A4 number of inhabitants, A10 ratio of urban inhabitants
Select A2 as district_name, round((A4*A10)/100) as number_urban_inhabitants 
from district;

#On the previous query result - rerun it but filter out districts where the rural population is greater than 50%.
Select A2 as district_name, round((A4*A10)/100) as number_urban_inhabitants 
from district
where A10 <= 50;


##### 3.02 Activity 02 ##########################################
#Get all junior cards issued later than the last year. Hint: Use the numeric value (980000).
select * from card
where issued > 980000;

#Get the first 10 transactions for withdrawals that are in cash.
#You will need the extended case study information to tell you which values are required here, 
#and you will need to refer to conditions on two columns;
select * from trans
where type = 'VYDAJ' and operation = 'VYBER'
order by date
limit 10;

#Refine your query from the last activity on loans whose contract finished and not paid back - 
-- filtered to loans where they were left with a debt bigger than 1000. 
-- Return the debt value together with loan id and account id.

Select loan_id, account_id, amount-payments as debt from bank.loan
having debt > 1000;

#Get the biggest and the smallest transaction with non-zero values in the database (use the trans table in the bank database).
select max(amount), min(amount) from trans
where amount > 0;


#Get account information with an extra column year showing the opening year as 'YYYY'. Eg., 970707 will show as 1997. 
#Hint: Look at the first two characters of the string date in the account table. 
#The output should display the fields: account_id, district_id, frequency, and 'Year' (YYYY format).
select account_id, district_id, frequency, date_format(convert(account.date,date),'%Y') as year from account;


##### 3.02 Activity 03 ##########################################
#Get card_id and year_issued for all gold cards. Use the functions convert() and date_format()
select card_id, date_format(convert(substring_index(issued,' ',1),date),'%Y') from card
where type = 'gold';

#When was the first gold card issued? (Year)
select card_id, min(date_format(convert(substring_index(issued,' ',1),date),'%Y')) as year from card;

#Get issue date column name displayed as:
-- date_issued: 'November 7th, 1993' (American format)
-- fecha_emision: '07 of November of 1993' (Spanish format)

select card_id, date_format(convert(substring_index(issued,' ',1),date),'%M %D, %Y') as year from card;
select card_id, date_format(convert(substring_index(issued,' ',1),date),'%d of %M of %Y') as year from card;


##### 3.02 Activity 04 ##########################################
#Null or empty values are usually a problem. Think about why those null values can appear.
------- 

#Check for transactions with null or empty values for the column amount.
select isnull(amount) from trans;
select k_symbol from trans;


#Count how many transactions have empty and non-empty k_symbol (in one query). 
#Hint: consider using the function sum() with a condition inside. 😉

select sum(CASE WHEN k_symbol IS NULL THEN 1 ELSE 0 END) K from trans;
