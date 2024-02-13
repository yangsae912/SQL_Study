


WITH 
  t AS (
          select player_id, min(event_date) as event_date
          from Activity
          group by player_id
  -- 첫 번째로 로그인 한 날의 다음날이 있는지 없는지 구하는 문제이므로 첫 번째 로그인 한 날짜를 min()를 통해 구한다. 

)
, q AS (
          select 
              distinct t.player_id
          from 
              t
          inner join 
              Activity b on t.player_id = b.player_id 
              and date_add(t.event_date, interval 1 day)  = b.event_date
  --  t.event_date + 1 = b.event_date 로 하게 되면 min(event_date)가 2월 29일 때 에러가 뜨게 된다. 
  --  2월 29일 이후가 3월 1일이기 때문이다. 따라서 date_add() 나 date_sub() 함수를 사용해야 한다. 
)

  
select 
    round(count(distinct q.player_id) / count(distinct c.player_id), 2) as fraction
from 
    Activity c
left join 
    q on c.player_id = q.player_id
