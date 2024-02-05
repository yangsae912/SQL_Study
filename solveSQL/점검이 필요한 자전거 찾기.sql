select bike_id
from rental_history
WHERE strftime('%Y-%m-%d', rent_at) >= '2021-01-01' 
and strftime('%Y-%m-%d', return_at) <= '2021-01-31' 
GROUP BY 1 
HAVING sum(distance) >= 50000

