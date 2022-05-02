use bank;
-- amount moved, number of transactions, number of loans
select * from loan;
select * from trans;

create view trans_status_date as
select account_id, client_id, trans_id, amount, status, date
from trans t
inner join account a using (account_id)
join loan l using (account_id)
inner join disp d using (account_id)
where disp.type = 'OWNER'


DROP TABLE IF EXISTS bad_good; 
drop view if exists bad_good3;


# view bad_good3 as
select account_id, trans_id, tr.date as date_trans, operation, tr.amount as amount_trans, loan_id, l.date as date_loan, l.amount as amnt_loan, payments, duration as loan_dur, status from trans tr
inner join loan l
using(account_id);
