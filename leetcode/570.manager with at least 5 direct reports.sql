select name
from employee
where id in (select managerid
from employee
group by managerid
having count(managerid) >= 5)

with q as (
    select managerid
    from employee
    group by managerid
    having count(*) >= 5

)

select name 
from employee as e
inner join q 
on e.id = q.managerId
