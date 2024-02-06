#1번 풀이
with q as (
  select 
    a.user_id, count(a.user_id) as count_user
    ,count(case when action = 'confirmed' then 1 end) as count_confirmed
  from
    Signups a 
  left join Confirmations b 
    on a.user_id = b.user_id
  group by a.user_id
)

select user_id, round((count_confirmed / count_user),2) AS confirmation_rate
from q

#2번 풀이

WITH q AS(
    select
        s.user_id,
        count(s.user_id) as user_count,
        sum(case when c.action='confirmed' then 1 else 0 end) AS confirmed_count
    FROM
        Confirmations c
        RIGHT JOIN Signups s
            ON c.user_id = s.user_id
    GROUP BY
        s.user_id
)

select user_id, round((confirmed_count / user_count), 2) as confirmation_rate
from q 
