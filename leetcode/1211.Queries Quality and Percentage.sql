-- 1번 풀이
with q as 
    (select 
        query_name, 
        sum((rating/position)) as a,
        count(*) as b,
        count(case when rating < 3 then 1 end) as c
    from 
        Queries
    where 
        query_name is not null
    group by 
        query_name)

select 
    query_name,
    round(a/b, 2) as quality,
    round(c/b * 100, 2) as poor_query_percentage
from q 



-- 2번 풀이
  
SELECT  query_name,
        ROUND(AVG(rating/position),2) AS quality, 
        ROUND(AVG(IF(rating < 3, 1, 0))*100,2) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY query_name
