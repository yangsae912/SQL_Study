#olist_order_items_dataset 테이블에는 주문 안에 어떤 상품이 포함되어 있는지, 상품의 판매자는 누구인지 등 상품 단위의 데이터가 들어있습니다.
#상품 가격이 50달러 이상인 주문이 100건 이상 들어온 판매자 리스트를 주문 건수가 많은 순서대로 출력하는 쿼리를 작성해주세요.

select 
  seller_id,
  count(DISTINCT order_id) as orders
from olist_order_items_dataset
where 
  price >= 50.0 
group by 1
having count(DISTINCT order_id) >= 100
order by 2 desc