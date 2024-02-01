
-- 1번 풀이 
select 
    case when id % 2 = 1 AND id != (SELECT MAX(ID) FROM seat) then
         id + 1
         when id % 2 = 0 then
         id - 1
         else id 
    end as id, student
from seat a
order by id asc

-- 2번 풀이 inner join 
SELECT 
    CASE 
        WHEN a.id % 2 = 1 AND a.id != (SELECT MAX(ID) FROM seat) THEN a.id + 1
        WHEN a.id % 2 = 1 AND a.id = (SELECT MAX(ID) FROM seat) THEN a.id 
        WHEN a.id % 2 = 0 THEN a.id - 1
    END AS id,
    b.student
FROM seat a
JOIN seat b ON a.id = b.id
ORDER BY id ASC
