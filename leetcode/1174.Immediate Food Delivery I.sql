with q as (
    select 
        customer_id,
        min(order_date)
    from 
        Delivery
    group by 1 
    )

select 
    round(100* sum(case when order_date = customer_pref_delivery_date then 1 else 0 end)/COUNT(*) ,2) as immediate_percentage
from 
    Delivery
where 
    (customer_id, order_date ) in (select * from q)
