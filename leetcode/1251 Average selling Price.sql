WITH cte AS (SELECT A.product_id, price, 
COALESCE(units, 0) AS units
FROM Prices A 
LEFT JOIN UnitsSold B on A.product_id = B.product_id
WHERE PURCHASE_DATE BETWEEN START_DATE AND END_DATE
or PURCHASE_DATE is null)

select product_id, 
  CASE 
    WHEN SUM(units) <> 0 THEN ROUND(SUM(price * units) / SUM(units)::numeric, 2)
    ELSE 0 
  END AS average_price
from cte
group by 1
