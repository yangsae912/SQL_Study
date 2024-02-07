# 1번 풀이 
with q as 
    (select 
        project_id, 
        a.employee_id, 
        name, 
        experience_years
    from 
        Project a 
    left join 
        Employee b 
    on a.employee_id = b.employee_id
    )
select 
    project_id, 
    round(avg(experience_years),2) as average_years
from q
group by 1 
order by 1

  
# 2번 풀이 

select 
    distinct project_id,
    round(avg(experience_years) over(partition by project_id),2) as average_years
from 
    project as p 
inner join employee as e
on p.employee_id = e.employee_id
