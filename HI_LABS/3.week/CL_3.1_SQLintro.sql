Select 'hello world';

select 546/457;

#Use an appropriate select statement to retrieve a list of unique card types 
#from the bank database, table card. (Hint: You can use the DISTINCT function here.)
select distinct type from card;

#Get a list of all the district names in the bank database. 
#A suggestion is to use the files_for_activities/case_study_extended here to work out which column is required here because we are looking for the names of places, not just the IDs. 
#You should have 77 rows.
select distinct A2 from district;

#Bonus: Revise your query to also show the Region, and limit the results to just 30 rows.
select distinct A2, A3 from district
limit 30;

select A2 as district_name, A3 as region_name from district
limit 30;

#Get all the types of the card as type_of_card and the issue date as issue_date from card client and alias the table as bc
Select type as type_of_card, issued as issue_date 
from card as bc; 

