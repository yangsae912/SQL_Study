-- 1번 풀이
WITH q AS (
    SELECT
        num,
        lead(num, 1) over() num1,
        lead(num, 2) over() num2
    FROM logs
)
SELECT 
    distinct num AS ConsecutiveNums
FROM 
    q 
WHERE 
    num = num1 
    and num = num2
  
-- 2번 풀이

select 
    distinct(log1.num) as ConsecutiveNums
from 
    logs log1,
    logs log2,
    logs log3
    
where log1.id + 1 = log2.id 
    and log2.id + 1 = log3.id 
    and log1.num = log2.num 
    and log2.num = log3.num
