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