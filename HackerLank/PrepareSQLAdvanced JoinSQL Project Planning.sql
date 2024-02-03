#1번 풀이 
select min(start_date), max(end_date)
from (
    select t.*, sum(flag) over (order by end_date) as sum_flag
    from (
        select start_date, end_date,
        case when LAG(end_date) OVER (ORDER BY end_date) = end_date - 1 then 0 else 1 end as flag
        from Projects) as t
    ) q
group by sum_flag
order by max(end_date) - min(start_date) asc 

#2번 풀이
SELECT 
    Start_Date,
    MIN(End_Date)
FROM (SELECT Start_Date
      FROM Projects
      WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) s,
     (SELECT End_Date
      FROM Projects
      WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) e
WHERE 1=1
    AND Start_Date<End_Date
GROUP BY
    Start_Date
ORDER BY
    DATEDIFF(MIN(End_Date),Start_Date)
