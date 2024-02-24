select 
  date(order_delivered_carrier_date) as delivered_carrier_date,
  count(*) as orders
from 
  olist_orders_dataset
where 
  order_delivered_customer_date is null 
  and strftime('%Y-%m', order_delivered_carrier_date) = '2017-01'
group by 
  date(order_delivered_carrier_date)
