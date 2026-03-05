select u.full_name, sum(l.emi)/u.monthly_income as debt_ratio 
from users u join loans l on u.id = l.user_id 
group by u.full_name, u.monthly_income;

select u.full_name, SUM(l.emi)/u.monthly_income as ratio,
case
	when sum(l.emi)/u.monthly_income < 0.3 then 'LOW RISK'
	when sum(l.emi)/u.monthly_income between 0.3 and 0.6 then 'MEDIUM RISK'
	else 'HIGH RISK'
END AS risk_level
from users u 
join loans l on u.id = l.user_id
group by u.full_name, u.monthly_income;
