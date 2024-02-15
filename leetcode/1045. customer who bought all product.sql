
-- first trial -> fail
-- in 연산자를 사용하면 모든 customer_id가 나오게 됨
select 
  customer_id
from 
  customer
where 
  product_key in (select * from product)


  -- second trial -> success
  -- product 테이블의 product_key 갯수와 customer 테이블의 product_key 갯수가 동일한 경우의 customer_id를 추출함 
  -- 주의) distnct 를 써줘야 test case 모두 통과 
  
select 
    customer_id 
from 
    customer 
group by 1 
having count(distinct product_key) =  (select count(*) from product)
