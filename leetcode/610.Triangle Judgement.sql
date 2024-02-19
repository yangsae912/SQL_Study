-- 1번 풀이
select *,
    case when x+y > z and y+z > x and z+x > y then 'Yes' else "No"
    end as triangle
from Triangle


-- 2번 풀이

select *, 
    IF(x+y > z and y+z > x and z+x > y, "Yes", "No") as triangle
from Triangle
