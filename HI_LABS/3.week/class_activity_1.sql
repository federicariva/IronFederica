Select 'hello world';

select 546/457;

#Use an appropriate select statement to retrieve a list of unique card types 
#from the bank database, table card. (Hint: You can use the DISTINCT function here.)
#select distinct card_id from card;
select distinct type from card;

#Get a list of all the district names in the bank database. 
#A suggestion is to use the files_for_activities/case_study_extended here to work out which column is required here because we are looking for the names of places, not just the IDs. 
#You should have 77 rows.
select distinct A2 from district;
#select count(distinct A2) from district;

#Bonus: Revise your query to also show the Region, and limit the results to just 30 rows.
select A2, A3 from district
limit 30;

select A2 as district_name, A3 as region_name from district
limit 30;

#Get all the types of the card as type_of_card and the issue date as issue_date from card client and alias the table as bc
Select type as type_of_card, issued as issue_date 
from card as bc; 


#ACTIVITY 3.02
#Select districts and salaries (from the district table) where salary is greater than 10000.
#Return columns as district_name and average_salary.
select A2 as district, A11 as avg_salary from bank.district
where A11>10000;

select * from district
limit 10;

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

