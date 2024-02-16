--  1번 풀이 left join 사용
select 
    a.employee_id,
    a.name,
    count(b.employee_id) as reports_count,
    round(avg(age)) as average_age
from (select employee_id,name from Employees) a 
left join Employees b on a.employee_id = b.reports_to
group by 1,2
having count(b.employee_id) >= 1
order by 1 


-- 2번 풀이 inner join 사용 -> having 절 필요 없음
-- 1번 풀이보다 속도 더 빠름

select
    a.employee_id,
    a.name,
    COUNT(b.employee_id) AS reports_count,
    ROUND(AVG(b.age)) AS average_age
from Employees a
inner join Employees b ON a.employee_id = b.reports_to
GROUP BY 1,2
ORDER BY 1
