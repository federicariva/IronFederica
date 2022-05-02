#checking for understanding 
#3.01, activity 3
#Get a list of all the district names in the bank database. 
-- A suggestion is to use the files_for_activities/case_study_extended here to work out which column is required here because we are looking for the names of places, not just the IDs. You should have 77 rows.
#Bonus: Revise your query to also show the Region, and limit the results to just 30 rows.
use bank;
select distinct a2 from district;
select distinct a2, a3 from district;

#3.01 Activity 4
#Get again the district names and the regions 
#but use aliases to display the corresponding columns as district_name and region_name respectively. 
#Limit the query to the first 30 rows.
select distinct a2 as district_name, a3 as region_name 
from district
limit 30;

#Get all the types of the card as type_of_card and the issue date as issue_date from card client and alias the table as bc.
select distinct type, issued as issue_date from card as bc;

#3.02 Activity 1
#Select districts and salaries (from the district table) where salary is greater than 10000. 
#Return columns as district_name and average_salary.
select a2 as district_name, a4 as average_salary from district
where a4 > 10000;

#Select those loans whose contracts finished and were not paid. 
-- Hint: You should be looking at the loan column and you will need the extended case study information to tell you which value of status is required.
select * from loan
where status = 'B';

#Select cards of type junior. Return just the first 10 in your query.
Select * from card
where type = 'junior'
limit 10;

#Select those loans whose contract is finished and not paid back. 
#Return the debt value from the status you identified in the last activity, together with loan id and account id.
select * from loan;


#Calculate the urban population for all districts. 
-- Hint: You are looking for the number of inhabitants and the % of urban inhabitants in each district. 
-- Return columns as district_name and urban_population.
select * from district;
select a2 as district_name, (a10*a4)/100 as urban_population
from district;

#On the previous query result - rerun it but filter out districts where the rural population is greater than 50%.
select a2 as district_name, (a10*a4)/100 as urban_population
from district
where a10 < 50;
