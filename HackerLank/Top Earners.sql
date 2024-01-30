select (months * salary) as earnings, count(distinct employee_id)
from employee
where (months * salary) = (
    select max(months * salary) as earnings
    from employee)
group by 1
