# 풀이 1

select a.machine_id, round(avg(a.timestamp - b.timestamp)::numeric ,3) as processing_time
from Activity a
left join (
    select machine_id, timestamp
    from Activity
    where activity_type = 'start'
) as b
on a.machine_id = b.machine_id
where a.activity_type = 'end'
group by 1

# 풀이 2

select a1.machine_id, ROUND(avg(a2.timestamp-a1.timestamp):: Numeric, 3) as processing_time
from Activity a1, Activity a2
where a1.machine_id=a2.machine_id and a1.process_id = a2.process_id and a1.activity_type = 'start' and a2.activity_type = 'end'
group by 1
order by 1 asc
