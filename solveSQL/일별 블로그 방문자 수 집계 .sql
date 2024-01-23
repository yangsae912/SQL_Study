select 
  event_date_kst as dt,
  count(DISTINCT user_pseudo_id) as users
from ga 
WHERE
  event_date_kst >= '2021-08-02'
  and event_date_kst <= '2021-08-09'
group by 1
order by 1 