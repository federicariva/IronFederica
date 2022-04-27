#Get all junior cards issued later than the last year. Hint: Use the numeric value (980000).
select * from card
where type = 'junior' and issued > 980000;

#Get the first 10 transactions for withdrawals that are in cash. 
#You will need the extended case study information to tell you which values are required here, 
#and you will need to refer to conditions on two columns.