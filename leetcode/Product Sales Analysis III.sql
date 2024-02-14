select 
    a.product_id, 
    year as first_year,
    quantity,
    price
from 
    sales a 
left join product b on a.product_id = b.product_id
where (a.product_id, year) in (select product_id, min(year) from sales group by 1 )
