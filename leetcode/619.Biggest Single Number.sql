-- 1번 풀이
-- 2번 풀이의 실행 시간이 더 빠름
select 
    max(num) as num
from 
    (select num
    from MyNumbers
    group by num
    having count(*) = 1 )

  -- 2번 풀이
select max(case when num_appear = 1 then num end) as num  
from 
  (select num, count(*) as num_appear
  from MyNumbers
  group by num );
