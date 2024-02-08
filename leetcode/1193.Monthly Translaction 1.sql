 -- 1번 풀이
select 
    TO_CHAR(trans_date, 'YYYY-MM') as month, 
    country,
    count(*) as trans_count,
    count(case when state = 'approved' then 1 end) as approved_count,
    --  count(case when state = 'approved' then 1 else 0 end) 를 하면 sum()과 달리 0 또한 카운트되기에 안된다. 
    sum(amount)as trans_total_amount,
    sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from 
    Transactions
group by 
    1, 2


-- 2번 풀이

select TO_CHAR(trans_date, 'YYYY-MM') AS month,
        country,
        count(trans_date) as trans_count,
        sum(case when state='approved' then 1 else 0 end) as approved_count,
        sum(amount) as trans_total_amount,
        sum(case when state='approved' then amount else 0 end) as approved_total_amount


from Transactions

group by month, country 
