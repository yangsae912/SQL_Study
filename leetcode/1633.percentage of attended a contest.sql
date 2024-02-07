select contest_id, round((count(*) * 100.0) / (select count(user_id) from users),2) as percentage
from register r 
left join users u 
on r.user_id = u.user_id
group by contest_id
order by 
    percentage desc, contest_id asc
