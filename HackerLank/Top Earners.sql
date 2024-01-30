-- subquery
select (months * salary) as earnings, count(distinct employee_id)
from employee
where (months * salary) = (
    select max(months * salary) as earnings
    from employee)
group by 1

-- with 

with query as (
    select max(months * salary) as earnings
    from employee
)

select (months * salary) as earnings, count(distinct employee_id)
from employee
where (months * salary) = (select query from max_earnings)
group by 1;
